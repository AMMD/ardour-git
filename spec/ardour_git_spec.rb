require_relative '../lib/ardour_git'

describe ArdourGit do
  after(:each) do
    FileUtils.rm_rf('.ardourgit')
  end

  it "creates a git repository when create command is called" do
    ArdourGit.new.create
    (FileTest.exist? ".ardourgit").should == true
  end
end
