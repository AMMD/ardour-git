require_relative 'ardour_git/ardour_files'
require_relative 'ardour_git/git_repository'
require_relative 'ardour_git/commands/init'
require_relative 'ardour_git/version'

#class ArdourGit
#  def command(opts, argv)
#    if opts[:init]
#      create
#    elsif opts[:save]
#      if argv.empty?
#        message = "test"
#      else
#        message = argv[0]
#      end
#      save(message)
#    end
#  end
#
#  def create
#    GitRepository.create
#  end
#
#  def save(message)
#    files = ArdourFiles.list
#    audio_files = ArdourFiles.list_audio
#    GitRepository.add(files)
#    GitRepository.add_big(audio_files)
#    GitRepository.commit(message)
#  end
#end
