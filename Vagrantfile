# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'
require 'fileutils'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"
ROOT_DIR                = File.expand_path(File.dirname(__FILE__))

def read_user_json
  config_path        = File.join(ROOT_DIR, 'config.yaml')
  sample_config_path = File.join(ROOT_DIR, 'config.sample.yaml')

  unless File.exists? config_path
    FileUtils.cp sample_config_path, config_path
  end

  YAML.load_file config_path
end

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.box          = "ubuntu/trusty64"

    config.vm.define "database" do |database|
        database.vm.network :forwarded_port, guest: 5432, host: 5432

        database.vm.provision :chef_solo do |chef|
            chef.arguments = "--chef-license accept"
            chef.cookbooks_path = File.join(File.dirname(__FILE__), 'cookbooks')
            chef.add_recipe "postgresql::server"
            chef.json = read_user_json
        end
    end
end
