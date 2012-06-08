require_relative '../lib/ardour_git'

describe ArdourGit do
  let(:ardourgit) { ArdourGit.new }

  before(:each) do
    FileUtils.mkdir('tmp')
    Dir.chdir('tmp')
  end

  after(:each) do
    Dir.chdir('..')
    FileUtils.rm_rf('tmp')
  end

  it 'creates a git repository when create command is called' do
    GitRepository.should_receive(:create)
    ardourgit.create
  end

  it 'adds all project files when save command is called' do
    ardourgit.create
    files = ['something.session', 'thing.wav']
    ArdourFiles.should_receive(:list).and_return(files)
    GitRepository.should_receive(:add).with(files)
    ardourgit.save
  end
end
