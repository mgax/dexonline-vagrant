Lucru la DEXonline folosind Vagrant
===================================

Vagrant_ este un program care instalează și configurează automat mașini
virtuale pentru development local. Repository-ul acesta conține
configurația pentru o mașină virtuală pe care se poate lucra la
DEXonline, fără a instala, pe calculatorul propriu, dependențele
(Apache, PHP, MySQL, Smarty etc).

.. _Vagrant: http://vagrantup.com/

Instalare
---------

Instalat Vagrant și o imagine de bază::

    gem install vagrant
    vagrant box add lucid32 http://files.vagrantup.com/lucid32.box

Instalat configurația pentru DEXonline::

    cd path/to/DEX
    git clone git://github.com/alex-morega/dexonline-vagrant.git vagrant
    cd vagrant

Pornit și configurat mașina virtuală::

    vagrant up
