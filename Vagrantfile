# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box          = "precise64"
    config.vm.box_url      = "http://files.vagrantup.com/precise64.box"
    config.vm.boot_timeout = 300

    config.vm.define "database" do |database|

        database.vm.network :forwarded_port, guest: 5432, host: 5432
        database.vm.network :forwarded_port, guest: 80, host:8080

        database.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = File.join(File.dirname(__FILE__), 'cookbooks')
            chef.add_recipe "apt"
            chef.add_recipe "postgresql::server"
            chef.add_recipe "phppgadmin"
            chef.json = {
                :postgresql => {
                    :version  => "9.1",
                    :listen_addresses => "*",
                    :pg_hba => [
                        "host all all 0.0.0.0/0 md5",
                        "host all all ::1/0 md5",
                    ],
                    :users => [
                        { :username => "postgres", :password => "password",
                          :superuser => true, :login => true, :createdb => true }
                    ],
                }
            }
        end
    end
end
