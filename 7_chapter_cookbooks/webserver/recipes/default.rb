#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# package resource, package calls one of many providers based on the platform and platform_family returned by ohai. Because our platform is rhel, the yum_package provider is used.
package "httpd" do
  # this whole thing could just be package "httpd" since the default is install
  action :install
end

# service resource, used to start the httpd service automatically and enable it on restart (start and enable)
service "httpd" do
  action [ :enable, :start ]
end

# template resource, has the ability to expand variable references to the file and other statements in the form of Embedded RuBy (ERB)
template "/var/www/html/index.html" do
  source 'index.html.erb'  # location in the templates/default directory
  mode '0644'  # world readable so users can request it
end
