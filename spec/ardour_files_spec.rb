require_relative '../lib/ardour_git/ardour_files'

describe ArdourFiles do
  describe "when there is no session file" do
    it "returns an empty list" do
      SessionFinder.should_receive(:file).and_raise(SessionFinder::NoSessionFound.new)
      ArdourFiles.list.should == []
    end
  end

  describe "when there is one session file without any audio file" do
    it "returns the ardour session, instant.xml and .history files" do
      session_file = 'session.ardour'
      SessionFinder.should_receive(:file).and_return(session_file)
      ArdourFiles.list.should == [session_file, 'instant.xml', '.history']
    end
  end

  describe "when there is one session file and related audio files" do
    it "returns the ardour session, the audio files, instant.xml and .history files" do
      session_file = 'session.ardour'
      audio_files = ['something.wav', 'other.wav']
      SessionFinder.should_receive(:file).and_return(session_file)
      SessionParser.should_receive(:list_audio_files).and_return(audio_files)
    ArdourFiles.list.should == ['session.ardour', 'something.wav', 'other.wav', 'instant.xml', '.history']
    end
  end
end
