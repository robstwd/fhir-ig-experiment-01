# require 'spec_helper'

EXPECTED_GITIGNORE_CONTENTS = """# Temporary folders #
#####################
temp
template
output

"""

describe ".gitignore file" do

  before :each do
    @file = ".gitignore"
  end

  it "exists" do
    # custom matcher :exist
    expect(@file).to exist
  end

  it "has correct content" do
    @contents = File.read(@file)
    expect(@contents).to eql(EXPECTED_GITIGNORE_CONTENTS)
  end
  
end