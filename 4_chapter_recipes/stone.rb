# Demonstrate the paradigm Chef uses: intent based automation.
# Tell chef what you want as the desired configuration, not how it should get
# there. Chef will automatically decide how to put the system into the desired
# configuration based on current state of the system.

# This example uses string interpolation to drop a stone.txt file in the homedir
# Implied relative paths + chef = bad, since chef recipes are designed to be run
# on many different computers which may have different states.
file "#{ENV['HOME']}/stone.txt" do
  content 'Written in stone'
end

# $ sudo chef-apply stone.rb

# Chef tries to be idempotent:
# - If stone.txt does not exist, chef-apply creates the file with the content.
# - If stone.txt already exists, chef-apply will do nothing.

# If you modify the output file and then run chef again, it will be changed back
# This is how Chef prevents configuration drift. Chef not only decides whether 
# or not files are created, but it also checks file content. When a file is 
# inadvertently modified, Chef makes sure the file reverts back to the content
# specified in the recipe.

# Chef decides the actions to perform to make the system configuration match
# what the recipe specifies. As a Chef developer, you only need to tell Chef
# the desired configuration. Chef takes care of all the rest automatically.

