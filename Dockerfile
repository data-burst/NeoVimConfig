FROM node:22.14-alpine

WORKDIR /app
USER root

RUN apk update && \
    apk add neovim ripgrep nerd-fonts python3 py3-pip git build-base cmake && \
    ln -sf python3 /usr/bin/python && \
    mkdir -p ~/.config/nvim


