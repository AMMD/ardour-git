require_relative 'session_parser'
require_relative 'session_finder'

class ArdourFiles
  def self.list
    begin
      session_file = SessionFinder.file
      files = [session_file, 'instant.xml', '.history']
    rescue SessionFinder::NoSessionFound
      []
    end
  end

  def self.list_audio
    begin
      session_file = SessionFinder.file
      audio_files = SessionParser.list_audio_files(session_file)
    rescue SessionFinder::NoSessionFound
      []
    end
  end
end
