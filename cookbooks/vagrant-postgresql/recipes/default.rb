postgresql_repository 'install'

postgresql_server_install 'package' do
  version node['postgresql']['version'].to_s
  password node['postgresql']['password']['postgres']
  action [:install, :create]
end

# Using this to generate a service resource to control
find_resource(:service, 'postgresql') do
  extend PostgresqlCookbook::Helpers
  service_name(lazy { platform_service_name })
  supports restart: true, status: true, reload: true
  action [:enable, :start]
end

counter = 0
node['postgresql'].fetch('pg_hba', []).each do |access|
  counter = counter + 1
  comment = access.fetch('comment', "custom access #{counter}")
  postgresql_access comment do
    comment comment
    access_type access.fetch('type')
    access_db access.fetch('db')
    access_user access.fetch('user')
    access_addr access.fetch('addr')
    access_method access.fetch('method')
  end
end

postgresql_server_conf 'PostgreSQL Config' do
  additional_config node['postgresql']['config']
  notifies :restart, 'service[postgresql]'
end
