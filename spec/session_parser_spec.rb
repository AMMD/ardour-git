require_relative '../lib/session_parser'

describe SessionParser do
  it 'gets the list of the session audio files' do
    xml = <<-EOS
<?xml version="1.0" encoding="UTF-8"?>  
<Session>
  <Sources>
    <Source name="Audio 1-1.wav" />
    <Source name="Audio 2-1%L.wav" />
    <Source name="Audio 2-1%R.wav" />
  </Sources>
</Session>
EOS
    audio_files = SessionParser.list_audio_files(xml)
    audio_files.should == ['Audio 1-1.wav', 'Audio 2-1%L.wav', 'Audio 2-1%R.wav']
  end
end
