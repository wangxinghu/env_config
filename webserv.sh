#!/bin/bash
nginx_start() {
    /usr/local/bin/nginx -c /usr/local/etc/nginx/nginx.conf & #|| echo -n " nginx already running"
}
nginx_stop() {
    nginx_pid=/Users/wangxinghu/work/farm/log/nginx/nginx.pid
    kill -QUIT `cat $nginx_pid` || echo -n " nginx not running"
}
php_start() {
    /usr/sbin/php-fpm -c /usr/local/etc/php/5.3/php.ini -y /usr/local/etc/php/5.3/php-fpm.conf & #|| echo -n " php-fpm already running"
}
php_stop() {
    php_pid=/Users/wangxinghu/work/farm/log/php/php-fpm.pid
    kill -QUIT `cat $php_pid` || echo -n " php-fpm not running"
}
mysql_start() {
    /usr/local/bin/mysqld_safe --user=root & #|| echo -n "mysql already runnig"
}
mysql_stop() {
    mysql_pid=/Users/wangxinghu/work/farm/log/mysql/mysql.pid
    #kill -9 `cat $mysql_pid` || echo -n " mysql not running"
    /usr/local/bin/mysqladmin -h127.0.0.1 -uroot shutdown
}
mongo_start() {
    /usr/local/bin/mongod -f /usr/local/etc/mongod.conf & #|| echo -n "mongo already running"
}
mongo_stop() {
    mongo_pid=/Users/wangxinghu/work/farm/log/mongo/mongo.pid
    kill -9 `cat $mongo_pid` || echo -n " mongo not running"
}
memcache_start() {
    /usr/local/bin/memcached -d -m 2048 -u nobody -l 0.0.0.0 -c 10240 -f 1.33 -n 48 -t 4 -p 11211 -P /Users/wangxinghu/work/farm/log/memcached/memcached.pid & #|| echo -n " memcache already running"
}
memcache_stop() {
    memcache_pid=/Users/wangxinghu/work/farm/log/memcached/memcached.pid
    kill -9 `cat $memcache_pid` || echo -n " memcache not running"
}
redis_start() {
    /usr/local/bin/redis-server /usr/local/etc/redis.conf & #|| echo -n " redis already running"
}
redis_stop() {
    redis_pid=/Users/wangxinghu/work/farm/log/redis/redis.pid
    kill -9 `cat $redis_pid` || echo -n " redis not running"
}
case "$1" in
    restart)
        nginx_stop;
        php_stop
        mysql_stop
        redis_stop
        memcache_stop
        mongo_stop
        sleep 1

        nginx_start
        php_start
        mysql_start
        redis_start
        memcache_start
        mongo_start
        ;;
    stop)
        nginx_stop;
        php_stop
        mysql_stop
        redis_stop
        memcache_stop
        mongo_stop
        ;;
    start)
        nginx_start
        php_start
        mysql_start
        redis_start
        memcache_start
        mongo_start
        ;;
    php_restart)
        php_stop
        sleep 1
        php_start
        ;;
    nginx_restart)
        nginx_stop
        sleep 1
        nginx_start
        ;;
    mysql_restart)
        mysql_stop
        sleep 1
        mysql_start
        ;;
    redis_restart)
        redis_stop
        sleep 1
        redis_start
        ;;
    memcache_restart)
        memcache_stop
        sleep 1
        memcache_start
        ;;
    mongo_restart)
        mongo_stop
        sleep 1
        mongo_start
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart|php_restart|nginx_restart|mysql_restart|redis_restart|mongo_restart|memcache_restart}"
        exit 3
        ;;
esac
exit 0
