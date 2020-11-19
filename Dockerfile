FROM ubuntu:20.04
RUN  apt update && apt install ca-certificates apt-transport-https -y -q && sed -i 's,http://archive.ubuntu.com,https://mirrors.tuna.tsinghua.edu.cn,g; s,http://security.ubuntu.com/ubuntu/ focal-security,https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security,g' /etc/apt/sources.list && apt dist-upgrade -y -q && apt clean -y && rm -rf /var/lib/apt/lists/* 
