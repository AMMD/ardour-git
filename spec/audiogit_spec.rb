require_relative '../lib/audiogit'

describe AudioGit do
  after(:each) do
    FileUtils.rm_rf('.audiogit')
  end

  it "creates a git repository when create command is called" do
    AudioGit.new.create
    (FileTest.exist? ".audiogit").should == true
  end
end
