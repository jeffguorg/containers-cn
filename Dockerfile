FROM golang:1.15-alpine3.12
ENV  GOPROXY=https://goproxy.cn,direct
RUN  apk add git gcc libc-dev && go get -u -v github.com/gopherdata/gophernotes && cp -v "$(go env GOPATH)"/pkg/mod/github.com/gopherdata/gophernotes@v0.7.1/kernel /gophernotes && cp -v $(go env GOPATH)/bin/gophernotes /gophernotes/gophernotes

FROM alpine:3.12
COPY --from=0 /gophernotes/ /root/.local/share/jupyter/kernels/gophernotes
ADD  config.py /root/.jupyter/jupyter_notebook_config.py
RUN  apk add py3-pip py3-argon2-cffi py3-cffi && pip install -u notebook && sed 's:gophernotes:/root/.local/share/jupyter/kernels/gophernotes/gophernotes:g' /root/.local/share/jupyter/kernels/gophernotes/kernel.json.in > /root/.local/share/jupyter/kernels/gophernotes/kernel.json
VOLUME /data
CMD  jupyter notebook
