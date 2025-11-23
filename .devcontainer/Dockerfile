FROM mcr.microsoft.com/devcontainers/base:alpine-3.20

# Install additional dependencies
RUN apk add --no-cache ruby ruby-dev build-base

USER vscode
RUN gem install jekyll bundler
RUN echo 'export PATH="$HOME/.local/share/gem/ruby/3.3.0/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc