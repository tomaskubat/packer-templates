# Setup repositories
####################
file { '/etc/yum.repos.d/mariadb.repo':
    ensure => 'present',
    content =>
'# MariaDB 10.1 CentOS repository list - created 2015-11-19 07:00 UTC
# http://mariadb.org/mariadb/repositories/
[mariadb]
name = MariaDB
baseurl = http://yum.mariadb.org/10.1/centos7-amd64
gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
gpgcheck=1
enabled=1',
}

file { '/etc/yum.repos.d/nginx.repo':
    ensure => 'present',
    content =>
'# Nginx Mainline versions repository - created 2015-11-19 07:00 UTC
# http://nginx.org/en/linux_packages.html#mainline
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/mainline/centos/7/$basearch/
gpgcheck=0
enabled=1',
}

exec { 'install-epel-repository':
    command => "/usr/bin/rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm",
    unless => "/usr/bin/rpm -qa | /usr/bin/grep epel-release",
}

exec { 'install-remi-repository':
    command => "/usr/bin/rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm",
    unless => "/usr/bin/rpm -qa | /usr/bin/grep remi-release",
}

exec { 'permanently-enable-remi-php7-repository':
    command => "/usr/bin/yum-config-manager --enable remi-php71"
}

# Install packages
##################
$packages = [
    'nginx',
    'httpd',
    'mod_ssl',
    'php',
    'php-cli',
    'php-fpm',
    'php-pdo',
    'php-mysql',
    'php-mysqlnd',
    'php-mbstring',
    'php-curl',
    'php-gd',
    'php-mcrypt',
    'php-xmlrpc',
    'php-xdebug',
    'php-opcache',
    'php-process',
    'php-ldap',
    'php-pear',
    'MariaDB-server',
    'MariaDB-client',
    'dovecot',
]
package { $packages:
    ensure => 'installed',
}

# Setup Nginx 1.9.x
###################
service { 'nginx':
    ensure => stopped,
    enable => false,
}

# Setup PHP 7.0
###################
service { 'php-fpm':
    ensure => stopped,
    enable => false,
}

file { '/etc/php.d/15-xdebug.ini':
    ensure => 'present',
    content =>
        '; Enable xdebug extension module
        ; see http://xdebug.org/docs/all_settings
        zend_extension=xdebug.so
        xdebug.remote_enable = 1
        xdebug.idekey = "PHPSTORM"
        xdebug.remote_host = "10.0.2.2"
        xdebug.profiler_enable_trigger = 1
        xdebug.profiler_output_dir = "/tmp"',
}

# Setup MariaDB 10.1
####################
service { 'mariadb':
    ensure => running,
    enable => true,
}

file { '/home/vagrant/.my.cnf':
    ensure => 'present',
    content =>
'[mysql]
password=vagrant

[mysqldump]
password=vagrant

[mysqladmin]
password=vagrant',
}

exec { 'mariadb-setup':
    command =>"/usr/bin/mysql -D mysql << EOF
            DROP DATABASE IF EXISTS test;

            DELETE FROM user WHERE User <> 'root' OR (User = 'root' AND Host <> 'localhost');
            FLUSH PRIVILEGES;

            CREATE USER 'vagrant'@'localhost' IDENTIFIED BY 'vagrant';
            GRANT ALL PRIVILEGES ON *.* TO 'vagrant'@'localhost' WITH GRANT OPTION;
            CREATE USER 'vagrant'@'%' IDENTIFIED BY 'vagrant';
            GRANT ALL PRIVILEGES ON *.* TO 'vagrant'@'%' WITH GRANT OPTION;
            FLUSH PRIVILEGES;
EOF",
}

# Cleanup
exec { 'yum-clean':
    command => "/usr/bin/yum clean all"
}
