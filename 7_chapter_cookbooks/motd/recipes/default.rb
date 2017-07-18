#
# Cookbook:: motd
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

cookbook_file "/etc/motd" do
# cookbook_file is a chef resource used to transfer files from /files subdir in a cookbook to the node
  source "motd"  # the name of the file in the files/ subdir
  mode "0644"  # octal permissions on the file after it is copied
end

