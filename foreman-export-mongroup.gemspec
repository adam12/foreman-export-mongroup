Gem::Specification.new do |gem|
  gem.name    = 'foreman-export-mongroup'
  gem.version = '0.0.1'
  gem.date    = Date.today.to_s

  gem.add_dependency 'foreman', '>= 0.59.0'

  # gem.add_development_dependency 'rspec',   '~> 2.8.0'
  # gem.add_development_dependency 'fuubar'
  # gem.add_development_dependency 'ZenTest', '~> 4.4.2'
  # gem.add_development_dependency 'fakefs'

  gem.summary = "Mongroup export scripts for foreman"
  gem.description = "Mongroup export scripts for foreman"

  gem.authors  = ['Adam Daniels']
  gem.email    = 'adam@mediadrive.ca'
  gem.homepage = 'http://github.com/nature/foreman-export-nature'

  gem.has_rdoc = false
  # gem.extra_rdoc_files = ['README.md']

  gem.files = Dir['{bin,lib,data}/**/*', 'README.md']

  # gem.executables = "nature-foreman"
end