require_relative 'ardour_git/ardour_files'
require_relative 'ardour_git/git_repository'

class ArdourGit
  def command(opts, argv)
    if opts[:init]
      create
    elsif opts[:save]
      if argv.empty?
        message = "test"
      else
        message = argv[0]
      end
      save(message)
    end
  end

  def create
    GitRepository.create
  end

  def save(message)
    files = ArdourFiles.list
    GitRepository.add(files)
    GitRepository.commit(message)
  end
end
