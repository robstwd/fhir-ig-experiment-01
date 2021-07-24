Feature: HL7 AU CodeSystem Base profile: expected failures for invariant 'hl7au-csd-base-05'

 - Context: CodeSystem (url and id)
 - Human: The url must end with the id value
 - Expression: url.replace('http://terminology.hl7.org.au/CodeSystem/','') = id

As a verifier of HL7AU content
I want invariant 'hl7au-csd-base-05' to fail when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU CodeSystem Base" exists
    And "CodeSystem" has an invariant "hl7au-csd-base-05::error::The url must end with the id value"

Scenario: URL value mismatch to id value variation #1
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-base-05-fail-01.xml" exists
    And its element "CodeSystem.id" has value "hl7au-csd-base-05-fail-01"
    And its element "CodeSystem.url" has value "http://terminology.hl7.org.au/CodeSystem/hl7aucsdbase05fail01"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The url must end with the id value' Failed"

Scenario: URL value ends with id value variation #2 wrong case
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-base-05-fail-02.xml" exists
    And its element "CodeSystem.id" has value "hl7au-csd-base-05-fail-02"
    And its element "CodeSystem.url" has value "http://terminology.hl7.org.au/CodeSystem/HL7AU-CSD-BASE-05-FAIL-01"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The url must end with the id value' Failed"

Scenario: URL value ends with id value variation #3 url has no terminal arc 
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-base-05-fail-03.xml" exists
    And its element "CodeSystem.id" has value "hl7au-csd-base-05-fail-03"
    And its element "CodeSystem.url" has value "http://terminology.hl7.org.au/CodeSystem/"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The url must end with the id value' Failed"

