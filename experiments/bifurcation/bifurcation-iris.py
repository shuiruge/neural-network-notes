# Examine bifurcation during the optimization in extremely high-dimension space.


# -------- Dataset --------- #

from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler

iris = load_iris()
X = iris['data']
y = iris['target']
names = iris['target_names']
feature_names = iris['feature_names']
n_targets = 3

# Scale data to have mean 0 and variance 1 
# which is importance for convergence of the neural network
scaler = StandardScaler()
X_train = scaler.fit_transform(X)
y_train = y


# -------- Model --------- #

from flax import linen as nn
import optax
import jax
import jax.numpy as jnp

class FFD(nn.Module):

  @nn.compact
  def __call__(self, x):
    x = x.reshape(x.shape[0], -1)  # flatten
    x = nn.Dense(features=512)(x)
    #x = nn.relu(x)
    x = nn.silu(x)
    #x = nn.sigmoid(x)
    x = nn.Dense(features=n_targets)(x)
    return x

model = FFD()
optimizer = optax.adam(learning_rate=1e-3)

@jax.jit
def train_step(params, state):
  """Train for a single step."""
  def loss_fn(params):
    logits = model.apply(params, X_train)
    loss = optax.softmax_cross_entropy_with_integer_labels(
        logits=logits, labels=y_train).mean()
    return loss
  grads = jax.grad(loss_fn)(params)
  updates, new_state = optimizer.update(grads, state, params)
  new_params = optax.apply_updates(params, updates)
  return new_params, new_state, grads

def fit(params, epochs=100):
  state = optimizer.init(params)
  for epoch in range(epochs):
    params, state, *_ = train_step(params, state)
  return params

def training_loss(params):
  logits = model.apply(params, X_train)
  loss = optax.softmax_cross_entropy_with_integer_labels(
    logits=logits, labels=y_train).mean()
  return loss

def training_accuracy(params):
  predicted_class = jnp.argmax(model.apply(params, X_train), axis=1)
  return jnp.mean(predicted_class == y_train)


# -------- Bifurcation --------- #

import matplotlib.pyplot as plt
from jax import random

def add_noise(scale):
  def add(x):
    std_normal = random.truncated_normal(random.key(42), -1, 1, x.shape)
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
params = fit(init_params, epochs=0)

perturbed_init_params = jax.tree_map(add_noise(1e-2), init_params)
perturbed_params = fit(perturbed_init_params, epochs=0)

print(training_loss(params))
print(training_loss(perturbed_params))

print(training_accuracy(params))
print(training_accuracy(perturbed_params))

if True:
  plot_difference(params['params']['Dense_0']['kernel'],
                  perturbed_params['params']['Dense_0']['kernel'])
  plot_difference(params['params']['Dense_0']['bias'],
                  perturbed_params['params']['Dense_0']['bias'])
  plot_difference(params['params']['Dense_1']['kernel'],
                  perturbed_params['params']['Dense_1']['kernel'])
  plot_difference(params['params']['Dense_1']['bias'],
                  perturbed_params['params']['Dense_1']['bias'])

def loss_fn(params):
  logits = model.apply(params, X_train)
  loss = optax.softmax_cross_entropy_with_integer_labels(
      logits=logits, labels=y_train).mean()
  return loss

grads = jax.grad(loss_fn)(params)
grads['params']['Dense_0']['bias'][:]

for i in range(100):
  grads2 = jax.grad(lambda x: jax.grad(loss_fn)(x)['params']['Dense_0']['bias'][i])(params)
  if grads2['params']['Dense_0']['bias'][i] < 0:
    print(grads['params']['Dense_0']['bias'][i], grads2['params']['Dense_0']['bias'][i])
