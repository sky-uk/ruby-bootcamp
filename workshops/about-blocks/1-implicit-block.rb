#
# Implicit block
#

def method_with_block
  result = yield
  result
end

r = method_with_block { 1 + 2 }

puts r

r = method_with_block do 1 + 2 end

puts r

r = method_with_block do
 1 + 2
end

puts r
