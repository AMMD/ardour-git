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
      session_name = File.basename(session_file, '.ardour')
      files = SessionParser.list_audio_files(session_file)
      audio_files = []
      files.each do |file|
        audio_files << File.join('interchange', session_name, 'audiofiles', file)
      end
      audio_files
    rescue SessionFinder::NoSessionFound
      []
    end
  end
end
