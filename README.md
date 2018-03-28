# nginx-php-fpm-mongodb

###### 增加 php-fpm mongodb 驱动。

##用法：

####编辑 Dockerfile
    
    FROM echobool/nginx-php-fpm-mongodb
    
    ENV SKIP_COMPOSER=1 \
    	RUN_SCRIPTS=1
    COPY . /var/www/html


####其它环境变量用法参考
        
        https://github.com/richarvey/nginx-php-fpm
