# Logical assignment

name = nil
first_name = 'Bob'
last_name = 'Jones'

name = "#{first_name} #{last_name}" unless first_name.nil? && last_name.nil?

puts name

name = nil
first_name = nil
last_name = nil

name = "#{first_name} #{last_name}" unless first_name.nil? && last_name.nil?

puts name


# Ternary operators

is_admin = true

puts is_admin ? "You're an admin." : "You're a standard user."


# Lazy assignment

already_set = "A value"
already_set ||= "Another value"

puts already_set

not_set = nil
not_set ||= "Another value"

puts not_set


# If statement

if true
  puts "It's true"
else
  puts "It's false"
end


# Unless statement

unless true
  puts "It's false"
else
  puts "It's true"
end


# Case statement

value = 'red'

case value
when 'red'
  puts "It's red."
when 'blue'
  puts "It's blue."
when 'green'
  puts "It's green."
end

case value
when String
  puts "It's a string."
else
  puts "Unsure of type."
end


# While loop

counter = 0

while counter < 10 do
  counter += 1
end

puts "Counter reached #{counter}."


# For loop

items = 1..10

for item in items
  puts item
end
