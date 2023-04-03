
FAILURE_MESSAGE_START = "\n VALIDATION FAILURE:\n "
FAILURE_MESSAGE_END   = "\n\n"

module MatcherHelpers

  def print_failure_message(error_msg)
    "#{FAILURE_MESSAGE_START}" \
    "#{error_msg}" \
    "#{FAILURE_MESSAGE_END}"
  end

end


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

