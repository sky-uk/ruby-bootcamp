require 'rake'

shared_context :rake do
  subject do
    app = Rake::Application.new.tap do |app|
      app.add_import("#{__dir__}/../tasks/#{self.class.top_level_description}")
      allow(Rake).to receive(:application).and_return(app)
      app.load_imports
    end
    app[self.class.description]
  end
end

describe 'files.rake' do
  include_context :rake
  describe 'files:list' do
    it 'just works' do
      subject.invoke
    end
  end
end
