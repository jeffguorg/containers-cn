FROM alpine:3.12
RUN  sed -i 's:dl-cdn.alpinelinux.org:mirrors.tuna.tsinghua.edu.cn:g' /etc/apk/repositories && apk add ca-certificates
