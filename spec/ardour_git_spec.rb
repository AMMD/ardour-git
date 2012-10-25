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

  xit 'creates a git repository when create command is called' do
    ardourgit.create
    Dir.exists?(".git").should == true
  end

  context 'when save command is called' do
    xit 'adds audio files to git annex' do
      ardourgit.create
      files = [stub]
      audio_files = ['thing.wav', 'other.wav', 'that.wav']
      ArdourFiles.stub(:list).and_return(files)
      ArdourFiles.should_receive(:list_audio).and_return(audio_files)
      GitRepository.stub(:add)
      GitRepository.stub(:commit)
      GitRepository.should_receive(:add_big).with(audio_files)
      ardourgit.save "my message"
    end

    xit 'adds other files to git' do
      ardourgit.create
      files = ['.history', 'instant.xml', 'project.ardour']
      audio_files = [stub]
      ArdourFiles.stub(:list_audio).and_return(audio_files)
      ArdourFiles.should_receive(:list).and_return(files)
      GitRepository.stub(:add_big)
      GitRepository.stub(:commit)
      GitRepository.should_receive(:add).with(files)
      ardourgit.save "my message"
    end

    xit 'commits with message' do
      ArdourFiles.stub(:list)
      ArdourFiles.stub(:list_audio)
      GitRepository.stub(:add)
      GitRepository.stub(:add_big)
      GitRepository.should_receive(:commit).with('my message')
      ardourgit.save "my message"
    end
  end
end
