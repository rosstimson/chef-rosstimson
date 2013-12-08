#
# Cookbook Name:: rosstimson
# Recipe:: default
#
# Copyright (C) 2013 Ross Timson <ross@rosstimson.com>
#
# All rights reserved - Do Not Redistribute
#

%w{bash zsh curl wget git}.each do |pkg|
  package pkg do
    action :install
  end
end

link '/usr/bin/bash' do
  to '/usr/local/bin/bash'
end

link '/usr/bin/zsh' do
  to '/usr/local/bin/zsh'
end

user 'rosstimson' do
  supports :manage_home => true
  shell '/usr/local/bin/zsh'
  password '$1$Hv3zo1/O$Q1HsO8bqAhz8EpxVnP1//0'
  action :create
end

git '/home/rosstimson/dotfiles' do
  repository 'https://github.com/rosstimson/dotfiles.git'
  reference 'master'
  action :sync
  enable_submodules true
  user 'rosstimson'
  group 'rosstimson'
end

