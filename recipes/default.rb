#
# Cookbook:: Elasticsearch
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# updating ubuntu source list
apt_update "update_sources" do
  action :update
end

#Installing java 8
package "openjdk-8-jdk" do
  action :install
end

# Installing https transport package
package 'apt-transport-https' do
   action :install
 end

# adding the public signing key for elasticsearch
bash "add-key" do
  code "wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - "
  action :run
end

# creating apt apt_repository to install from
apt_repository "elasticsearch" do
  uri "https://artifacts.elastic.co/packages/6.x/apt"
  distribution "stable"
  components ["main"]
  action :add
end

#updating ubuntu source list
apt_update "update_sources" do
  action :update
end

# Installing package for elasticsearch package 
package "elasticsearch" do
  action :install
end
