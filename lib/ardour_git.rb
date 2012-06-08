require_relative 'ardour_files'
require_relative 'git_repository'

class ArdourGit
  def create
    GitRepository.create
  end

  def save
    files = ArdourFiles.list
    GitRepository.add files
  end
end
