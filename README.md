# Postgresql database server whenever you need one

```diff
- this project is no longer mainained. Docker is probably a better option nowadays
```

## Dependencies

You'll need to have the following tools installed for this to work

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](http://vagrantup.com/)

## Instructions

This repo contains everything necessary to stand up a local instance of an
ubuntu 14.04 server running postgresql.

To get the server going execute the following in the directory:

    script/database up

To shutdown the database server do the following:

    script/database down

To destroy the database server do the following (this will remove all data):

    script/database destroy

From a terminal you can also start a shell (given that you have the postgresql
client on your host operating system).

    psql -h localhost -U postgres --password
    enter password: password

## Customisations

You'll need to know a little bit about chef, but if you're feeling up for it,
you can tweak `config.yaml`. It's essentially the node attributes that will
be loaded by chef when performing the chef execution.

## Troubleshooting

This vagrant box takes port 5432 so if you have processes listening on those
ports then things might not work.

