# require 'spec_helper'

describe "Readme file" do

  before :each do
    @file = "README.md"
    @contents = File.read(@file)
  end

  it "exists" do
    # custom matcher :exist
    expect(@file).to exist
  end

  it "has content" do    
    expect(@contents).not_to be_empty
  end

  
end