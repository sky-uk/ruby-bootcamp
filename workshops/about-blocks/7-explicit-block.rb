#
# Explicit Block
#

def method_with_explicit_block(&block)
  block.call(10)
end

r = method_with_explicit_block { |n| n * 2 }

puts r

r = method_with_explicit_block(&add_one)

puts r

r = method_with_explicit_block(&proc { |n| n * 100 })

puts r

r = method_with_explicit_block(&lambda { |n| n * 100 })

puts r
