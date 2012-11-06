require_relative "spec_helper"
require_relative '../lib/ardour_git'

describe GitRepository do
  after(:each) do
    `git annex drop * --force`
  end

  describe 'When calling create' do
    it 'creates the repository in .git folder' do
      GitRepository.create
      (FileTest.exists? '.git').should be_true
    end

    it 'initializes git annex' do
      GitRepository.create
      (FileTest.exists? '.git/annex').should be_true
    end
  end

  describe 'When calling add_big' do
    it 'adds files to git annex' do
      files = ['a', 'b']
      FileUtils.touch files
      GitRepository.create
      GitRepository.add_big(files)
      # TODO: what is the expectation?
    end
  end

  describe 'When calling add' do
    it 'adds files to repository' do
      files = ['a', 'b']
      g = stub
      Git.should_receive(:open).with('.').and_return(g)
      g.should_receive(:add).with(files)
      GitRepository.add(files)
    end
  end

  it 'commits files to repository with a message' do
    g = stub
    Git.should_receive(:open).with('.').and_return(g)
    g.should_receive(:commit_all).with('message')
    GitRepository.commit('message')
  end
end
