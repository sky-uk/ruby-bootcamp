# TaskController acts as a subcontroller for rake tasks
class TaskController
  def alpha_task(message)
    puts '*' * 30
    puts '    ' + message
    puts '*' * 30
  end

  def beta_task(message)
    puts 'X' * 30
    puts '    ' + message
    puts 'X' * 30
  end
end

desc 'banner style A'
task :bannerA  do
  tc = TaskController.new
  tc.alpha_task 'style A'
end
desc 'banner style B'
task :bannerB  do
  tc = TaskController.new
  tc.beta_task 'style B'
end

task default: [:bannerA, :bannerB]
