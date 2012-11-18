require_relative 'spec_helper'
require_relative '../lib/ardour_git'

describe ArdourGit::Commands::Save do
  it "doesn't do anything if no files exist" do
    ArdourGit::Commands::Init.run
    ArdourGit::Commands::Save.run "message"
  end
end
