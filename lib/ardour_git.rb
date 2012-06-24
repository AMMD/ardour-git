require 'ardour_git/ardour_files'
require 'ardour_git/git_repository'

class ArdourGit
  def command(opts)
    if opts[:init]
      create
    elsif opts[:save]
      save
    end
  end

  def create
    GitRepository.create
  end

  def save
    files = ArdourFiles.list
    GitRepository.add files
  end
end
