require 'inifile'
# https://www.rubydoc.info/gems/inifile/3.0.0/IniFile

describe "ig.ini" do

  before :each do
    @file = 'ig.ini'
    @ini_file = IniFile.load('ig.ini')
  end

  it "exists" do
    # custom matcher :exist
    expect(@file).to exist
  end

  it "has only one section '[IG]'" do
    sections = @ini_file.sections
    expect(sections).to eq(["IG"])
  end

  it "has only 3 properties" do
    count_of_properties = @ini_file['IG'].size
    expect(count_of_properties).to eq(3)
  end

  it " * has property 'ig = input/resources/ImplementationGuide/fhir.ig.experiment.01.xml'" do
    properties = @ini_file['IG']
    expect(properties).to include("ig"=>"input/resources/ImplementationGuide/fhir.ig.experiment.01.xml")
  end

  it " * has property 'template = fhir.base.template'" do
    properties = @ini_file['IG']
    expect(properties).to include("template"=>"fhir.base.template")
  end

  it " * has property 'usage-stats-opt-out = true'" do
    properties = @ini_file['IG']
    expect(properties).to include("usage-stats-opt-out"=>true)
  end
  
end