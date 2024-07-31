#!/bin/bash

wget https://golang.org/dl/go1.22.5.linux-amd64.tar.gz

sudo tar -C /usr/local -xzf go1.22.5.linux-amd64.tar.gz


if ! grep -q "# go" ~/.bashrc; then
    cat << 'EOF' >> ~/.bashrc


# go
export PATH=$PATH:/usr/local/go/bin
EOF
fi

if [ -f ~/.zshrc ]; then
    if ! grep -q "# go" ~/.zshrc; then
        cat << 'EOF' >> ~/.zshrc


# go
export PATH=$PATH:/usr/local/go/bin
EOF
    fi
fi

sudo rm ./go1.22.5.linux-amd64.tar.gz
