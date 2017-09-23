#
# Cookbook:: lcd_web
# Recipe:: users
#
# Copyright:: 2017, Brian Chau, All Rights Reserved.

group 'developers'

user 'webadmin' do
  group 'developers'
end
