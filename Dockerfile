FROM jzmatrix/centos7-apache2:20200123_0618
################################################################################
RUN yum -y update && \
    yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
    yum-config-manager --enable remi-php72 && \
    yum -y update && \
    yum -y install php php-cgi php-common git php-curl php-devel php-exif php-gd php-pecl-geoip php-openssl php-gmp php-pecl-imagick php-json php-mbstring php-pecl-mcrypt php-pecl-memcached php-mysqlnd php-pear php-pecl-mongodb php-pecl-memcache php-opcache php-pspell php-readline php-snmp php-tidy php-xmlrpc php-xml php-xsl php-zip && \
    yum clean all
################################################################################
ADD config/php7/php.ini /etc/php.ini
ADD config/httpd/php.conf /etc/httpd/conf.d/php.conf
ADD config/pear/ /usr/share/pear/
ADD config/web /var/www/html/
################################################################################
CMD [ "/run-httpd.sh" ]
