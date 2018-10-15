#
# Cookbook:: Elasticsearch
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
apt_update "update_sources" do
  action :update
end

package "openjdk-8-jdk" do
  action :install
end

package 'apt-transport-https' do
   action :install
 end

bash "add-key" do
  code "wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
"
action :run
end

apt_repository "elasticsearch" do
  uri "https://artifacts.elastic.co/packages/6.x/apt"
  distribution "stable"
  components ["main"]
  action :add
end

apt_update "update_sources" do
  action :update
end

package "elasticsearch" do
  action :install
end
