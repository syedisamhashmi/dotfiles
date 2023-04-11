#!/bin/bash

osx_install_and_setup()
{
    # For access to `rg` for recursive pattern matching
    brew install ripgrep;
    # For access to LaTeX on a mac.
    brew install --cask mactex;
    # For access to `kubectl`
    brew install kubernetes-cli@1.22
    # For access to the `az` command
    brew install azure-cli
    # For access to nvm
    brew install nvm

    # Why does apple make things hard.
    brew install grep
    brew install gnu-sed

    # Set default git branch name to main.
    git config --global init.defaultBranch main
    git config --global user.name "Syed Isam Hashmi"
}