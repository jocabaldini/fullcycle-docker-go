FROM golang AS BUILD_IMAGE

WORKDIR /var/www

RUN go mod init example/hello

COPY . .

RUN go build

FROM scratch

WORKDIR /var/www

COPY --from=BUILD_IMAGE /var/www/hello .

CMD ["./hello"]