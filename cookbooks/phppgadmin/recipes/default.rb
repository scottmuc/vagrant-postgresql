package 'phppgadmin'

cookbook_file '/etc/phppgadmin/apache.conf' do
  source 'phppgadmin-apache.conf'
end

cookbook_file '/etc/phppgadmin/config.inc.php' do
  source 'config.inc.php'
  mode '0644'
end

service 'apache2' do
  action :restart
end
