# -*- mode: ruby -*-
# vi: set ft=ruby :
HERE = File.join(File.dirname(__FILE__))

Vagrant::Config.run do |config|
  config.vm.box     = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.define "database" do |cfg|
    cfg.vm.forward_port 5432, 5432
    cfg.vm.forward_port 80, 8080
    cfg.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = File.join(HERE, 'cookbooks')
      chef.add_recipe("apt")
      chef.add_recipe("postgresql::server")
      chef.add_recipe("phppgadmin")
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
