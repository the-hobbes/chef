# This is a file resource, which: 
# - Creates the file hello.txt
# - Writes some content to it
file 'hello.txt' do 
  content "Welcome to Chef!" # "content" is an attribute of a resource.
end

# You can use the chef-apply tool to perform the actions indicated.
# $ sudo chef-apply hello.rb
# The chef-apply tool is a wrapper built on top of Chef Solo.
''' Output: 
Recipe: (chef-apply cookbook)::(chef-apply recipe)
  * file[hello.txt.] action create
    - create new file hello.txt.
    - update content in file hello.txt. from none to f542ee
    --- hello.txt.      2017-07-16 17:20:10.851359942 -0700
    +++ ./.chef-hello20170716-8314-93v8y6.txt.  2017-07-16 17:20:10.851359942 -0700
    @@ -1 +1,2 @@
    +Welcome to Chef!
'''

'''
Chef code uses a domain-specific language (DSL) built on top of the Ruby 
programming language. Having expressions tailored for system administration 
makes Chef code more accessible to beginners. The DSL is also designed to make
you focus more on describing what the desired configuration of a machine should
be, rather than how it should be accomplished.
'''

