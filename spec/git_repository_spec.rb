require_relative '../lib/git_repository'

describe GitRepository do
  before(:each) do
    FileUtils.mkdir('tmp')
    Dir.chdir('tmp')
  end

  after(:each) do
    Dir.chdir('..')
    FileUtils.rm_rf('tmp')
  end

  context 'When calling create' do
    it 'calls git init' do
      Git.should_receive(:init)
      GitRepository.create
    end

    it 'creates the repository in .git folder' do
      GitRepository.create
      (FileTest.exists? '.git').should == true
    end
  end

  it 'adds files to repository' do
    files = ['a', 'b']
    g = stub
    Git.should_receive(:open).and_return(g)
    g.should_receive(:add).with(files)
    GitRepository.add(files)
  end
end
