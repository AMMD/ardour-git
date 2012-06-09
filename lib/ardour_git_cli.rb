require_relative 'ardour_git'

class ArdourGitCli
  def self.command(opts)
    if opts[:init]
      ArdourGit.new.create
    end
  end
end
