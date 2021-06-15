# require 'spec_helper'

describe "Readme file" do

  before :each do
    @file = "README.md"
  end

  it "exists" do
    expect(File.exist?(@file)).to be_truthy
  end

  it "has content" do
    @contents = File.read(@file)
    expect(@contents).not_to be_empty
  end

  
end