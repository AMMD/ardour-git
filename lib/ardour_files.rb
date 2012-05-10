class ArdourFiles
  def self.list
    Dir.glob('*.ardour')
  end
end
