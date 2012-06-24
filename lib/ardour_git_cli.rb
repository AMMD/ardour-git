require_relative 'ardour_git'

class ArdourGitCli
  def initialize
    @ardourgit = ArdourGit.new
  end

  def self.command(opts)
    if opts[:init]
      @ardourgit.create
    elsif opts[:save]
      @ardourgit.save
    end
  end
end
