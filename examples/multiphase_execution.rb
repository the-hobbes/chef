# Multiphase execution:
# In the first phase, Chef dynamically expends things like Ruby loops and top
# level Ruby code (like the total free memory on a target node). These values
# are cached and stored, then made available to the Chef code in the 2nd phase
# of execution.

['bacon', 'eggs', 'sausage'].each do |type|
  file "/tmp/#{type}" do
  	# The file resource is used to manage a file
    content "#{type} is delicious!"
    # content a DSL expression used to specify a string to write to the file.
  end
end

# In the first phase of evaluation, Chef will dynamically expand that Ruby loop.
# After the first phase, internally the code becomes equivalent to:

file '/tmp/bacon' do
  content 'bacon is delicious!'
end

file '/tmp/eggs' do
  content 'eggs is delicious!'
end

file '/tmp/sausage' do
  content 'sausage is delicious!'
end

# Similarly, top-level Ruby code is computed during the first phase of execution
free_memory = node['memory']['total']

file '/tmp/free' do
  contents "#{free_memory} bytes free on #{Time.now}"
end

# In the second phase of evaluation, the resource contained in the resource list
# will be:
file '/tmp/free' do
  contents "12904899202 bytes free on 2013-07-24 17:47:01 -0400"
end