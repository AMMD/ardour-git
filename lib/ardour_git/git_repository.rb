class GitRepository
  def self.create
    `git init`
    `git annex init`
  end

  def self.add(files)
    files = files * " "
    `git add #{files}`
  end

  def self.add_big(files)
    files = files * " "
    `git annex add #{files}`
  end

  def self.commit(message)
    `git commit -am "#{message}"`
  end
end
