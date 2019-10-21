FROM richarvey/nginx-php-fpm
RUN apk add --no-cache --virtual .build-deps \
    autoconf gcc libc-dev make openssh && \
    pecl install mongodb && \
    docker-php-ext-enable mongodb \
    && docker-php-ext-configure pcntl \
    && docker-php-ext-install pcntl \
    #&& docker-php-ext-enable pcntl \
    && sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config \
    && sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g' /etc/ssh/sshd_config \
    && sed -i 's/#ListenAddress ::/ListenAddress ::/g' /etc/ssh/sshd_config \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config \
    && ssh-keygen -A \
    && echo "root:ctjydeveloper" | chpasswd \
    && sed -i '49a\[program:ssh]\ncommand=/usr/sbin/sshd -D\ndirectory=/workspace/\nuser=root\nautostart=true\nautorestart=true\npriority=10\nstartsecs=3\nstdout_logfile=/var/log/ssh.out.log\nstderr_logfile=/var/log/ssh.err.log\nstopsignal=INT\n' /etc/supervisord.conf
