require_relative '../lib/ardour_git/ardour_files'

describe ArdourFiles do
  it 'returns an empty list when no session files exist' do
    session_files = []
    SessionFinder.stub(:list).and_return(session_files)
    ArdourFiles.list.should == session_files
  end

  it 'returns the ardour session file when it exists' do
    session_files = ['session.ardour']
    SessionFinder.stub(:list).and_return(session_files)
    ArdourFiles.list.should == session_files
  end

  it 'parses the ardour session file to return all project files' do
    session_files = ['session.ardour']
    audio_files = ['something.wav', 'other.wav']
    SessionFinder.stub(:list).and_return(session_files)
    SessionParser.stub(:list_audio_files).and_return(audio_files)
    ArdourFiles.list.should == ['session.ardour', 'something.wav', 'other.wav']
  end
end
