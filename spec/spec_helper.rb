require 'rubygems'
require 'bundler/setup'
require 'fakefs/spec_helpers'

$:.unshift File.expand_path('../lib', __FILE__)

require 'foreman'
require 'foreman/engine'
require 'foreman/export'
require 'foreman-export-mongroup'

# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.include FakeFS::SpecHelpers, fakefs: true
end

def write_procfile(procfile="Procfile", alpha_env="")
  File.open(procfile, "w") do |file|
    file.puts "alpha: ./alpha" + " #{alpha_env}".rstrip
    file.puts "\n"
    file.puts "bravo:\t./bravo"
  end
  File.expand_path(procfile)
end

def without_fakefs
  FakeFS.deactivate!
  ret = yield
  FakeFS.activate!
  ret
end