require_relative 'spec_helper'
require_relative '../lib/ardour_git'

describe ArdourGit::Commands::Init do
  it "initialize an empty git repository" do
    ArdourGit::Commands::Init.run
    Dir.exists?('.git').should be_true
  end
end
