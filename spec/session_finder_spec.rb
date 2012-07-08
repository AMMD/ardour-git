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

  it 'raises NoSessionFound when no ardour session file exist' do
    FileUtils.touch('session2')
    expect { SessionFinder.file }.to raise_error(SessionFinder::NoSessionFound)
  end

  it 'finds the ardour session file in current directory' do
    FileUtils.touch('session1.ardour')
    FileUtils.touch('session2')
    SessionFinder.file.should == 'session1.ardour'
  end

  it 'throws an exception when two ardour session files are found' do
    FileUtils.touch('session1.ardour')
    FileUtils.touch('session2')
    FileUtils.touch('session3.ardour')
    expect { SessionFinder.file }.to raise_error(SessionFinder::TooManySessions)
  end
end
