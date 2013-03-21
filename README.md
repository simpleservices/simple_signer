## simple_signer  
  
[![Gem Version](https://badge.fury.io/rb/simple_signer.png)](https://rubygems.org/gems/simple_signer)  
  
simple_signer is a ruby gem to sign strings, it can be used to generate signatures to API requests.  

### install  
```console  
$ gem install simple_signer  
```  

### use
```ruby  
require 'simple_signer'  


# sign

signature = SimpleSigner.sign :secret_key => 'your_secret_key', :string => 'your_string_to_be_signed'  

puts signature
=> "VKb6rsLKHrCjerJZuA1SM1LccGE="  
  
  
# escape  
  
escaped_signature = SimpleSigner.escape "VKb6rsLKHrCjerJZuA1SM1LccGE="  
  
puts escaped_signature  
=> "VKb6rsLKHrCjerJZuA1SM1LccGE%3D"  
  
  
# unescape  
  
unescaped_signature = SimpleSigner.unescape "VKb6rsLKHrCjerJZuA1SM1LccGE%3D"  
  
puts unescaped_signature  
=> "VKb6rsLKHrCjerJZuA1SM1LccGE="  
```  
  
### test  
```$ rake test```  