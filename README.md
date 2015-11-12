Packer Vagrant Virtualbox Templates
===================================

Availabled Boxes Templates and Builds
-------------------------------------

64-bit boxes:

+ [Centos-7.1.1503-x86_64](http://boxes.prisedni.cz/Centos-7.1.1503-x86_64-vboxguest-5.0.10-puppet-3.8.4.box) with Vboxguest 5.0.10 and Puppet agent 3.8.4

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
