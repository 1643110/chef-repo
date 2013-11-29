#
# Cookbook Name:: emacs
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

install_dir = '/usr/local/src'
version     = node['emacs']['version']
source_uri  = node['emacs']['source_uri']
configure   = node['emacs']['configure']

node['emacs']['packages'].each do |package_name|
  package "#{package_name}" do
    :install
  end
end

remote_file "/tmp/emacs-#{version}.tar.gz" do
  not_if 'which emacs'
  source "#{source_uri}"
end

bash 'install_emacs' do
  not_if 'which emacs'
  user 'root'

  code <<-EOL
    install -d #{install_dir}
    tar xfz /tmp/emacs-#{version}.tar.gz -C #{install_dir}
    cd #{install_dir}/emacs-#{version}
    #{configure} && make && make install
  EOL
end
