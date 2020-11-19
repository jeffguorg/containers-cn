FROM ubuntu:18.04
RUN  apt update && apt install ca-certificates apt-transport-https -y && sed -i 's,http://archive.ubuntu.com,https://mirrors.tuna.tsinghua.edu.cn,g; s,http://security.ubuntu.com/ubuntu/ bionic-security,https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security,g' /etc/apt/sources.list && apt dist-upgrade -y && apt clean -y && rm -rfv /var/lib/apt/lists/*
