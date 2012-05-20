# Vagrant database server demo

Execute the following

    bundle install
    librarian-install
    vagrant up

Then you should be able to navigate to http://localhost:8080/phppgadmin and log
into the database server using the username *postgres* and password *password*

This vagrant box takes ports 5432 and 8080 so if you have processes listening
on those ports then things might not work.
