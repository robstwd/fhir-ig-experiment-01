NAMESPACE = { "n" => "http://hl7.org/fhir" }

PROFILES = {
  "Patient Base"            => "Patient-base",
  "Patient Specific"        => "Patient-specific",
  "Patient Mandatory Name"  => "Patient-mandatoryname",
  "Patient with Mandatory Identifier"  => "patient-ident-1",
  "HL7 AU StructureDefinition Base"         => "structuredefinition-hl7au-sdf-1",
  "HL7 AU CodeSystem Base"         => "structuredefinition-hl7au-csd-1",
  "HL7 AU CodeSystem AU Extended"  => "structuredefinition-hl7au-csd-ext-1",
  "HL7 AU ValueSet Base"           => "structuredefinition-hl7au-vsd-1",
  "HL7 AU ValueSet AU Extended"    => "structuredefinition-hl7au-vsd-ext-1"
  }

# array of resources/profiles that are the basis of derivation
RESOURCES = {
  "R4 Patient resource"             => "http://hl7.org/fhir/StructureDefinition/Patient",
  "R4 StructureDefinition resource" => "http://hl7.org/fhir/StructureDefinition/StructureDefinition",
  "HL7 AU CodeSystem Base"          => "https://about.me/robeastwood/fhir/ig/StructureDefinition/structuredefinition-hl7au-csd-1",
  "HL7 AU ValueSet Base"            => "https://about.me/robeastwood/fhir/ig/StructureDefinition/structuredefinition-hl7au-vsd-1"
  }

FAILURE_MESSAGE_START = "\n VALIDATION FAILURE:\n "
FAILURE_MESSAGE_END   = "\n\n"

class NodeNotPresentError < StandardError; end
class NodePresentMustSupportNotSetError < StandardError; end
class NodePresentMustSupportFalseError < StandardError; end
class ConstraintNotPresentError < StandardError; end
class BindingNotPresentError < StandardError; end
class FileNotPresentError < StandardError; end
class NodePresentFixedStringNotSetError < StandardError; end
class NodePresentFixedCodeNotSetError < StandardError; end
class NodePresentFixedUriNotSetError < StandardError; end
class NodePresentFixedBooleanNotSetError < StandardError; end
class NodePresentFixedCanonicalNotSetError < StandardError; end

module MatcherHelpers
  def get_profile_id(profile_name)
    return PROFILES[profile_name]
  end

  def get_resource_url(resource)
    return RESOURCES[resource]
  end

  def get_filename(profile_id)
      file = "#{Dir.pwd}/output/StructureDefinition-#{profile_id}.xml"
      return file
  end

  def get_nokogiri_doc(file)
    return File.open(file) { |f| Nokogiri::XML(f) }.remove_namespaces!
  end

  def get_baseDefinition(profile_id)
    file = get_filename(@profile_id)
    doc = get_nokogiri_doc(file)
    baseDefinition = doc.xpath("/StructureDefinition/baseDefinition/@value").to_s
    return baseDefinition
  end

  def get_element_value(xpath)
    source.xpath(xpath).to_s
  end

  def get_nodeset(element)
    file = get_filename(@profile_id)
    doc = get_nokogiri_doc(file)
    xpath = "/StructureDefinition/differential/element[@id='#{element}']"
    return doc.xpath(xpath)
  end

  def get_nodeset_from_snapshot(element)
    file = get_filename(@profile_id)
    doc = get_nokogiri_doc(file)
    xpath = "/StructureDefinition/snapshot/element[@id='#{element}']"
    return doc.xpath(xpath)
  end

  # this method retuns a nodeset from a test file 
  # arguments 
  #   - testfile under examination (relative location ie 'test/CodeSystem/codesystem-hl7au-csd-base-02-fail-01.xml')
  #   - the element under examination, in full FHIR Resource.element notation ie 'CodeSystem.url'
  #     (the FHIR notation ios converted into xpath for Nokogiri)
  def get_nodeset_testfile(testfile,element)
    doc = get_nokogiri_doc(testfile)
    element_xpath = "/#{element.gsub('.','/')}"
    # Kernel.puts doc.xpath(element_xpath)
    return doc.xpath(element_xpath)
  end

  def get_profile_cardinality(element_name)
    file = get_filename(@profile_id)
    doc = get_nokogiri_doc(file)
    xpath_min = "/StructureDefinition/snapshot/element[@id='#{element_name}']/min/@value"
    xpath_max = "/StructureDefinition/snapshot/element[@id='#{element_name}']/max/@value"
    min = doc.xpath(xpath_min)
    max = doc.xpath(xpath_max)
    return "#{min}..#{max}"
  end

  def get_default_cardinality(element_name)
    file = get_filename(@profile_id)
    doc = get_nokogiri_doc(file)
    xpath_min = "/StructureDefinition/snapshot/element[@id='#{element_name}']/base/min/@value"
    xpath_max = "/StructureDefinition/snapshot/element[@id='#{element_name}']/base/max/@value"
    min = doc.xpath(xpath_min)
    max = doc.xpath(xpath_max)
    return "#{min}..#{max}"
  end

  def print_failure_message(error_msg)
    "#{FAILURE_MESSAGE_START}" \
    "#{error_msg}" \
    "#{FAILURE_MESSAGE_END}"
  end

  # this method captures the error message summary line of the FHIR validator, if present (ie when a failure actually occurs)
  # eg "*FAILURE*: 1 errors, 0 warnings, 0 notes"
  # this returns a MatchData object (https://ruby-doc.org/core-2.6.8/MatchData.html)
  # the argument is the FHIR validator output as a string
  def get_validator_error_summary(validator_output)
    text_to_match = %r{(\*FAILURE\*:(.*))}
    return text_to_match.match(validator_output)     
  end

end


# This matcher determines if the named profile (as html or xml, or any available filetype) is found in the output folder of the IG
RSpec::Matchers.define :have_generated_filetype do |file_type|

  include MatcherHelpers

  match do |source|
    @profile_name = source
    @profile_id = get_profile_id(@profile_name)
    @file_type = file_type
    @file = "#{Dir.pwd}/output/StructureDefinition-#{@profile_id}.#{@file_type}"
    
    @error_msg = "The profile '#{@profile_name}' does not exist in the generated output directory\n" \
                 " Expecting file: '../output/StructureDefinition-#{@profile_id}.#{@file_type}'"

    expect(File.exist?(@file)).to be_truthy

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines from what resource, the profile under test, has been derived
RSpec::Matchers.define :be_derived_from do |primary_resource|

  include MatcherHelpers

  match do |source|
    
    begin

      # profile under test
      @profile_name = source
      @profile_id = get_profile_id(@profile_name)
      # puts @profile_name, @profile_id

      # primary resource that is expected
      @primary_resource = primary_resource
      @expected_baseDefinition = get_resource_url(@primary_resource)
      # puts @primary_resource, @expected_baseDefinition

      # get profile file path and name
      profile_filename = get_filename(@profile_id)

      # if profile exists then
      if File.exist?(profile_filename)
        #puts "profile exists"

        # find the actual baseDefinition value in the profile
        @actual_baseDefinition = get_baseDefinition(@profile_id)

        @error_msg = "The profile '#{@profile_name}' has the incorrect baseDefinition value.\n" \
                 " - expected:        <#{@expected_baseDefinition}>\n" \
                 " - instead found:   <#{@actual_baseDefinition}>"

        expect(@actual_baseDefinition).to eq(@expected_baseDefinition)

      # when the profile file does not exist
      else
        puts "profile does not exist"
        raise(FileNotPresentError)
      end

    rescue FileNotPresentError
      @error_msg = "The generated profile StructureDefinition xml file does not exist\n" \
                 " Expecting file: '../output/StructureDefinition-#{@profile_id}.xml'"
      false
    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if a given element has its must support flag set to true
RSpec::Matchers.define :have_must_support_set_to_true_for_element do |element_name|

  include MatcherHelpers

  match do |source|

    begin
        # profile under test
        @profile_name = source
        @profile_id = get_profile_id(@profile_name)
        # puts @profile_name, @profile_id

        # element
        @element_name = element_name
        # puts @element_name

        # nodeset
        nodeset = get_nodeset(@element_name)
        # puts nodeset.length, nodeset.empty?

        # check first if element is actually present
        if nodeset.empty?
            raise(NodeNotPresentError)
        else
            # then check if mustSupport element is then present
            if nodeset.xpath("mustSupport").empty?
                raise(NodePresentMustSupportNotSetError)

            else
                # check if MustSupport is "true"
                if nodeset.xpath("mustSupport/@value").to_s == "true"
                    true
                elsif nodeset.xpath("mustSupport/@value").to_s == "false"
                    raise(NodePresentMustSupportFalseError)
                end

            end

        end

    rescue NodeNotPresentError
       @error_msg = "Element '#{@element_name}' not present"
       false

    rescue NodePresentMustSupportNotSetError
       @error_msg = "Element '#{@element_name}' is present but mustSupport has not been set"
       false

    rescue NodePresentMustSupportFalseError
       @error_msg = "Element '#{@element_name}' is present but mustSupport is set to 'false'"
       false

    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if a given element has the expected cardinality
RSpec::Matchers.define :have_element_with_cardinality do |element_name, cardinality|

  include MatcherHelpers

  match do |source|

        # profile under test
        @profile_name = source
        @profile_id = get_profile_id(@profile_name)
        # Kernel.puts @profile_name, @profile_id

        # element
        @element_name = element_name
        # Kernel.puts @element_name

        # cardinality
        @expected_cardinality = cardinality
        # Kernel.puts @expected_cardinality

        # nodeset
        nodeset = get_nodeset_from_snapshot(@element_name)
        # Kernel.puts nodeset.length, nodeset.empty?

        # get min value
        @actual_min_value = nodeset.xpath("min/@value").to_s

        # get max value
        @actual_max_value = nodeset.xpath("max/@value").to_s

        # get actual_cardinality
        @actual_cardinality = "#{@actual_min_value}..#{@actual_max_value}"

        @error_msg = "The profile '#{@profile_name}' has the incorrect cardinality for element: #{@element_name} \n" \
                     " - expected:           '#{@expected_cardinality}'\n" \
                     " - instead found:      '#{@actual_cardinality}'"

        expect(@actual_cardinality).to eq(@expected_cardinality)

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# this matcher determines if the element has its default cardinality
RSpec::Matchers.define :have_element_with_default_cardinality do |element_name|

  include MatcherHelpers

  match do |source|

    #profile under test
    @profile_name = source
    @profile_id = get_profile_id(@profile_name)
    # puts @profile_name, @profile_id

    # element
    @element_name = element_name
    # puts @element_name

    # from snapshot
    @profile_cardinality = get_profile_cardinality(@element_name)
    @default_cardinality = get_default_cardinality(@element_name)

    @error_msg = "The profile '#{@profile_name}' has the incorrect cardinality for element: #{@element_name} \n" \
                 " - expected the default cardinality: '#{@default_cardinality}'\n" \
                 " - instead found:                    '#{@profile_cardinality}'\n"

    expect(@profile_cardinality).to eq(@default_cardinality)

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# this matcher determines if the element has its expected invariant
RSpec::Matchers.define :have_element_with_invariant do |element_name, invariant|

  include MatcherHelpers

  match do |source|

    #profile under test
    @profile_name = source
    @profile_id = get_profile_id(@profile_name)
    # puts @profile_name, @profile_id

    # element
    @element_name = element_name
    # puts @element_name

    # invariant - expected
    @invariant_expected_combined = invariant
    @invariant_expected_parts = @invariant_expected_combined.split("::")
    @invariant_expected_key = @invariant_expected_parts[0]
    @invariant_expected_severity = @invariant_expected_parts[1]
    @invariant_expected_human = @invariant_expected_parts[2]
    # Kernel.puts @invariant_expected_key, @invariant_expected_severity, @invariant_expected_human

    # get the nodeset for the element under test
    nodeset_element = get_nodeset(@element_name)

    begin

      # when the element is not present
      if nodeset_element.empty?
        raise(NodeNotPresentError)

      # the element is present
      else

        # is the constraint with expected key present?
        expected_key_present = nodeset_element.at_xpath("constraint/key[@value='#{@invariant_expected_key}']")

        # if there is no constraint with the particular invariant key
        if expected_key_present.nil?
          raise(ConstraintNotPresentError)

        # there is a constraint with the particular invariant key
        else

          # then get the nodeset with the constraint that has the desired key (there may be multiple constraints)
          # this finds the constraint with the particular key element
          # then traverses up to collect the parent, ie the entire constraint node
          nodeset_constraint = nodeset_element.at_xpath("constraint/key[@value='#{@invariant_expected_key}']").parent

          # get the actual constraint parts
          @invariant_actual_key = nodeset_constraint.at_xpath("key/@value").to_s
          @invariant_actual_severity = nodeset_constraint.at_xpath("severity/@value").to_s
          @invariant_actual_human = nodeset_constraint.at_xpath("human/@value").to_s
          @invariant_actual_expression = nodeset_constraint.at_xpath("expression/@value").to_s
          # Kernel.puts @invariant_actual_key, @invariant_actual_severity, @invariant_actual_human, @invariant_actual_expression

          @actual_invariant_combined = "#{@invariant_actual_key}::#{@invariant_actual_severity}::#{@invariant_actual_human}"

          @error_msg = "The profile '#{@profile_name}' has the incorrect constraint for element: #{@element_name} \n\n" \
                       " Expected ...\n" \
                       "  - key: #{@invariant_expected_key}\n" \
                       "  - severity: #{@invariant_expected_severity}\n" \
                       "  - human: #{@invariant_expected_human}\n\n" \
                       " Instead found ...\n" \
                       "  - key: #{@invariant_actual_key}\n" \
                       "  - severity: #{@invariant_actual_severity}\n" \
                       "  - human: #{@invariant_actual_human}"

          expect(@actual_invariant_combined).to eq(@invariant_expected_combined)

        end

      end

    rescue NodeNotPresentError
      @error_msg = "Element #{@element_name} not present"
      false

    rescue ConstraintNotPresentError
      @error_msg = "Element #{@element_name} is present, but there is no constraint present with key '#{@invariant_expected_key}'"
      false

    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# this matcher determines if the element has its expected terminology binding
RSpec::Matchers.define :have_element_with_binding do |element_name, valueset, strength|

  include MatcherHelpers

  match do |source|

    #profile under test
    @profile_name = source
    @profile_id = get_profile_id(@profile_name)
    # puts @profile_name, @profile_id

    # element
    @element_name = element_name
    # puts @element_name

    # binding - expected
    @expected_valueset = valueset
    @expected_strength = strength
    @expected_binding_combined = "#{@expected_valueset};#{@expected_strength}"
    # puts @expected_valueset, @expected_strength

    # get the nodeset for the element under test
    nodeset_element = get_nodeset(@element_name)

    begin

      # when the element is not present
      if nodeset_element.empty?
        raise(NodeNotPresentError)

      # the element is present
      else

        # is the binding element present (in differential)?
        binding_nodeset= nodeset_element.at_xpath("binding")

        # if there is no binding element present
        if binding_nodeset.nil?
          raise(BindingNotPresentError)

        # there is a binding element present
        else

          # get the actual binding parts
          @actual_valueset = binding_nodeset.at_xpath("valueSet/@value").to_s
          @actual_strength = binding_nodeset.at_xpath("strength/@value").to_s
          # puts @actual_valueset, @actual_strength

          @actual_binding_combined = "#{@actual_valueset};#{@actual_strength}"

          @error_msg = "The profile '#{@profile_name}' has the incorrect binding for element: #{@element_name} \n" \
                       " Expected ...\n" \
                       "  - valueset: #{@expected_valueset}\n" \
                       "  - strength: #{@expected_strength}\n" \
                       " Instead found ...\n" \
                       "  - valueset: #{@actual_valueset}\n" \
                       "  - strength: #{@actual_strength}"

          expect(@actual_binding_combined).to eq(@expected_binding_combined)

        end

      end

    rescue NodeNotPresentError
      @error_msg = "Element #{@element_name} not present"
      false

    rescue BindingNotPresentError
      @error_msg = "Element #{@element_name} is present, but there is no constraint on binding"
      false

    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end

# This matcher determines if a given element has a specific fixedString value
RSpec::Matchers.define :have_element_with_fixedString do |element_name, string|

  include MatcherHelpers

  match do |source|

    begin

      # profile under test
      @profile_name = source
      @profile_id = get_profile_id(@profile_name)
      # Kernel.puts @profile_name, @profile_id

      # element
      @element_name = element_name
      # Kernel.puts @element_name

      # fixedString
      @expected_fixedString = string
      # Kernel.puts @expected_fixedString

      # nodeset
      nodeset = get_nodeset_from_snapshot(@element_name)
      # Kernel.puts nodeset.length, nodeset.empty?

      # check first if element is actually present
      if nodeset.empty?
        raise(NodeNotPresentError)
      else
        # then check if fixedString element is then present
        if nodeset.xpath("fixedString").empty?
        raise(NodePresentFixedStringNotSetError)

        else
          # get fixedString value
          @actual_fixedString = nodeset.xpath("fixedString/@value").to_s
          # Kernel.puts @actual_fixedString

          @error_msg = "The profile '#{@profile_name}' has the incorrect fixedString value for element: #{@element_name} \n" \
          " - expected:           '#{@expected_fixedString}'\n" \
          " - instead found:      '#{@actual_fixedString}'"

          expect(@actual_fixedString).to eq(@expected_fixedString)

        end
      end
      
    rescue NodeNotPresentError
      @error_msg = "Element '#{@element_name}' not present"
      false

    rescue NodePresentFixedStringNotSetError
      @error_msg = "Element '#{@element_name}' is present but a fixedString has not been set"
      false
      
    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if a given element has a specific fixedCode value
RSpec::Matchers.define :have_element_with_fixedCode do |element_name, code|

  include MatcherHelpers

  match do |source|

    begin

      # profile under test
      @profile_name = source
      @profile_id = get_profile_id(@profile_name)
      # Kernel.puts @profile_name, @profile_id

      # element
      @element_name = element_name
      # Kernel.puts @element_name

      # fixedCode
      @expected_fixedCode = code
      # Kernel.puts @expected_fixedCode

      # nodeset
      nodeset = get_nodeset_from_snapshot(@element_name)
      # Kernel.puts nodeset.length, nodeset.empty?

      # check first if element is actually present
      if nodeset.empty?
        raise(NodeNotPresentError)
      else
        # then check if fixedCode element is then present
        if nodeset.xpath("fixedCode").empty?
        raise(NodePresentFixedCodeNotSetError)

        else
          # get fixedCode value
          @actual_fixedCode = nodeset.xpath("fixedCode/@value").to_s
          # Kernel.puts @actual_fixedCode

          @error_msg = "The profile '#{@profile_name}' has the incorrect fixedCode value for element: #{@element_name} \n" \
          " - expected:           '#{@expected_fixedCode}'\n" \
          " - instead found:      '#{@actual_fixedCode}'"

          expect(@actual_fixedCode).to eq(@expected_fixedCode)

        end
      end
      
    rescue NodeNotPresentError
      @error_msg = "Element '#{@element_name}' not present"
      false

    rescue NodePresentFixedCodeNotSetError
      @error_msg = "Element '#{@element_name}' is present but a fixedCode has not been set"
      false
      
    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if a given element has a specific fixedUri value
RSpec::Matchers.define :have_element_with_fixedUri do |element_name, uri|

  include MatcherHelpers

  match do |source|

    begin

      # profile under test
      @profile_name = source
      @profile_id = get_profile_id(@profile_name)
      # Kernel.puts @profile_name, @profile_id

      # element
      @element_name = element_name
      # Kernel.puts @element_name

      # fixedUri
      @expected_fixedUri = uri
      # Kernel.puts @expected_fixedUri

      # nodeset
      nodeset = get_nodeset_from_snapshot(@element_name)
      # Kernel.puts nodeset.length, nodeset.empty?

      # check first if element is actually present
      if nodeset.empty?
        raise(NodeNotPresentError)
      else
        # then check if fixedUri element is then present
        if nodeset.xpath("fixedUri").empty?
        raise(NodePresentFixedUriNotSetError)

        else
          # get fixedUri value
          @actual_fixedUri = nodeset.xpath("fixedUri/@value").to_s
          # Kernel.puts @actual_fixedUri

          @error_msg = "The profile '#{@profile_name}' has the incorrect fixedUri value for element: #{@element_name} \n" \
          " - expected:           '#{@expected_fixedUri}'\n" \
          " - instead found:      '#{@actual_fixedUri}'"

          expect(@actual_fixedUri).to eq(@expected_fixedUri)

        end
      end
      
    rescue NodeNotPresentError
      @error_msg = "Element '#{@element_name}' not present"
      false

    rescue NodePresentFixedUriNotSetError
      @error_msg = "Element '#{@element_name}' is present but a fixedUri has not been set"
      false
      
    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if a given element has a specific fixedBoolean value
RSpec::Matchers.define :have_element_with_fixedBoolean do |element_name, boolean|

  include MatcherHelpers

  match do |source|

    begin

      # profile under test
      @profile_name = source
      @profile_id = get_profile_id(@profile_name)
      # Kernel.puts @profile_name, @profile_id

      # element
      @element_name = element_name
      # Kernel.puts @element_name

      # fixedBoolean
      @expected_fixedBoolean = boolean
      # Kernel.puts @expected_fixedBoolean

      # nodeset
      nodeset = get_nodeset_from_snapshot(@element_name)
      # Kernel.puts nodeset.length, nodeset.empty?

      # check first if element is actually present
      if nodeset.empty?
        raise(NodeNotPresentError)
      else
        # then check if fixedBoolean element is then present
        if nodeset.xpath("fixedBoolean").empty?
        raise(NodePresentFixedBooleanNotSetError)

        else
          # get fixedBoolean value
          @actual_fixedBoolean = nodeset.xpath("fixedBoolean/@value").to_s
          # Kernel.puts @actual_fixedBoolean

          @error_msg = "The profile '#{@profile_name}' has the incorrect fixedBoolean value for element: #{@element_name} \n" \
          " - expected:           '#{@expected_fixedBoolean}'\n" \
          " - instead found:      '#{@actual_fixedBoolean}'"

          expect(@actual_fixedBoolean).to eq(@expected_fixedBoolean)

        end
      end
      
    rescue NodeNotPresentError
      @error_msg = "Element '#{@element_name}' not present"
      false

    rescue NodePresentFixedUriNotSetError
      @error_msg = "Element '#{@element_name}' is present but a fixedBoolean has not been set"
      false
      
    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if a given element has a specific fixedCanonical value
RSpec::Matchers.define :have_element_with_fixedCanonical do |element_name, canonical|

  include MatcherHelpers

  match do |source|

    begin

      # profile under test
      @profile_name = source
      @profile_id = get_profile_id(@profile_name)
      # Kernel.puts @profile_name, @profile_id

      # element
      @element_name = element_name
      # Kernel.puts @element_name

      # fixedCanonical
      @expected_fixedCanonical = canonical
      # Kernel.puts @expected_fixedCanonical

      # nodeset
      nodeset = get_nodeset_from_snapshot(@element_name)
      # Kernel.puts nodeset.length, nodeset.empty?

      # check first if element is actually present
      if nodeset.empty?
        raise(NodeNotPresentError)
      else
        # then check if fixedCanonical element is then present
        if nodeset.xpath("fixedCanonical").empty?
        raise(NodePresentFixedCanonicalNotSetError)

        else
          # get fixedCanonical value
          @actual_fixedCanonical = nodeset.xpath("fixedCanonical/@value").to_s
          # Kernel.puts @actual_fixedCanonical

          @error_msg = "The profile '#{@profile_name}' has the incorrect fixedCanonical value for element: #{@element_name} \n" \
          " - expected:           '#{@expected_fixedCanonical}'\n" \
          " - instead found:      '#{@actual_fixedCanonical}'"

          expect(@actual_fixedCanonical).to eq(@expected_fixedCanonical)

        end
      end
      
    rescue NodeNotPresentError
      @error_msg = "Element '#{@element_name}' not present"
      false

    rescue NodePresentFixedCanonicalNotSetError
      @error_msg = "Element '#{@element_name}' is present but a fixedCanonical has not been set"
      false
      
    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if a given element in a test file has a specific value
RSpec::Matchers.define :have_element_with_value do |element_name, value|

  include MatcherHelpers

  match do |source|

    begin

      # file under test
      @testfile_name = source
      # Kernel.puts @testfile_name

      # element being examined
      @element_name = element_name
      # Kernel.puts @element_name

      # expected value
      @expected_value = value
      # Kernel.puts @expected_value

      # get xml value in nodeset
      nodeset = get_nodeset_testfile(@testfile_name,@element_name)
      # Kernel.puts nodeset.length, nodeset.empty?, nodeset.class

      # check first if element is actually present
      if nodeset.empty?
        raise(NodeNotPresentError)
      else

          # get the value
          @actual_value = nodeset.xpath("@value").to_s
          # Kernel.puts @actual_value

          @error_msg = "The test file '#{@testfile_name}' has the incorrect value for element: #{@element_name} \n" \
          " - expected:           '#{@expected_value}'\n" \
          " - instead found:      '#{@actual_value}'"

          expect(@actual_value).to eq(@expected_value)
      end
      
    rescue NodeNotPresentError
      @error_msg = "Element '#{@element_name}' not present"
      false
      
    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if the FHIR validator output contains the correct content
# argument: status = the expected result as pass or fail
# output_string: = the expected text to find in the output
# source: the actual output message
RSpec::Matchers.define :include_correct_content do |status, output_string| # element_name, value

  include MatcherHelpers

  match do |source|

    # the actual output message
    @actual_output = source
    # Kernel.puts @actual_output

    # expected command status
    @expected_status = status
    # Kernel.puts @expected_status

    # expected output string
    @expected_output_string = output_string
    # Kernel.puts @expected_output_string

    # prepare first line of the failure message, which is identical for the failure and success scenarios
    @error_msg_first_line = "The validator command was expected to #{@expected_status} containing message: #{@expected_output_string} \n"

    # when the validator is expected to succeed
    if @expected_status == "succeed" 

      # capture the error message summary line, if one exists
      @error_summary = get_validator_error_summary(@actual_output)

      # check that there actually is an error line and if not, do nothing
      if not @error_summary.nil?

        # error message gets constructed of
        # 1) pre-prepared first line
        # 2) the single line of the error summary (MatchData.to_s)
        # 3) and a full output of the validator errors (MatchData.post_match with chomp to remove the extra empty line)
        @error_msg = "#{@error_msg_first_line}" \
            " Instead it failed with the message: #{@error_summary.to_s} \n" \
            "#{@error_summary.post_match.chomp}"
      end

    # however if the validator is expected to fail but instead it succeeds
    # output this instead
    elsif @expected_status == "fail" 
      @error_msg = "#{@error_msg_first_line}" \
          " Instead it passed."
    end

    expect(@actual_output).to include(@expected_output_string)

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if a given element is present in a test file
RSpec::Matchers.define :have_element do |element_name|

  include MatcherHelpers

  match do |source|

    begin

      # file under test
      @testfile_name = source
      # Kernel.puts @testfile_name

      # element being examined
      @element_name = element_name
      # Kernel.puts @element_name

      # get xml value in nodeset
      nodeset = get_nodeset_testfile(@testfile_name,@element_name)
      # Kernel.puts nodeset.length, nodeset.empty?

      @error_msg = "Expecting the test file '#{@testfile_name}' to not include #{@element_name} \n" \
          " Instead found it present."

      expect(nodeset.empty?).not_to be_truthy

    rescue NodeNotPresentError
      @error_msg = "Element '#{@element_name}' not present"
      false
      
    end

  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end