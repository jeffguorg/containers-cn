FROM golang:1.15-alpine3.12
ENV  GOPROXY=https://goproxy.cn,direct
RUN  apk add git && git clone https://github.com/gopherdata/gophernotes.git /gophernotes && cd /gophernotes && go get -v ./... && go build -o /gophernotes/kernel/gophernotes github.com/gopherdata/gophernotes

FROM alpine:3.12
COPY --from=0 /gophernotes/kernel /root/.local/share/jupyter/kernels/gophernotes
ADD  config.py /root/.jupyter/jupyter_notebook_config.py
RUN  apk add py3-pip py3-argon2-cffi py3-cffi && pip install -u notebook && sed 's:gophernotes:/root/.local/share/jupyter/kernels/gophernotes/gophernotes:g' /root/.local/share/jupyter/kernels/gophernotes/kernel.json.in > /root/.local/share/jupyter/kernels/gophernotes/kernel.json
VOLUME /data
CMD  jupyter notebook
