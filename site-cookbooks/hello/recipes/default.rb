#
# Cookbook Name:: hello
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

log "Hello World."

%w(gcc openssh-clients zsh).each do |pkg|
  package pkg do
    action :install
  end
end
