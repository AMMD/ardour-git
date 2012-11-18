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
      `git annex find`.should include('a', 'b')
    end
  end

  describe 'When calling add' do
    it 'adds files to repository' do
      files = ['a', 'b']
      FileUtils.touch files
      GitRepository.create
      GitRepository.add(files)
      `git ls-files`.should include('a', 'b')
    end
  end

  it 'commits files to repository with a message' do
    files = ['a', 'b']
    FileUtils.touch files
    GitRepository.create
    GitRepository.add(files)
    GitRepository.commit('message')
    `git show --pretty="format:" --name-only`.should include('a', 'b')
  end
end
