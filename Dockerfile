FROM archlinux:multilib-devel

RUN pacman --noconfirm -Syu

ARG GIT_GLOBAL_USERNAME
ARG GIT_GLOBAL_EMAIL

ENV LANG=en_UK.UTF-8
ENV TZ=Europe/Helsinki

RUN pacman --noconfirm -S \
    neovim \
    git \
    tree \
    libxml2 \
    ripgrep \
    fd \
    tldr \
    wget \
    curl \
    make \
    gcc \
    npm \
    rustup \
    inetutils \
    bat \
    git-delta \
    fzf \
    unzip \
    python-pip \
    python-setuptools \
    nushell \
    starship

COPY ./.config/. /root/.config/

RUN mkdir /root/workspace

RUN git config --global --add safe.directory "*"

RUN git config --global user.name ${GIT_GLOBAL_USERNAME}
RUN git config --global user.email ${GIT_GLOBAL_EMAIL}

# Avoid container exit.
CMD ["tail", "-f", "/dev/null"]
