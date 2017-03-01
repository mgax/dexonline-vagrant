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
    git clone git://github.com/mgax/dexonline-vagrant.git vagrant
    cd vagrant

Pornit și configurat mașina virtuală::

    vagrant up

Este configurat un folder shared, repository-ul `DEX` este accesibil ca
director `/dexonline` în mașina virtuală. Presupunem că înăuntru este un
director `tmp` care conține un dump de bază de date::

    vagrant ssh
    zcat /dexonline/tmp/dex-database.sql.gz | mysql DEX -u root

Mașina virtuală ar trebui să fie pornită, cu site-ul în lucru accesibil
la adresa http://192.168.13.11/.
