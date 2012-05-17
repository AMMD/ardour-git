require 'git'

class GitRepository
  def self.create
    Git.init('.',
             { :repository => '.ardourgit',
               :index => '.ardourgit/index'})
  end

  def self.add(files)
    g = Git.open('.',
             { :repository => '.ardourgit',
               :index => '.ardourgit/index'})
    g.add(files)
  end
end
