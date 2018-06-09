FROM nimlang/nim:0.14.2-alpine AS builder

RUN mkdir -p /data
WORKDIR /data
COPY . /data

# nimble is broken for the nim alpine image
RUN nim c src/nim_alpine_starter.nim

FROM alpine:3.7

RUN mkdir -p app

WORKDIR /app

COPY --from=builder \
    /data/nim_alpine_starter \
    /bin/

VOLUME /data
EXPOSE 3000

CMD [ "/bin/nim_alpine_starter" ]
