#
# Block Presence
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
