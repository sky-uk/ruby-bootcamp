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

#
# Block Arguments
#

def method_with_block_arguments
  yield("Bob")
end

method_with_block_arguments do |argument|
  puts argument
end

#
# Multiple Yields
#

def many_yields
  yield(:peanut)
  yield(:butter)
  yield(:and)
  yield(:jelly)
end

r = []

many_yields { |item| r << item }

puts r

#
# Testing Block Presence
#

def yield_tester
  if block_given?
    yield
  else
    :no_block
  end
end

r = yield_tester { :with_block }

puts r

r = yield_tester

puts r

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

#
# Passing Block as Argument
#

make_upper = lambda { |n| n.upcase }

r = method_with_block_arguments(&make_upper)

puts r

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

#
# Return Values
#

def lambda_return_test
  lam = lambda { return }
  lam.call
  'returned'
end

def proc_return_test
  proc = Proc.new { return }
  proc.call
  'not returned'
end

puts lambda_return_test.inspect
puts proc_return_test.inspect

#
# Notes on Blocks, Procs and Lambdas
#

# * Procs are objects, blocks are not
# * Blocks are part of the syntax of a method call
# * Both proc and lambda return Proc objects
# * Lambdas assert arity (number of passed arguments)
# * Return inside a lamba returns flow to the outer code scope
# * Return inside a proc is executed in the outer scope (as if inside that scope directly)
