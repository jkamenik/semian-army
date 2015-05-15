# Simian Army

This is a set of scripts to introduce random failures into linux
machines.  This is useful in testing fallback and recovery in a
realistic way.

The original army code is [here](https://github.com/Netflix/SimianArmy).

[Netflix Simian Army Scripts](https://github.com/Netflix/SimianArmy/tree/master/src/main/resources/scripts)

## Install and Run

1. Git clone ....
1. Enter the cloned repo
1. `sudo bin/run.sh`

Note: This program does bad things to your linux machine.  Only run it
on systems that you do not care much about.

## Setup

```
$ cp etc/simian-army.conf /etc/simian-army.conf
```

Edit the config.

### Installing more monkeys

Put additional monkeys in `/usr/lib/monkeys`.  They will we picked up
and used automatically.

Note: These monkeys cannot be disabled, if they exist they may be used.

## Testing

I recommend using the supplied Vagrant file to spin up a VM.

```
$ vagrant up
$ vagrant ssh
$ cd /vagrant
$ sudo bin/run.sh
```
