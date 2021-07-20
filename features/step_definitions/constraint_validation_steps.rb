
Given('a test file named {string} exists') do |testfile|
  @testfile = testfile
  expect(File.exist?(@testfile)).to be_truthy
end

Given('its element {string} has value {string}') do |element, value|
  expect(@testfile).to have_element_with_value(element, value)
end

# command run finally works
When('I run the validator command on the instance {string} against profile {string}') do |testfile, profile_id|

  cmd = TTY::Command.new(printer: :null)

  profile_url = "https://about.me/robeastwood/fhir/ig/StructureDefinition/#{profile_id}"

  # determine if the feature is being run on Windows or on Linux
  # on Windows 
  if Gem::Platform.local.os == "mingw32"
    path_to_validator = "C\:\\Users\\rob\\Documents\\PC_stuff\\software\\FHIR\\validator\\validator_cli.jar"
  else
    path_to_validator = "validator.jar"
  end

  validator_command = "java -jar #{path_to_validator} -version 4.0.1 #{testfile} -ig fhir.ig.experiment.01#dev -profile #{profile_url} -tx n/a"

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

