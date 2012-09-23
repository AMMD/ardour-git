RSpec.configure do |config|
  tmp_dir = 'tmp'

  config.before(:each) do
    FileUtils.mkdir(tmp_dir)
    Dir.chdir(tmp_dir)
  end

  config.after(:each) do
    Dir.chdir('..')
    FileUtils.rm_rf(tmp_dir)
  end

  config.before(:all) {}
  config.after(:all) {}
end
