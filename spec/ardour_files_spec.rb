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

  context "when there is one session file and related audio files" do
    let(:session_file) { 'mySession.ardour' }
    let(:audio_files) { ['something.wav', 'other.wav'] }

    before do
      SessionFinder.stub(:file).and_return(session_file)
    end

    it ".list returns the ardour session, instant.xml and .history files" do
      ArdourFiles.list.should == ['mySession.ardour', 'instant.xml', '.history']
    end

    it ".list_audio returns the audio files" do
      SessionParser.stub(:list_audio_files).and_return(audio_files)
      ArdourFiles.list_audio.should == ['interchange/mySession/audiofiles/something.wav',
                                        'interchange/mySession/audiofiles/other.wav']

    end
  end
end
