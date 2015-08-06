#
# Passing Block as Argument
#

def method_with_block_arguments
  yield("Bob")
end

make_upper = lambda { |n| n.upcase }

r = method_with_block_arguments(&make_upper)

puts r
