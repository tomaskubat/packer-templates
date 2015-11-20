Packer Vagrant Virtualbox Templates
===================================

Availabled Boxes Templates and Builds
-------------------------------------

**64-bit boxes** - all boxes availabled at [boxes.prisedni.cz](http://boxes.prisedni.cz):

+ [Centos-7.1.1503-vboxguest-5.0.10-puppet-4.3.0.box](http://boxes.prisedni.cz/Centos-7.1.1503-vboxguest-5.0.10-puppet-4.3.0.box)
  - Vboxguest 5.0.10
  - Puppet agent 4.3.0
  - Installed: Development Tools group, kernel-devel, mc, htop, iftop
  - Removed: selinux* tuned smartmontools polkit lvm2 lvm2-libs
+ [Centos-7.1.1503-vboxguest-5.0.10-puppet-4.3.0-devstack.box](http://boxes.prisedni.cz/Centos-7.1.1503-vboxguest-5.0.10-puppet-4.3.0-devstack.box)
  - Vboxguest 5.0.10
  - Puppet agent 4.3.0
  - **Devstack**: Nginx 1.9.7, MariaDB Server and Client 10.1.8, PHP-FPM and CLI 7.0.0RC7 (for details look at `manifests/centos7/devstack.pp`)
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

You can use one script guide [vagrant-bootstrap](https://github.com/tomaskubat/vagrant-bootstrap) 
