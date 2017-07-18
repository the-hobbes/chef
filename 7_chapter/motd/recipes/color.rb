template '/etc/profile.d/prompt_color.sh' do
  owner 'root'
  mode '0755'
  source 'colorizer.sh.erb'
end
