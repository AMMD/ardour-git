Gem::Specification.new do |s|
  s.name = 'ardour_git'
  s.version = '0.2'

  s.authors = ['Merouane Atig']
  s.email = 'merouane.atig@gmail.com'
  s.homepage = %q{https://github.com/AMMD/ardour-git}
  s.summary = 'Ardour git'
  s.description = 'Version Ardour projects with git'

  s.files = Dir['{lib}/**/*.rb', 'bin/*', "*.md"]
  s.executables = 'ardour_git'
  s.require_paths = ['lib']
end
