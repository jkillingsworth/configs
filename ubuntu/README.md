## Overview

These are instructions for setting up an Ubuntu virtual machine.

#### Installation

Use the network installer to perform a basic installation using default options.

Install package collections:

    sudo tasksel install server
    sudo tasksel install samba-server
    sudo tasksel install openssh-server

Install packages:

    sudo apt install libnss-winbind

#### Configuration

Locate the following line in the `/etc/nsswitch.conf` file:

    hosts:          files dns

Edit it to look like this:

    hosts:          files dns wins

Append the following line to the `/etc/fstab` file:

    //hostname/share /mnt cifs username=xxxxxxxx,password=xxxxxxxx 0 0

You can use `\040` for space characters if your username contains spaces.

Mount the share defined above:

    sudo mount -a

The mounted share persists across restarts.
