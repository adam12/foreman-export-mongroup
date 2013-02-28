require 'spec_helper'

describe Foreman::Export::Mongroup, fakefs: true do
  let(:procfile)  { FileUtils.mkdir_p("/tmp/app") ; write_procfile("/tmp/app/Procfile") }
  let(:location)  { "/tmp/app" }
  let(:formation) { nil }
  let(:engine)    { Foreman::Engine.new(:formation => formation).load_procfile(procfile) }
  let(:options)   { Hash.new }
  let(:mongroup)  { Foreman::Export::Mongroup.new(location, engine, options) }
  let(:example_export_file) do
    without_fakefs { File.read(File.dirname(__FILE__) + "/fixtures/mongroup.default") }
  end
  
  it 'exports to the filesystem' do
    mongroup.export
    File.read("/tmp/app/mongroup.conf").should == example_export_file
  end
end