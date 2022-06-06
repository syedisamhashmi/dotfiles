#!/bin/bash

# Add homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add dotnet.
export PATH="$HOME/.dotnet:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export DOTNET_ROOT="$HOME/.dotnet"