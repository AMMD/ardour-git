require_relative '../lib/ardour_git'

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

  it "gets the list of regions in session file" do
    xml = <<-EOS
<?xml version="1.0" encoding="UTF-8"?>
<Session>
  <Regions>
    <Region id="117" name="Audio 2-1" start="0" length="322560" position="134144" ancestral-start="0" ancestral-length="0" stretch="1" shift="1" first_edit="nothing" layer="0" sync-position="0" flags="Opaque,DefaultFadeIn,DefaultFadeOut,Automatic,WholeFile,FadeIn,FadeOut" scale-gain="1" source-0="98" source-1="100" channels="2" master-source-0="98" master-source-1="100">
      <FadeIn default="yes" active="yes"/>
      <FadeOut default="yes" active="yes"/>
      <Envelope default="yes"/>
    </Region>
    <Region id="144" name="Audio 1-1" start="0" length="202752" position="456704" ancestral-start="0" ancestral-length="0" stretch="1" shift="1" first_edit="nothing" layer="0" sync-position="0" flags="Opaque,DefaultFadeIn,DefaultFadeOut,Automatic,WholeFile,FadeIn,FadeOut" scale-gain="1" source-0="75" channels="1" master-source-0="75">
      <FadeIn default="yes" active="yes"/>
      <FadeOut default="yes" active="yes"/>
      <Envelope default="yes"/>
    </Region>
  </Regions>
</Session>
    EOS
    regions = SessionParser.list_regions(xml)
    regions.should == [{:id => "117", :name => "Audio 2-1"},
                       {:id => "144", :name => "Audio 1-1"}]
  end
end
