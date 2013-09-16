#
# Cookbook Name:: apache_proxy_ajp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

["proxy.load", "proxy_ajp.load", "proxy_ajp.conf"].each do |f|
    cookbook_file "/etc/httpd/mods-available/#{f}" do
        source "tomcat7/#{f}"
    end
end

execute "a2enmod proxy"
execute "a2enmod proxy_ajp"

