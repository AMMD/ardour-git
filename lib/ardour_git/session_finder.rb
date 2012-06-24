class SessionFinder
  def self.list
    Dir.glob('*.ardour')
  end
end
