require_relative 'ardour_git/ardour_files'
require_relative 'ardour_git/git_repository'

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
    GitRepository.add(files)
    GitRepository.commit('test')
  end
end
