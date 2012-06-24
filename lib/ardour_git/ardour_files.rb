class ArdourFiles
  def self.list
    files = []
    session_files = SessionFinder.list
    files.concat(session_files)
    session_files.each do |session|
      files.concat(SessionParser.list_audio_files(session))
    end
    files
  end
end
