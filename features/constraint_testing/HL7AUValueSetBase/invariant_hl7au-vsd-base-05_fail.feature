Feature: HL7 AU ValueSet Base profile: expected failures for invariant 'hl7au-vsd-base-05'

 - Context: ValueSet (url and id)
 - Human: The url must end with the id value
 - Expression: url.replace('http://terminology.hl7.org.au/ValueSet/','') = id

As a verifier of HL7AU content
I want invariant 'hl7au-vsd-base-05' to fail when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU ValueSet Base" exists
    And "ValueSet" has an invariant "hl7au-vsd-base-05::error::The url must end with the id value"

Scenario: URL value mismatch to id value variation #1
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-05-fail-01.xml" exists
    And its element "ValueSet.id" has value "hl7au-vsd-base-05-fail-01"
    And its element "ValueSet.url" has value "http://terminology.hl7.org.au/ValueSet/hl7auvsdbase05fail01"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The url must end with the id value' Failed"

Scenario: URL value ends with id value variation #2 wrong case
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-05-fail-02.xml" exists
    And its element "ValueSet.id" has value "hl7au-vsd-base-05-fail-02"
    And its element "ValueSet.url" has value "http://terminology.hl7.org.au/ValueSet/HL7AU-VSD-BASE-05-FAIL-02"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The url must end with the id value' Failed"

Scenario: URL value ends with id value variation #3 url has no terminal arc 
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-05-fail-03.xml" exists
    And its element "ValueSet.id" has value "hl7au-vsd-base-05-fail-03"
    And its element "ValueSet.url" has value "http://terminology.hl7.org.au/ValueSet/"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The url must end with the id value' Failed"

