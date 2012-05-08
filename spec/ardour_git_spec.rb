require_relative '../lib/ardour_git'

describe ArdourGit do
  before(:each) do
  end

  after(:each) do
    FileUtils.rm_rf('tmp')
  end

  it 'creates a git repository when create command is called' do
    FileUtils.mkdir('tmp')
    Dir.chdir('tmp') do
      ArdourGit.new.create
      (FileTest.exist? '.ardourgit').should == true
    end
  end

  it 'adds and commits session file when save command is called' do
    FileUtils.mkdir('tmp')
    Dir.chdir('tmp') do
      repository = ArdourGit.new
      repository.create
      FileUtils.touch 'something.ardour'
      repository.save
      repository.list.should == ['something.ardour']
    end
  end

  it 'does not add file which is not an ardour session' do
    FileUtils.mkdir('tmp')
    Dir.chdir('tmp') do
      repository = ArdourGit.new
      repository.create
      FileUtils.touch 'something.txt'
      repository.save
      repository.list.should == []
    end
  end
end
