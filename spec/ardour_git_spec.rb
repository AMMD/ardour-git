require_relative '../lib/ardour_git'

describe ArdourGit do
  before(:each) do
    FileUtils.mkdir('tmp')
    Dir.chdir('tmp')
  end

  after(:each) do
    Dir.chdir('..')
    FileUtils.rm_rf('tmp')
  end

  it 'creates a git repository when create command is called' do
    ArdourGit.new.create
    (FileTest.exist? '.ardourgit').should == true
  end

  it 'adds session file when save command is called' do
    repository = ArdourGit.new
    repository.create
    FileUtils.touch 'something.ardour'
    repository.save
    repository.list.should == ['something.ardour']
  end

  it 'does not add file which is not an ardour session' do
    repository = ArdourGit.new
    repository.create
    FileUtils.touch 'something.txt'
    repository.save
    repository.list.should == []
  end
end
