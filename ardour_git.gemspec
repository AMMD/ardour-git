require File.join([File.dirname(__FILE__),'lib','ardour_git','version.rb'])
Gem::Specification.new do |s|
  s.name = 'ardour_git'
  s.version = ArdourGit::VERSION

  s.authors = ['Merouane Atig']
  s.email = 'merouane.atig@gmail.com'
  s.homepage = %q{https://github.com/AMMD/ardour-git}
  s.summary = 'Ardour git'
  s.description = 'Put Ardour projects under version control with git'

  s.files = Dir['{lib}/**/*.rb', 'bin/*', "*.md"]
  s.executables = 'ardour_git'
  s.require_paths << 'lib'
  s.bindir = 'bin'
  s.add_development_dependency('rspec')
  s.add_runtime_dependency('gli', '2.2.1')
end
