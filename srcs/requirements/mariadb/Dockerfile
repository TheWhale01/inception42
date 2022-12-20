FROM alpine:3.16

RUN apk update ; apk upgrade ; apk add mariadb \
	mariadb-client

COPY script/script.sh /tmp/script.sh

EXPOSE 3306
ENTRYPOINT ["sh", "/tmp/script.sh"]