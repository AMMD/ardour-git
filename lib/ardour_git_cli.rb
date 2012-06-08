require_relative 'ardour_git'

class ArdourGitCli
  def command(keyword)
    if keyword == 'init'
      ArdourGit.new.create
    end
  end
end
