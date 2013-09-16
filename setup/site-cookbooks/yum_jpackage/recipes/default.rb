#
# Cookbook Name:: yum_jpackage
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

yum_key "jpackage" do
        url "http://www.jpackage.org/jpackage.asc"
        action :add
end

yum_repository "jpackage" do
  description "jpackage 6 generic"
  key "jpackage"
  mirrorlist "http://www.jpackage.org/mirrorlist.php?dist=generic&type=free&release=6.0"
  action :create
end
