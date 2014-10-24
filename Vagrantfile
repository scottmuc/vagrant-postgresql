# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box          = "ubuntu/trusty64"

    config.vm.define "database" do |database|

        database.vm.network :forwarded_port, guest: 5432, host: 5432
        database.vm.network :forwarded_port, guest: 80, host:8080

        database.vm.provision :chef_solo do |chef|
            chef.cookbooks_path = File.join(File.dirname(__FILE__), 'cookbooks')
            chef.add_recipe "postgresql::server"
            chef.add_recipe "phppgadmin"
            chef.json = {
                :postgresql => {
                    :version  => "9.3",
                    :password => {
                      :postgres => "password",
                    },
                    :config => {
                      :listen_addresses => "*",
                    },
                    :pg_hba => [
                        { :type => 'host',
                          :db   => 'all',
                          :user => 'all',
                          :addr => '0.0.0.0/0',
                          :method => 'md5',
                        },
                        { :type => 'host',
                          :db   => 'all',
                          :user => 'all',
                          :addr => '::1/0',
                          :method => 'md5',
                        },
                    ],
                }
            }
        end
    end
end
