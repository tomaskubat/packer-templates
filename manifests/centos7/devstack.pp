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
    command => "/usr/bin/yum-config-manager --enable remi-php70"
}

# Install packages
##################
$packages = [
    'nginx',
    'php70-php',
    'php70-php-cli',
    'php70-php-fpm',
    'php70-php-pdo',
    'php70-php-mysql',
    'php70-php-mysqlnd',
    'php70-php-curl',
    'php70-php-gd',
    'php70-php-mcrypt',
    'php70-php-xmlrpc',
    'php70-php-xdebug',
    'php70-php-opcache',
    'MariaDB-server',
    'MariaDB-client',
]
package { $packages:
    ensure => 'installed',
}

# Setup Nginx 1.9.x
###################
service { 'nginx':
    ensure => running,
    enable => true,
}

# Setup PHP 7.0
###################
service { 'php70-php-fpm':
    ensure => running,
    enable => true,
}

file { '/etc/profile.d/php70.sh':
    ensure => 'present',
    content =>'alias php="php70"',
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
