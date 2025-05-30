# shell.nix
with import <nixpkgs> { };
let
  pythonPackages = python312Packages;
in pkgs.mkShell rec {
  name = "bifurcation";
  buildInputs = [
    pythonPackages.python
    # for testing
    pythonPackages.numpy
    pythonPackages.jax
    pythonPackages.flax
    pythonPackages.optax
    pythonPackages.matplotlib
    # for loading datasets.
    pythonPackages.scikit-learn
    pythonPackages.torch
    pythonPackages.torchvision
  ];
}
