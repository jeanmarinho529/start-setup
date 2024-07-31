#!/bin/bash

# pyenv
sudo apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    llvm \
    gettext \
    libncurses5-dev \
    tk-dev \
    tcl-dev \
    blt-dev \
    libgdbm-dev \
    python3-dev \
    aria2 \
    lzma \
    liblzma-dev \
    gnome-keyring


curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash

if ! grep -q "# pyenv" ~/.bashrc; then
    cat << 'EOF' >> ~/.bashrc


# pyenvv
export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"
export PATH="${HOME}/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
EOF
fi

if [ -f ~/.zshrc ]; then
    if ! grep -q "# pyenv" ~/.zshrc; then
        cat << 'EOF' >> ~/.zshrc


# pyenv
export PYTHON_BUILD_ARIA2_OPTS="-x 10 -k 1M"
export PATH="${HOME}/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
EOF
    fi
fi

# poetry
curl -sSL https://install.python-poetry.org | python3 -

if ! grep -q "# poetry" ~/.bashrc; then
    cat << 'EOF' >> ~/.bashrc


# poetry
export PATH="$HOME/.poetry/bin:$PATH"
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
EOF
fi

if [ -f ~/.zshrc ]; then
    if ! grep -q "# poetry" ~/.zshrc; then
        cat << 'EOF' >> ~/.zshrc


# poetry
export PATH="$HOME/.poetry/bin:$PATH"
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
EOF
    fi
fi