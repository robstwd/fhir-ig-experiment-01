# require 'spec_helper'

describe "ig.ini" do

  before :each do
    @ini_file = "ig.ini"
    @lines = IO.readlines(@ini_file, chomp: true)
    @lines.map!{|e| e.gsub(/\s/,'')}
    # Kernel.puts @lines.inspect
  end

  it "exists" do
    expect(File.exist?(@ini_file)).to be_truthy
    
    # TODO custom matcher
    #expect(@ini_file).to exist
  end

  it "has first line '[IG]'" do
    firstline = @lines[0]
    expect(firstline).to eql("[IG]")

    # TODO custom matcher
    # expect(@ig_ini).to have_first_line_with_value("[IG"]
  end

  it "has key 'ig = input/resources/ImplementationGuide/fhir.ig.experiment.01.xml'" do
    expect(@lines).to include("ig=input/resources/ImplementationGuide/fhir.ig.experiment.01.xml")
  end

  it "has key 'template = fhir.base.template'" do
    expect(@lines).to include("template=fhir.base.template")
  end

  it "has key 'usage-stats-opt-out = true'" do
    expect(@lines).to include("usage-stats-opt-out=true")
  end

  it "has no other keys" do
    expect(@lines.count).to eql(4)
  end
  
end