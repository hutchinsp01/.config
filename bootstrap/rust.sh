#!/bin/bash
# Install Rust

# Check for Homebrew, install if we don't have it

function install_rust() {
    if [ -e ~/.cargo ]; then
        echo "Rust is already installed."
    else
        echo "Installing Rust."
        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    fi
}

install_rust

# Install applications
cargo install kanata

