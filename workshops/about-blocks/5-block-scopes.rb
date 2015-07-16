#
# Block Affecting Outer Variables
#

r = :initial_value

method_with_block { r = :modified_in_a_block }

puts r

#
# Blocks as Objects (callable)
#

add_one = lambda { |n| n + 1 }

puts add_one.call(10)
puts add_one[10]
