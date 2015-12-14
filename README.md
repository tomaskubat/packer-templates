Packer Vagrant Virtualbox Templates
===================================

Availabled Boxes Templates and Builds
-------------------------------------

**64-bit boxes** - all boxes availabled at [boxes.tomaskubat.cz](http://boxes.tomaskubat.cz):

+ [Centos-7.1.1503-vboxguest-5.0.10-puppet-4.3.1.box](http://boxes.tomaskubat.cz/Centos-7.1.1503-vboxguest-5.0.10-puppet-4.3.1.box)
  - Vboxguest 5.0.10
  - Puppet agent 4.3.1
  - Installed: Development Tools group, kernel-devel, mc, htop, iftop
  - Removed: selinux*, tuned, smartmontools, polkit, lvm2, lvm2-libs

+ [Centos-7.1.1503-vboxguest-5.0.10-puppet-4.3.1-devstack-php70.box](http://boxes.tomaskubat.cz/Centos-7.1.1503-vboxguest-5.0.10-puppet-4.3.1-devstack-php70.box)
  - Vboxguest 5.0.10
  - Puppet agent 4.3.1
  - **Devstack**: Nginx 1.9.7, MariaDB Server and Client 10.1.8, PHP and PHP-FPM and CLI 7.0.0. Nginx, Apache and PHP-FPM services are disabled as default. (For details look at `manifests/centos7/devstack-php70.pp`)
  - Installed: Development Tools group, kernel-devel, mc, htop, iftop
  - Removed: selinux* tuned smartmontools polkit lvm2 lvm2-libs

+ [Centos-7.1.1503-vboxguest-5.0.10-puppet-4.3.1-devstack-php56.box](http://boxes.tomaskubat.cz/Centos-7.1.1503-vboxguest-5.0.10-puppet-4.3.1-devstack-php56.box)
  - Vboxguest 5.0.10
  - Puppet agent 4.3.1
  - **Devstack**: Nginx 1.9.7, MariaDB Server and Client 10.1.8, PHP and PHP-FPM and CLI 5.6.16. Nginx, Apache and PHP-FPM services are disabled as default. (For details look at `manifests/centos7/devstack-php56.pp`)
  - Installed: Development Tools group, kernel-devel, mc, htop, iftop
  - Removed: selinux* tuned smartmontools polkit lvm2 lvm2-libs
  
+ [Centos-7.2.1511-vboxguest-5.0.10-puppet-4.3.1-devstack-php70.box](http://boxes.tomaskubat.cz/Centos-7.2.1511-vboxguest-5.0.10-puppet-4.3.1-devstack-php70.box)
  - Vboxguest 5.0.10
  - Puppet agent 4.3.1
  - **Devstack**: Nginx 1.9.9, MariaDB Server and Client 10.1.9, PHP and PHP-FPM and CLI 7.0.0. Nginx, Apache and PHP-FPM services are disabled as default. (For details look at `manifests/centos7/devstack-php70.pp`)
  - Installed: Development Tools group, kernel-devel, mc, htop, iftop
  - Removed: selinux* tuned smartmontools polkit lvm2 lvm2-libs
  
Requirements
------------

* [Packer](http://www.packer.io/downloads.html) (>= 0.8.6)
* [Vagrant](http://www.vagrantup.com/downloads.html) (>= 1.7.4)
* [Virtualbox](https://www.virtualbox.org/wiki/Downloads) (>= 5.0.10)

Build Vagrant Virtualbox Box
----------------------------

```
$ packer build <TEMPLATE>.json
```

Create Vagrant Boostrap (with Vagrantfile)
------------------------------------------

You can use interactive script guide [vagrant-bootstrap](https://github.com/tomaskubat/vagrant-bootstrap) 
