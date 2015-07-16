#
# Block Arguments
#

def method_with_block_arguments
  yield("Bob")
end

method_with_block_arguments do |argument|
  puts argument
end
