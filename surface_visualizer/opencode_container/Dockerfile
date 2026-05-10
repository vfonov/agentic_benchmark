FROM ubuntu:24.04

# 1. Install dependencies as root
RUN apt-get update && apt-get install -y \
    curl git build-essential \
    kitty-terminfo kitty-shell-integration \
    git \
    nodejs npm nano \
    g++ bc valgrind gdb \
    cmake \
    bison flex \
    libjpeg-dev \
    clang-tidy \
    xxd file zip unzip file \
    dcmtk \
    xxd file clangd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# 2. Create a non-root user matching the standard host UID (1000)
ARG USER_ID=1000
ARG GROUP_ID=1000

# RUN groupadd -g ${GROUP_ID} vfonov && \
#     useradd -m -u ${USER_ID} -g vfonov -s /bin/bash vfonov

RUN usermod -l vfonov ubuntu && \
    groupmod -n vfonov ubuntu && \
    usermod -d /home/vfonov -s /bin/bash vfonov && \
    git config --global user.name "Vladimir S. Fonov" && \
    git config --global user.email "vladimir.fonov@gmail.com"

# 3. Create global directories for npm and OpenCode so the non-root user can write to them
RUN mkdir -p /home/vfonov/.npm-global && \
    mkdir -p /home/vfonov/.config/opencode && \
    mkdir -p /home/vfonov/.local/share/opencode && \
    chown -R vfonov:vfonov /home/vfonov

# 4. Configure npm to use the user-writable folder
USER vfonov
ENV NPM_CONFIG_PREFIX=/home/vfonov/.npm-global
ENV PATH=$PATH:/home/vfonov/.npm-global/bin
ENV EDITOR=nano

# Install OpenCode
RUN npm install i -g opencode-ai@latest # current version is v1.30.0

WORKDIR /app
CMD ["/bin/bash"]
