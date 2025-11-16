# Examine bifurcation during the optimization in extremely high-dimension space.


# -------- Dataset --------- #

import numpy as np
import jax
import jax.numpy as jnp
from jax import random
from jax.tree_util import tree_map
from torch.utils.data import DataLoader, default_collate
from torchvision.datasets import MNIST

batch_size = 32

def numpy_collate(batch):
  """
  Collate function specifies how to combine a list of data samples into a batch.
  default_collate creates pytorch tensors, then tree_map converts them into numpy arrays.
  """
  return tree_map(np.asarray, default_collate(batch))

def reshape_cast(pic):
  """Output shape: [None, 28, 28, 1]."""
  return np.expand_dims(np.array(pic, dtype=jnp.float32), axis=-1)

# Define our dataset, using torch datasets
mnist_dataset = MNIST('/tmp/mnist/', download=True, transform=reshape_cast)
# Create pytorch data loader with custom collate function
data_generator = DataLoader(mnist_dataset, batch_size=batch_size, collate_fn=numpy_collate)
X_train = np.expand_dims(np.array(mnist_dataset.train_data), axis=-1)
y_train = np.array(mnist_dataset.train_labels)


# -------- Model --------- #

from flax import linen as nn  # Linen API
from flax.training import train_state
from flax import struct
import optax

class CNN(nn.Module):
  """A simple CNN model."""

  @nn.compact
  def __call__(self, x):
    x = nn.Conv(features=32, kernel_size=(3, 3))(x)
    #x = nn.relu(x)
    x = nn.silu(x)
    x = nn.avg_pool(x, window_shape=(2, 2), strides=(2, 2))
    x = nn.Conv(features=64, kernel_size=(3, 3))(x)
    #x = nn.relu(x)
    x = nn.silu(x)
    x = nn.avg_pool(x, window_shape=(2, 2), strides=(2, 2))
    x = x.reshape((x.shape[0], -1))  # flatten
    x = nn.Dense(features=256)(x)
    #x = nn.relu(x)
    x = nn.silu(x)
    x = nn.Dense(features=10)(x)
    return x

class FFD(nn.Module):
  """Faster than CNN."""

  @nn.compact
  def __call__(self, x):
    x = x.reshape(x.shape[0], -1)  # flatten
    x = nn.Dense(features=512)(x)
    #x = nn.relu(x)
    x = nn.silu(x)
    x = nn.Dense(features=10)(x)
    return x

model = CNN()
#model = FFD()
#optimizer = optax.sgd(1e-3)
optimizer = optax.adam(1e-3)
#optimizer = optax.adamw(1e-3, weight_decay=1e-1)

@jax.jit
def train_step(params, state, batch):
  """Train for a single step."""
  def loss_fn(params):
    logits = model.apply(params, batch['images'])
    loss = optax.softmax_cross_entropy_with_integer_labels(
        logits=logits, labels=batch['labels']).mean()
    return loss
  grads = jax.grad(loss_fn)(params)
  updates, new_state = optimizer.update(grads, state, params)
  new_params = optax.apply_updates(params, updates)
  return new_params, new_state, grads

def fit(params, epochs=3, max_step=None):
  state = optimizer.init(params)
  step = 1
  for epoch in range(epochs):
    for images, labels in data_generator:
      batch = {'images': images, 'labels': labels}
      params, state, *_ = train_step(params, state, batch)
      step += 1
      if max_step and step > max_step:
          return params
  return params

def training_loss(params):
  logits = model.apply(params, X_train[:batch_size*100])
  loss = optax.softmax_cross_entropy_with_integer_labels(
    logits=logits, labels=y_train[:batch_size*100]).mean()
  return loss

def training_accuracy(params):
  predicted_class = jnp.argmax(model.apply(params, X_train[:batch_size*100]), axis=1)
  return jnp.mean(predicted_class == y_train[:batch_size*100])


# -------- Bifurcation --------- #

import matplotlib.pyplot as plt

def add_noise(scale):
  def add(x):
    # 3-sigma truncation.
    std_normal = random.truncated_normal(random.key(42), -3, 3, x.shape)
    return x * (1 + scale * std_normal)
  return add

def relative_diff(x, y, precision):
  sum_ = jnp.abs(x) + jnp.abs(y)
  denom = jnp.where(sum_ > precision, sum_, precision)
  return jnp.abs(x - y) / denom

def plot_difference(x, y, precision=1e-2):
  abs_diff = jnp.abs(x - y)
  rel_diff = relative_diff(x, y, precision)
  # Plot
  fig, axs = plt.subplots(2, 1)
  axs[0].hist(abs_diff.reshape([-1]), bins=100)
  axs[1].hist(rel_diff.reshape([-1]), bins=100)
  plt.show()


init_params = model.init(random.key(42), X_train[:10])
#init_params = jax.tree_map(add_noise(1e-1), init_params)
params = fit(init_params, epochs=2, max_step=None)

perturbed_init_params = jax.tree_map(add_noise(1e-2), init_params)
perturbed_params = fit(perturbed_init_params, epochs=2, max_step=None)

print(training_loss(params))
print(training_loss(perturbed_params))

print(training_accuracy(params))
print(training_accuracy(perturbed_params))

if isinstance(model, CNN):
  plot_difference(params['params']['Conv_0']['kernel'],
                  perturbed_params['params']['Conv_0']['kernel'])
  plot_difference(params['params']['Conv_0']['bias'],
                  perturbed_params['params']['Conv_0']['bias'])
  plot_difference(params['params']['Conv_1']['kernel'],
                  perturbed_params['params']['Conv_1']['kernel'])
  plot_difference(params['params']['Conv_1']['bias'],
                  perturbed_params['params']['Conv_1']['bias'])
elif isinstance(model, FFD):
  plot_difference(params['params']['Dense_0']['kernel'],
                  perturbed_params['params']['Dense_0']['kernel'])
  plot_difference(params['params']['Dense_0']['bias'],
                  perturbed_params['params']['Dense_0']['bias'])
  plot_difference(params['params']['Dense_1']['kernel'],
                  perturbed_params['params']['Dense_1']['kernel'])
  plot_difference(params['params']['Dense_1']['bias'],
                  perturbed_params['params']['Dense_1']['bias'])
else:
    pass

def loss_fn(params):
  logits = model.apply(params, X_train[:batch_size])
  loss = optax.softmax_cross_entropy_with_integer_labels(
      logits=logits, labels=y_train[:batch_size]).mean()
  return loss

if isinstance(model, CNN):
  grads = jax.grad(loss_fn)(params)
  for i in range(100):
    grads2 = jax.grad(
        lambda x: jax.grad(loss_fn)(x)['params']['Conv_0']['kernel'][1,1,0,i]
    )(params)
    if grads2['params']['Conv_0']['kernel'][1,1,0,i] > 0:
      print(grads['params']['Conv_0']['kernel'][1,1,0,i],
            grads2['params']['Conv_0']['kernel'][1,1,0,i])
  for i in range(100):
    grads2 = jax.grad(
        lambda x: jax.grad(loss_fn)(x)['params']['Conv_0']['kernel'][1,1,0,i]
    )(params)
    if grads2['params']['Conv_0']['kernel'][1,1,0,i] < 0:
      print(grads['params']['Conv_0']['kernel'][1,1,0,i],
            grads2['params']['Conv_0']['kernel'][1,1,0,i])
elif isinstance(model, FFD):
  grads = jax.grad(loss_fn)(params)
  for i in range(100):
    grads2 = jax.grad(
        lambda x: jax.grad(loss_fn)(x)['params']['Dense_1']['kernel'][1,1]
    )(params)
    if grads2['params']['Dense_1']['bias'][i] > 0:
      print(grads['params']['Dense_1']['bias'][i],
            grads2['params']['Dense_1']['bias'][i])
  for i in range(100):
    grads2 = jax.grad(
        lambda x: jax.grad(loss_fn)(x)['params']['Dense_1']['bias'][i]
    )(params)
    if grads2['params']['Dense_1']['bias'][i] < 0:
      print(grads['params']['Dense_1']['bias'][i],
            grads2['params']['Dense_1']['bias'][i])
else:
  pass
