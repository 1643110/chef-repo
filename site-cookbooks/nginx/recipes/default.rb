#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
rpm_file = "nginx-release-centos-6-0.el6.ngx.noarch.rpm"
file_checksum = "4ee9cb15f3ad5c3bea4909bf8863983af4089484f50c1cdb94559016ea9fd244"

cookbook_file "/tmp/#{rpm_file}" do
  source "#{rpm_file}"
  checksum "#{file_checksum}"
end

package "nginx-release" do
  not_if "rpm -qa | grep -q '^nginx-release'"
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{rpm_file}"
end

%w(nginx).each do |pkg|
  package pkg do
    action :install
  end
end
