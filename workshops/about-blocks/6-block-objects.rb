#
# Passing Block as Argument
#

make_upper = lambda { |n| n.upcase }

r = method_with_block_arguments(&make_upper)

puts r
