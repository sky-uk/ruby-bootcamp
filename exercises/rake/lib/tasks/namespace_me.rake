desc 'Run the unit tests'
task :test_unit do
  # Some code
end
desc 'Run the acceptance tests'
task :test_acceptance do
  # Some code
end
desc 'Run the api tests'
task :test_api do
  # Some code
end
desc 'Run the integration tests'
task :test_integration do
  # Some code
end
desc 'Run the gui tests'
task :test_gui do
  # Some code
end
desc 'Run the tests'
task test_all: [
  :test_unit, :test_acceptance, :test_api, :test_integration, :test_gui
]
desc 'Clean out previous dependancy builds'
task :build_clean do
  # Some code
end
desc 'Build css dependancies'
task :build_css do
  # Some code
end
desc 'Build js dependancies'
task :build_js do
  # Some code
end
desc 'Build all'
task build_all: [:build_clean, :build_css, :build_js]
desc 'Default Task'
task :default do
  puts 'Please namespace me!'
end
