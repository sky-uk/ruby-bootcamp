require 'rake'

# Usage: rake --rakefile lib/tasks/input.rake putsmany['hello',4]
desc 'Task that takes arguments'
task :putsmany, :message, :occurances do |_, args|
  args.occurances.to_i.times do
    puts args.message
  end
end

desc 'Task that runs another with arguments'
task :puts5 do
  # These 2 do the same thing with different args and syntax
  Rake.application.invoke_task("putsmany['hello', 5]")
  Rake::Task[:putsmany].invoke('hi', 5)
end

task :envreader do
  Rake::Task[:putsmany].invoke(ENV['MESSAGE'], ENV['TIMES'])
end
