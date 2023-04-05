
FAILURE_MESSAGE_START = "\n VALIDATION FAILURE:\n "
FAILURE_MESSAGE_END   = "\n\n"

require 'nokogiri'

module MatcherHelpers

  def print_failure_message(error_msg)
    "#{FAILURE_MESSAGE_START}" \
    "#{error_msg}" \
    "#{FAILURE_MESSAGE_END}"
  end

  def get_nokogiri_doc(file)
    return File.open(file) { |f| Nokogiri::XML(f) }.remove_namespaces!
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

end