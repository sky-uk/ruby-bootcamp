require 'spec_helper'

describe 'RSpec task runner example' do
  it 'task file should exist' do
    task_file = File.expand_path('lib/tasks/rspec.rake')
    task_file_exists = File.exist? task_file
    expect(task_file_exists).to be true
  end
end
