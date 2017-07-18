# To uninstall in chef, you should specify the inverse of the action taken to
# create.

file "#{ENV['HOME']}/stone.txt" do
  action :delete # a string prefaced by a single colon (:) is called a symbol.
end

'''
recipe
- A set of instructions written in a Ruby DSL that indicate the desired 
configuration to Chef.

resource
- A cross-platform abstraction for something managed by Chef (such as a file).
Resources are the building blocks from which you compose Chef code.

attribute
- Parameters passed to a resource.
'''

