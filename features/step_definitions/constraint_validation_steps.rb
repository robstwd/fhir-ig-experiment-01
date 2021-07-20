
Given('a test file named {string} exists') do |testfile|
  @testfile = testfile
  expect(File.exist?(@testfile)).to be_truthy
end

Given('its element {string} has value {string}') do |element, value|
  expect(@testfile).to have_element_with_value(element, value)
end

# command run finally works
When('I run the validator command on the instance {string}') do |testfile|

  cmd = TTY::Command.new(printer: :null)

  begin
    # TODO 1 - profile as variable
    # TODO 2 - deconstruct command string for readability
    # TODO 3 - enable command to run on Windows PC as well as in GitHub actions (ubuntu)
    @output, @err = cmd.run("java -jar C\:\\Users\\rob\\Documents\\PC_stuff\\software\\FHIR\\validator\\validator_cli.jar -version 4.0.1 #{testfile} -ig fhir.ig.experiment.01#dev -profile https://about.me/robeastwood/fhir/ig/StructureDefinition/structuredefinition-hl7au-csd-1 -tx n/a")
  
  rescue TTY::Command::ExitError => e
    # Kernel.puts e.to_s
    @output = e.to_s
    true    
  end

end

Then('the command should {string} with output message {string}') do |status, output_string|
  expect(@output).to include_correct_content(status, output_string)
end

