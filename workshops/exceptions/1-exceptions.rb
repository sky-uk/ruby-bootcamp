# Basic raise

def run!
  raise "This is a basic exception."
end

run!


# Raise of custom type

def run!
  raise ArgumentError, "This is a basic exception."
end

run!


# Conditional raise

def run!(raise_error = false)
  raise ArgumentError, "This is a basic exception." if raise_error
end

run!(true)


# Rescuing

def run!
  raise ArgumentError, "This is a basic exception."
rescue
  puts "Exception was rescued."
end

run!


# Multiple rescues

def run!
  raise ArgumentError, "This is a basic exception."
rescue RuntimeError
  puts "Rescued RuntimeError."
rescue ArgumentError
  puts "Rescued ArgumentError."
end

run!


# Rescue information

def run!
  raise ArgumentError, "This is a basic exception."
rescue ArgumentError => e
  puts e.class
  puts e.message
end

run!


# Ensure

def run!
  raise ArgumentError, "This is a basic exception."
ensure
  puts "I will always run."
end

run!

def run!
  raise ArgumentError, "This is a basic exception."
rescue => e
  puts e.class
  puts e.message
ensure
  puts "I will always run."
end

run!
