require 'git'

class GitRepository
  def self.create
    Git.init('.',
             { :repository => '.ardourgit',
               :index => '.ardourgit/index'})
  end
end
