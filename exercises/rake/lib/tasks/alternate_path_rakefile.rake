desc 'A Task to remind me of the date'
task :date do
  puts 'The date today is: ' + Time.new.strftime('%d/%m/%y')
end
