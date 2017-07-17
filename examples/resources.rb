# Demonstrate the template, package and service resouces in the Chef DSL.
# Complete list of resources: https://docs.chef.io/resources.html

template '/etc/resolv.conf' do
  # This declares a template resource in Chef’s DSL. The template will be
  # compiled from the local file my_resolv.conf.erb, be owned by root:root,
  # have 0644 permissions, and be placed at /etc/resolv.conf on the target 
  # machine (where Chef evaluates the code).
  source 'my_resolv.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
end

package 'ntp' do
	# This declares a package resource in Chef’s DSL. The “ntp” package will be
	# upgraded.
  action :upgrade
end

service 'apache2' do
	# This declares a service resource in Chef’s DSL. The “apache2” service will 
	# be accessible and manageable by Chef.
  restart_command '/etc/init.d/apache2 restart'
end

### Common resources and their uses: ###

## bash
# Execute multi-line scripts written in the Bourne-again shell (bash) scripting
# language using the bash shell interpreter:
bash 'echo hello'

## chef_gem
## Install a gem inside of Chef, for use inside Chef; useful when a Chef code
# requires a gem to perform a function:
chef_gem 'httparty'

## gem_package
# Install a gem for use outside of Chef, such as an application or utility:
# Install bundler to manage dependencies
gem_package 'bundler'

### cron
# Create or manage a cron entry that schedules commands to run periodically at
# specified intervals:
# Restart the computer every week
cron 'weekly_restart' do
  weekday '1'
  minute  '0'
  hour    '0'
  command 'sudo reboot'
end

## deploy_revision
# Control and manage a deployment of code from source control (such as a Rails
# application):
# Clone and sync an application from revision control
deploy_revision '/opt/my_app' do
  repo 'git://github.com/username/app.git'
end

## directory
# Manage a directory or directory tree, handling permissions and ownership:
# Recursively ensure a directory exists
directory '/opt/my/deep/directory' do
  owner     'root'
  group     'root'
  mode      '0644'
  recursive true
end

## execute
# Execute an arbitrary one-line command (as if it were entered on the command
# line):
# Write contents to a file
execute 'write status' do
  command 'echo "delicious" > /tmp/bacon'
end

## file
# Manage a file already present (but not already managed by Chef):
# Delete the /tmp/bacon file
file '/tmp/bacon' do
  action :delete
end

## group
# Create or manage a local group definition with local user accounts as members:
# Create the bacon group
group 'bacon'

## link
# Create and manage symlinks and hard links:
# Link /tmp/bacon to /tmp/delicious
link '/tmp/bacon' do
  to '/tmp/delicious'
end

## mount
# Mount or unmount a file system:
# Mount /dev/sda8
mount '/dev/sda8'

## package
# Install a package using the operating system’s underlying package manager:
# Install the apache2 package (on Debian-based systems)
package 'apache2'

## remote_file
# Transfer a file from a remote location (such as a website):
# Download a remote file to /tmp/bacon
remote_file '/tmp/bacon' do
  source 'http://bacon.org/bits.tar.gz'
end

## service
# Start, stop, or restart a service:
# Restart the apache2 service
service 'apache2' do
  action :restart
end

## template
# Manage plain-text file contents parsed as an Embedded Ruby template:
# Write the /tmp/bacon template using the bits.erb source
# ERB: http://www.stuartellis.name/articles/erb/
template '/tmp/bacon' do
  source 'bits.erb'
end

## user
# Create or manage a local user account:
# Create the bacon user
user 'bacon'

# Only when you need to extend Chef beyond what is provided out of the box will
# you have to worry about delving more deeply into Ruby coding. 