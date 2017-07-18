#
# Cookbook:: motd-attributes
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# you can set attributes in recipes too.
# the attribute priority resolution tree is: 
# automatic (lowest) -> in a recipe -> in an attribute file
# Priority exists because you can include recipes from other files as well.

node.default['motd-attributes']['message'] = "It's a wonderful day today!"

include_recipe 'motd-attributes::message'

template '/etc/motd' do
  source 'motd.erb'
  mode '0644'
end
