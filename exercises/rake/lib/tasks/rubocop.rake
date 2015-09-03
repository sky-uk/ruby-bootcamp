require 'rubocop/rake_task'

desc 'Style checking using rubocop'
# this is the equivalent of `task :style do` but with rubocop helper
RuboCop::RakeTask.new(:style) do |task|
  task.fail_on_error = false
end

task default: [:style]
