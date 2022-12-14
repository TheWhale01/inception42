FROM alpine:3.16

RUN apk update ; apk upgrade ; apk add php8 php8-fpm

RUN mkdir -p /var/www/html
RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz
RUN rm latest.tar.gz && mv wordpress /var/www/html/
RUN adduser -u 82 -D -S -G www-data www-data && chmod 777 -R /var/www/html/wordpress \
	&& chown www-data:www-data -R /var/www/html/wordpress

COPY conf/default.conf /etc/php8/php-fpm.d/www.conf

EXPOSE 9000
ENTRYPOINT [ "tail", "-f" ]