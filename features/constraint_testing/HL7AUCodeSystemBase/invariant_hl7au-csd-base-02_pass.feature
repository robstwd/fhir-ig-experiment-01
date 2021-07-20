Feature: expected passes for HL7 AU CodeSystem Base Invariant 'hl7au-csd-base-02'

Human: The url starts with 'http://terminology.hl7.org.au/CodeSystem/'
Expression: startsWith('http://terminology.hl7.org.au/CodeSystem/')

As a verifier of HL7AU content
I want invariant 'hl7au-csd-base-02' to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU CodeSystem Base" exists
    And "CodeSystem.url" has an invariant "hl7au-csd-base-02::error::The url starts with 'http://terminology.hl7.org.au/CodeSystem/'"

Scenario: URL has correct base with terminal value variation #1
    Given a test file named "test/CodeSystem/codesystem-hl7au-csd-base-02-pass-01.xml" exists
    And its element "CodeSystem.url" has value "http://terminology.hl7.org.au/CodeSystem/hl7au-csd-base-02-pass-01"
    When I run the validator command on the instance "test/CodeSystem/codesystem-hl7au-csd-base-02-pass-01.xml"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: URL has correct base with terminal value variation #2
    Given a test file named "test/CodeSystem/codesystem-hl7au-csd-base-02-pass-02.xml" exists
    And its element "CodeSystem.url" has value "http://terminology.hl7.org.au/CodeSystem/hl7aucsdbase02pass02"
    When I run the validator command on the instance "test/CodeSystem/codesystem-hl7au-csd-base-02-pass-02.xml"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: URL has correct base with terminal value variation #3
    Given a test file named "test/CodeSystem/codesystem-hl7au-csd-base-02-pass-03.xml" exists
    And its element "CodeSystem.url" has value "http://terminology.hl7.org.au/CodeSystem/hl7au-csd-base-02-pass-03"
    When I run the validator command on the instance "test/CodeSystem/codesystem-hl7au-csd-base-02-pass-03.xml"
    Then the command should "succeed" with output message "Success: 0 errors"

# the invariant doesn't actually require anything after "https://terminology.hl7.org.au/CodeSystem/" => should pass
Scenario: URL has correct base with NO terminal value
    Given a test file named "test/CodeSystem/codesystem-hl7au-csd-base-02-pass-04.xml" exists
    And its element "CodeSystem.url" has value "http://terminology.hl7.org.au/CodeSystem/"
    When I run the validator command on the instance "test/CodeSystem/codesystem-hl7au-csd-base-02-pass-04.xml"
    Then the command should "succeed" with output message "Success: 0 errors"