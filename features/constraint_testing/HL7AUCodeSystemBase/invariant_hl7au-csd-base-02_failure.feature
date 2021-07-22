Feature: HL7 AU CodeSystem Base profile: expected failures for invariant 'hl7au-csd-base-02'

 - Context: CodeSystem.url
 - Human: The url starts with 'http://terminology.hl7.org.au/CodeSystem/'
 - Expression: startsWith('http://terminology.hl7.org.au/CodeSystem/')

As a verifier of HL7AU content
I want invariant 'hl7au-csd-base-02' to fail when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU CodeSystem Base" exists
    And "CodeSystem.url" has an invariant "hl7au-csd-base-02::error::The url starts with 'http://terminology.hl7.org.au/CodeSystem/'"

Scenario: URL has erroneous '/fhir/'
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-base-02-fail-01.xml" exists
    And its element "CodeSystem.url" has value "http://terminology.hl7.org.au/fhir/CodeSystem/hl7au-csd-base-02-fail-01"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The url starts with 'http://terminology.hl7.org.au/CodeSystem/'' Failed"

Scenario: URL has old STU3 url variant
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-base-02-fail-02.xml" exists
    And its element "CodeSystem.url" has value "http://hl7.org.au/fhir/CodeSystem/hl7au-csd-base-02-fail-02"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The url starts with 'http://terminology.hl7.org.au/CodeSystem/'' Failed"

Scenario: URL has 'https' instead of 'http'
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-base-02-fail-03.xml" exists
    And its element "CodeSystem.url" has value "https://terminology.hl7.org.au/CodeSystem/hl7au-csd-base-02-fail-03"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The url starts with 'http://terminology.hl7.org.au/CodeSystem/'' Failed"

Scenario: URL has wrong case of 'codesystem'
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-base-02-fail-04.xml" exists
    And its element "CodeSystem.url" has value "https://terminology.hl7.org.au/codesystem/hl7au-csd-base-02-fail-04"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The url starts with 'http://terminology.hl7.org.au/CodeSystem/'' Failed"
    
Scenario: URL is for international not Australia (ie not '.au')
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-base-02-fail-05.xml" exists
    And its element "CodeSystem.url" has value "https://terminology.hl7.org/CodeSystem/hl7au-csd-base-02-fail-05"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The url starts with 'http://terminology.hl7.org.au/CodeSystem/'' Failed"