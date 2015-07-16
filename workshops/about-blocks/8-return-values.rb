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
