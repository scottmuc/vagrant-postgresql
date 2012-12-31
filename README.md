# Postgresql database server whenever you need one

## Dependencies

You'll need to have the following tools installed for this to work

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://vagrantup.com/)

## Instructions

This repo contains everything necessary to stand up a local instance of an
ubuntu 12.04 server running postgresql and phppgadmin.

To get the server going execute the following in the directory:

    script/database up

To shutdown the database server do the following:

    script/database down

To destroy the database server do the following (this will remove all data):

    script/database destroy

Then you should be able to navigate to http://localhost:8080/phppgadmin and log
into the database server using the username *postgres* and password *password*

From a terminal you can also start a shell (given that you have the postgresql
client on your host operating system).

    psql -h localhost -U postgres --password
    enter password: password

## Troubleshooting

This vagrant box takes ports 5432 and 8080 so if you have processes listening
on those ports then things might not work.

