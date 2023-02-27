
Given('a test file named {string} exists') do |testfile|
  @testfile = testfile
  expect(File.exist?(@testfile)).to be_truthy
end

Given('its element {string} has value {string}') do |element, value|
  expect(@testfile).to have_element_with_value(element, value)
end

# command run finally works
When('I run the validator command on this testfile against profile {string}') do |profile_id|

  cmd = TTY::Command.new(printer: :null)

  # determine if the feature is being run on Windows or on Linux
  # on Windows 
  if Gem::Platform.local.os == "mingw"
    path_to_validator = "C\:\\Users\\rob\\Documents\\PC_stuff\\software\\FHIR\\validator\\validator_cli.jar"
  else
    path_to_validator = "validator.jar"
  end

  ig = "fhir.ig.experiment.01#dev"

  profile_url = "https://about.me/robeastwood/fhir/ig/StructureDefinition/#{profile_id}"

  # term_server = "https://r4.ontoserver.csiro.au/fhir"
  # term_server = "n/a"
  # -tx #{term_server}

  validator_command = "java -jar #{path_to_validator} -version 4.0.1 #{@testfile} -ig #{ig} -profile #{profile_url}"

  begin
    @output, @err = cmd.run(validator_command)
  
  rescue TTY::Command::ExitError => e
    # Kernel.puts e.to_s
    @output = e.to_s
    true    
  end

end

Then('the command should {string} with output message {string}') do |status, output_string|
  expect(@output).to include_correct_content(status, output_string)
end

Given('element {string} is not present') do |element_name|
  expect(@testfile).not_to have_element(element_name)
end

Given('extension {string} has child element {string} with value {string}') do |extension_url, child_element, value|
  expect(@testfile).to have_extension_with_element_and_value(extension_url, child_element, value)
end