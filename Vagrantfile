# -*- mode: ruby -*-
# vi: set ft=ruby :
HERE = File.join(File.dirname(__FILE__))

Vagrant::Config.run do |config|
  config.vm.box     = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

  config.vm.define "database" do |cfg|
    cfg.vm.forward_port 5432, 5432
    cfg.vm.forward_port 80, 8080
    cfg.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = [ File.join(HERE, 'cookbooks'), File.join(HERE, 'site-cookbooks') ]
      chef.add_recipe("apt")
      chef.add_recipe("build-essential")
      chef.add_recipe("postgresql::apt_postgresql_ppa")
      chef.add_recipe("postgresql::server")
      chef.add_recipe("phppgadmin")
      chef.json = {
        :postgresql => {
          :version  => "9.1",
          :listen_addresses => "*",
          :hba => [
            { :method => "trust", :address => "0.0.0.0/0" },
            { :method => "trust", :address => "::1/0" },
          ],
          :password => {
            :postgres => "password"
          }
        }
      }
    end
  end
end
