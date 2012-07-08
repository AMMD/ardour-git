class SessionFinder
  def self.file
    session_files = Dir.glob("*.ardour")
    raise NoSessionFound if session_files.empty?
    raise TooManySessions if session_files.count > 1
    session_files.first
  end

  class NoSessionFound < Exception; end
  class TooManySessions < Exception; end
end
