Feature: HL7 AU CodeSystem Base profile: expected passes for invariant 'hl7au-csd-base-02'

 - Context: CodeSystem.url
 - Human: The url starts with 'http://terminology.hl7.org.au/CodeSystem/'
 - Expression: startsWith('http://terminology.hl7.org.au/CodeSystem/')

As a verifier of HL7AU content
I want invariant 'hl7au-csd-base-02' to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU CodeSystem Base" exists
    And "CodeSystem.url" has an invariant "hl7au-csd-base-02::error::The url starts with 'http://terminology.hl7.org.au/CodeSystem/'"

Scenario: URL has correct base with terminal value variation #1
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-base-02-pass-01.xml" exists
    And its element "CodeSystem.url" has value "http://terminology.hl7.org.au/CodeSystem/hl7au-csd-base-02-pass-01"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: URL has correct base with terminal value variation #2
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-base-02-pass-02.xml" exists
    And its element "CodeSystem.url" has value "http://terminology.hl7.org.au/CodeSystem/hl7aucsdbase02pass02"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: URL has correct base with terminal value variation #3
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-base-02-pass-03.xml" exists
    And its element "CodeSystem.url" has value "http://terminology.hl7.org.au/CodeSystem/hl7au-csd-base-02-pass-03"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-1"
    Then the command should "succeed" with output message "Success: 0 errors"

# the invariant doesn't actually require anything after "https://terminology.hl7.org.au/CodeSystem/" => should pass
Scenario: URL has correct base with NO terminal value
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-base-02-pass-04.xml" exists
    And its element "CodeSystem.url" has value "http://terminology.hl7.org.au/CodeSystem/"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-1"
    Then the command should "succeed" with output message "Success: 0 errors"