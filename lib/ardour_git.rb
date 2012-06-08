require 'ardour_files'
require 'git_repository'

class ArdourGit
  def create
    GitRepository.create
  end

  def save
    files = ArdourFiles.list
    GitRepository.add files
  end
end
