FROM alpine:3.16

RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.15/community" >> /etc/apk/repositories ;\
	apk update ; apk upgrade ;\
	apk add php7 php7-common php7-session \
	php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli \
	php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap \
	php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
	php7-ctype php7-dom php7-simplexml php7-fpm php7-phar

RUN mkdir -p /var/www/html/wordpress ; adduser -u 82 -D -S -G www-data www-data
COPY conf/default.conf /etc/php7/php-fpm.d/www.conf
COPY conf/wp-config.php /var/www/html/wordpress

# WP CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ;\
	chmod +x wp-cli.phar ; mv wp-cli.phar /usr/local/bin/wp

#WP INSTALL
RUN cd /var/www/html/wordpress ; wp core download --allow-root ;\
	chown -R www-data:www-data /var/www/html/wordpress \
	; find /var/www/html/wordpress -type f -exec chmod 644 {} \; ;\
	find /var/www/html/wordpress -type d -exec chmod 755 {} \;

#WP SITE
# RUN wp core install --url="localhost" --title="hubretec's inception" --admin_user="hubretec" --admin_password="bonsoir123" --admin_email="hubretec@student.42.fr" --path="/var/www/html/wordpress" --allow-root

EXPOSE 9000
ENTRYPOINT [ "/usr/sbin/php-fpm7", "-F" ]