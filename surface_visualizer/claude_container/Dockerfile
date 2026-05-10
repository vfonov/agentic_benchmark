FROM ubuntu:24.04

# 1. Install dependencies as root
RUN apt-get update && apt-get install -y \
    curl git build-essential \
    libglfw3-dev libgl1-mesa-dev \
    kitty-terminfo kitty-shell-integration \
    git \
    nodejs npm nano \
    g++ bc valgrind gdb \
    fzf aggregate cargo-1.91 \
    cmake \
    bison flex \
    libx11-dev x11proto-core-dev \
    libxi6 libxi-dev \
    libxmu6 libxmu-dev libxmu-headers \
    libgl1-mesa-dev libglu1-mesa-dev \
    libjpeg-dev \
    clang-tidy \
    xxd file libosmesa6-dev clangd \
    ninja-build \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# 2. Create a non-root user matching the standard host UID (1000)
ARG USER_ID=1000
ARG GROUP_ID=1000

# RUN groupadd -g ${GROUP_ID} vfonov && \
#     useradd -m -u ${USER_ID} -g vfonov -s /bin/bash vfonov

RUN usermod  -l vfonov ubuntu && \
    groupmod -n vfonov ubuntu && \
    usermod  -d /home/vfonov -s /bin/bash vfonov
    #&& \
    #usermod -aG sudo vfonov

RUN mkdir -p /home/vfonov/.local/share/claude && \
    mkdir -p /home/vfonov/.claude && \
    mkdir -p /home/vfonov/.local/bin && \
    chown -R vfonov:vfonov /home/vfonov


## run as vfonov to set up claude
USER vfonov
ENV PATH=/home/vfonov/.local/bin:/home/vfonov/.cargo/bin:$PATH 
ENV EDITOR=nano
ENV VISUAL=nano

RUN git config --global user.name "Vladimir S. Fonov" && \
    git config --global user.email "vladimir.fonov@gmail.com"

# install rtk
RUN cargo-1.91 install --git https://github.com/rtk-ai/rtk

# install ClaudeCode
RUN curl -fsSL https://claude.ai/install.sh -o /tmp/install.sh && \
    chmod +x /tmp/install.sh && \
    /bin/bash /tmp/install.sh && \
    rm -f /tmp/install.sh # updated 2026-05-09


WORKDIR /app
CMD ["/bin/bash"]
