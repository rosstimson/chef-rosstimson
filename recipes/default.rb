#
# Cookbook Name:: rosstimson
# Recipe:: default
#
# Copyright (C) 2013 Ross Timson <ross@rosstimson.com>
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'chef-sugar::default'

if debian?
  include_recipe 'apt'
end

%w{bash zsh less curl wget git build-essential tree tmux}.each do |pkg|
  package pkg do
    action :install
  end
end

user 'rosstimson' do
  shell '/bin/zsh'
  password '$1$Hv3zo1/O$Q1HsO8bqAhz8EpxVnP1//0'
  supports :manage_home => true
  home '/home/rosstimson'
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

execute 'make' do
  cwd '/home/rosstimson/dotfiles'
  user 'rosstimson'
end
