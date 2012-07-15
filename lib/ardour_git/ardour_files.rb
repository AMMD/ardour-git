require_relative 'session_parser'
require_relative 'session_finder'

class ArdourFiles
  def self.list
    begin
      session_file = SessionFinder.file
      files = [session_file]
      audio_files = SessionParser.list_audio_files(session_file)
      files += audio_files
      files += ['instant.xml', '.history']
    rescue SessionFinder::NoSessionFound
      []
    end
  end
end
