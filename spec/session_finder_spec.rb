require_relative '../lib/ardour_git/session_finder'

describe SessionFinder do
  before(:each) do
    FileUtils.mkdir('tmp')
    Dir.chdir('tmp')
  end

  after(:each) do
    Dir.chdir('..')
    FileUtils.rm_rf('tmp')
  end

  it 'returns an empty list when no files exist' do
    SessionFinder.list.should == []
  end

  it 'finds all session files in the project' do
    FileUtils.touch('session1.ardour')
    FileUtils.touch('session2')
    FileUtils.touch('session3.ardour')
    SessionFinder.list.should == ['session1.ardour', 'session3.ardour']
  end
end
