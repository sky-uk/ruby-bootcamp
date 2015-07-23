#
# Multiple Yields
#

def many_yields
  yield('peanut')
  yield('butter')
  yield('and')
  yield('jelly')
end

r = []

many_yields { |item| r << item }

puts r
