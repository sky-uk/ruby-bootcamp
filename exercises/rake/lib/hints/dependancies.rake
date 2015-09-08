task default: [:this, :is, :the, :correct, :order]

desc 'Say "This"'
task :this do
  puts 'This'
end

desc 'Say "is"'
task :is do
  puts ' is'
end

desc 'Say "the"'
task :the do
  puts ' the'
end

desc 'Say "order"'
task :order do
  puts ' order'
end

desc 'Say "correct"'
task :correct do
  puts ' correct'
end
