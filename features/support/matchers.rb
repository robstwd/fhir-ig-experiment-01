NAMESPACE = { "n" => "http://hl7.org/fhir" }

PROFILES = {
  "Patient Base"            => "Patient-base",
  "Patient Specific"        => "Patient-specific",
  "Patient Mandatory Name"  => "Patient-mandatoryname",
  "Patient with Mandatory Identifier"  => "patient-ident-1"
  }

RESOURCES = {
  "R4 Patient resource" => "http://hl7.org/fhir/StructureDefinition/Patient"
  }

FAILURE_MESSAGE_START = "\n VALIDATION FAILURE:\n "
FAILURE_MESSAGE_END   = "\n\n"

class NodeNotPresentError < StandardError; end
class NodePresentMustSupportNotSetError < StandardError; end
class NodePresentMustSupportFalseError < StandardError; end
class ConstraintNotPresentError < StandardError; end
class BindingNotPresentError < StandardError; end
class FileNotPresentError < StandardError; end

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

end


# This matcher determines if the named profile (as html or xml, or any available filetype) is found in the output folder of the IG
RSpec::Matchers.define :be_included_in_ig_as do |file_type|

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
        #~ puts @profile_name, @profile_id

        # element
        @element_name = element_name
        #~ puts @element_name

        # cardinality
        @expected_cardinality = cardinality
        #~ puts @expected_cardinality

        # nodeset
        nodeset = get_nodeset_from_snapshot(@element_name)
        #~ puts nodeset.length, nodeset.empty?

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
    @invariant_expected_parts = @invariant_expected_combined.split(";")
    @invariant_expected_key = @invariant_expected_parts[0]
    @invariant_expected_severity = @invariant_expected_parts[1]
    @invariant_expected_human = @invariant_expected_parts[2]
    # puts @invariant_expected_key, @invariant_expected_severity, @invariant_expected_human

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
          # puts @invariant_actual_key, @invariant_actual_severity, @invariant_actual_human, @invariant_actual_expression

          @actual_invariant_combined = "#{@invariant_actual_key};#{@invariant_actual_severity};#{@invariant_actual_human}"

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
