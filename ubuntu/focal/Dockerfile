FROM ubuntu:20.04
RUN  apt update && apt install ca-certificates apt-transport-https -y && sed -i 's,http://archive.ubuntu.com,https://mirrors.tuna.tsinghua.edu.cn,g; s,http://security.ubuntu.com/ubuntu/ focal-security,https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security,g' /etc/apt/sources.list && apt clean -y && rm -rfv /var/lib/apt/lists/*
