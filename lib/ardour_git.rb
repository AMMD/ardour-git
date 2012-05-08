require 'git'

class ArdourGit
  def create
    @g = Git.init('.',
                 { :repository => '.ardourgit',
                   :index => '.ardourgit/index'})
  end

  def save
    files = Dir.glob('*.ardour')
    @g.add files
  end

  def list
    @g.ls_files.keys
  end
end
