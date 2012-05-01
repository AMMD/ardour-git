require 'git'

class ArdourGit
  def create
    g = Git.init('.',
                 { :repository => '.ardourgit',
                   :index => '.ardourgit/index'})
  end
end
