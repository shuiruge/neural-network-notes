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
random_key = 42

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
training_generator = DataLoader(mnist_dataset, batch_size=batch_size, collate_fn=numpy_collate)
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
    x = nn.relu(x)
    x = nn.avg_pool(x, window_shape=(2, 2), strides=(2, 2))
    x = nn.Conv(features=64, kernel_size=(3, 3))(x)
    x = nn.relu(x)
    x = nn.avg_pool(x, window_shape=(2, 2), strides=(2, 2))
    x = x.reshape((x.shape[0], -1))  # flatten
    x = nn.Dense(features=256)(x)
    x = nn.relu(x)
    x = nn.Dense(features=10)(x)
    return x

class FFD(nn.Module):
  """Faster than CNN."""

  @nn.compact
  def __call__(self, x):
    x = x.reshape(x.shape[0], -1)  # flatten
    x = nn.Dense(features=512)(x)
    x = nn.relu(x)
    x = nn.Dense(features=10)(x)
    return x

def fit(model: nn.Module, params, learning_rate=1e-3, epochs=3):
  optimizer = optax.adam(learning_rate)
  #optimizer = optax.adamw(learning_rate, weight_decay=1e-1)
  state = optimizer.init(params)

  @jax.jit
  def train_step(params, state, batch):
    """Train for a single step."""
    def loss_fn(params):
      logits = model.apply(params, batch['images'])
      loss = optax.softmax_cross_entropy_with_integer_labels(
          logits=logits, labels=batch['labels']).mean()
      return loss
    grads = jax.grad(loss_fn)(params)
    #updates, new_state = optimizer.update(grads, state)
    updates, new_state = optimizer.update(grads, state, params)
    new_params = optax.apply_updates(params, updates)
    return new_params, new_state

  for epoch in range(epochs):
    for X, y in training_generator:
      batch = {'images': X, 'labels': y}
      params, state = train_step(params, state, batch)
  return params

def training_loss(model, params):
  logits = model.apply(params, X_train)
  loss = optax.softmax_cross_entropy_with_integer_labels(
    logits=logits, labels=y_train).mean()
  return loss

def training_accuracy(model, params):
  predicted_class = jnp.argmax(model.apply(params, X_train), axis=1)
  return jnp.mean(predicted_class == y_train)


# -------- Bifurcation --------- #

import matplotlib.pyplot as plt

def add_noise(scale):
  def add(x):
    std_normal = random.truncated_normal(random.key(random_key), -1, 1, x.shape)
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

#model = CNN()
model = FFD()

init_params = model.init(random.key(random_key), X_train[:10])
#init_params = jax.tree_map(add_noise(1e-1), init_params)
params = fit(model, init_params, epochs=3)

perturbed_init_params = jax.tree_map(add_noise(1e-2), init_params)
perturbed_params = fit(model, perturbed_init_params, epochs=3)

print(training_loss(model, params))
print(training_loss(model, perturbed_params))

print(training_accuracy(model, params))
print(training_accuracy(model, perturbed_params))

if True:
  plot_difference(params['params']['Dense_0']['kernel'],
                  perturbed_params['params']['Dense_0']['kernel'])
  plot_difference(params['params']['Dense_0']['bias'],
                  perturbed_params['params']['Dense_0']['bias'])
  plot_difference(params['params']['Dense_1']['kernel'],
                  perturbed_params['params']['Dense_1']['kernel'])
  plot_difference(params['params']['Dense_1']['bias'],
                  perturbed_params['params']['Dense_1']['bias'])
