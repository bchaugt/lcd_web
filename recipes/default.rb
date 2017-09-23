#
# Cookbook:: lcd_web
# Recipe:: default
#
# Copyright:: 2017, Brian Chau, All Rights Reserved.

include_recipe 'lcd_web::users'

# package 'httpd'
# package 'net-tools'
#
# service 'httpd' do
#   action [:enable, :start]
# end

package platform_package_httpd

service platform_service_httpd do
  action [:enable, :start]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0644'
  owner 'apache'
  group 'apache'
  variables({
    greeting: node['greeting'],
    greeting_scope: node['greeting_scope'],
    fqdn: node['fqdn']
  })
end

service 'httpd' do
  action :restart
  only_if { index_exists? }
end
