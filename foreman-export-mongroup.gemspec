Gem::Specification.new do |gem|
  gem.name    = 'foreman-export-mongroup'
  gem.version = '0.0.2'
  gem.date    = Date.today.to_s

  gem.add_dependency 'foreman', '>= 0.59.0'

  gem.summary = "Mongroup export scripts for foreman"
  gem.description = "Mongroup export scripts for foreman"

  gem.authors  = ['Adam Daniels']
  gem.email    = 'adam@mediadrive.ca'
  gem.homepage = 'http://github.com/adam12/foreman-export-mongroup'
  gem.license  = 'MIT'

  gem.has_rdoc = false
  gem.extra_rdoc_files = ['README.md']

  gem.files = Dir['{lib}/**/*', 'README.md']
end