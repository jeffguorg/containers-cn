FROM ubuntu:groovy
RUN  apt update && apt install ca-certificates apt-transport-https -y -q && sed -i 's,http://archive.ubuntu.com,https://mirrors.tuna.tsinghua.edu.cn,g; s,http://security.ubuntu.com/ubuntu/ groovy-security,https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ groovy-security,g' /etc/apt/sources.list && apt dist-upgrade -y -q && apt clean -y && rm -rf /var/lib/apt/lists/* 
