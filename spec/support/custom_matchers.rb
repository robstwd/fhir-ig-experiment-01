
class NodeNotPresentError < StandardError; end

RSpec::Matchers.define :exist do |file|

  include MatcherHelpers

  match do |source|

    @file = "#{Dir.pwd}/#{source}"
    # Kernel.puts @file

    @error_msg = "Expected the file '#{@file}' to exist.\n" \
                 " It does not!"

    expect(File.exist?(@file)).to be_truthy
 
  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end

# This matcher determines if a given element in an xml file has a specific value
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


# This matcher determines if a given element in an xml file has a specific value
RSpec::Matchers.define :have_root_element do |root_element_name|

  include MatcherHelpers

  match do |source|

      # file under test
      @testfile_name = source
      # Kernel.puts @testfile_name

      # expected root element name
      @expected_root_element_name = root_element_name
      # Kernel.puts @expected_root_element_name

      # get actual root element name
      @actual_root_element_name = get_nokogiri_doc(@testfile_name).root.name
    #   @actual_root_element_name = doc.root.name
    #   Kernel.puts @actual_root_element_name

      @error_msg = "The test file '#{@testfile_name}' has the incorrect value for element: #{@element_name} \n" \
          " - expected:           '#{@expected_value}'\n" \
          " - instead found:      '#{@actual_value}'"

      expect(@actual_root_element_name).to eq(@expected_root_element_name)
      
  end

  failure_message do |source|
    print_failure_message(@error_msg)
  end

end


# This matcher determines if a given element is present in a test file
RSpec::Matchers.define :have_element do |element_name|

  include MatcherHelpers

  match do |source|

      # file under test
      @testfile_name = source
      # Kernel.puts @testfile_name

      # element being examined
      @element_name = element_name
      # Kernel.puts @element_name

      # get xml value in nodeset
      nodeset = get_nodeset_testfile(@testfile_name,@element_name)
    #   Kernel.puts nodeset.length, nodeset.empty?

      if nodeset.empty?
        @error_msg = "Element '#{@element_name}' not present"
      else
        @error_msg = "Expecting the test file '#{@testfile_name}' to not include #{@element_name} \n" \
          " Instead found it present."
      end

      expect(nodeset.empty?).not_to be_truthy

    end

    failure_message do |source|
      print_failure_message(@error_msg)
    end

    failure_message_when_negated do |source|
      print_failure_message(@error_msg)
    end

  end


  RSpec::Matchers.define :have_one_of_node do |element_name|

  include MatcherHelpers

  match do |source|

    # file under test
    @testfile_name = source
    # Kernel.puts @testfile_name

    # element being examined
    @element_name = element_name
    # Kernel.puts @element_name

    # get xml value in nodeset
    nodeset = get_nodeset_testfile(@testfile_name,@element_name)
    # Kernel.puts nodeset.length, nodeset.empty?

    @occurrences = nodeset.length
    # Kernel.puts @occurrences

    @error_msg = "Expecting the test file '#{@testfile_name}' to have only 1 occurrence of #{@element_name} \n" \
          " Instead there were #{@occurrences} occurrences."

    expect(@occurrences).to eq(1)
  end

    failure_message do |source|
      print_failure_message(@error_msg)
    end

end