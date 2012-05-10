require_relative '../lib/ardour_files'

describe ArdourFiles do
  before(:each) do
    FileUtils.mkdir('tmp')
    Dir.chdir('tmp')
  end

  after(:each) do
    Dir.chdir('..')
    FileUtils.rm_rf('tmp')
  end

  it 'returns an empty file list when no files exist'

  it 'returns the ardour session file when it exists' do
    FileUtils.touch('session.ardour')
    ArdourFiles.list.should == ['session.ardour']
  end

  it 'parses the ardour session file to return all project files'
end
