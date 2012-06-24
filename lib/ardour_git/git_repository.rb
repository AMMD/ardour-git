require 'git'

class GitRepository
  def self.create
    Git.init
  end

  def self.add(files)
    g = Git.open('.')
    g.add(files)
  end
end
