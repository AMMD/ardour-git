Gem::Specification.new do |s|
  s.name = 'ardour_git'
  s.version = '0.0.1'
  s.date = '2012-06-24'
  s.summary = 'Ardour git'
  s.description = 'Version Ardour projects with git'
  s.authors = ['Merouane Atig']
  s.email = 'merouane.atig@gmail.com'

  s.files = Dir['{lib}/**/*.rb', 'bin/*', "*.md"]
  s.executables = 'ardour_git'
  s.require_paths = ['lib']
end
