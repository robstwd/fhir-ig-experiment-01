Feature: HL7 AU ValueSet Base profile: expected passes for invariant 'hl7au-vsd-base-05'

 - Context: ValueSet (url and id)
 - Severity: warning
 - Human: The url should end with the id value, unless it is an AU extended ValueSet
 - Expression: url.replace('http://terminology.hl7.org.au/ValueSet/','') = id

As a verifier of HL7AU content
I want invariant 'hl7au-vsd-base-05' to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU ValueSet Base" exists
    And "ValueSet" has an invariant "hl7au-vsd-base-05::warning::The url should end with the id value, unless it is an AU extended ValueSet"

Scenario: URL value ends with id value variation #1
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-05-pass-01.xml" exists
    And its element "ValueSet.id" has value "hl7au-vsd-base-05-pass-01"
    And its element "ValueSet.url" has value "http://terminology.hl7.org.au/ValueSet/hl7au-vsd-base-05-pass-01"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: URL value ends with id value variation #2
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-05-pass-02.xml" exists
    And its element "ValueSet.id" has value "hl7auvsdbase05pass02"
    And its element "ValueSet.url" has value "http://terminology.hl7.org.au/ValueSet/hl7auvsdbase05pass02"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: URL value ends with id value variation #3
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-05-pass-03.xml" exists
    And its element "ValueSet.id" has value "hl7au-vsd-base-05-pass-03"
    And its element "ValueSet.url" has value "http://terminology.hl7.org.au/ValueSet/hl7au-vsd-base-05-pass-03"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: URL value ends with id variation #4
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-05-pass-04.xml" exists
    And its element "ValueSet.id" has value "123456uuuioi"
    And its element "ValueSet.url" has value "http://terminology.hl7.org.au/ValueSet/123456uuuioi"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: URL value ends with id warning variation #1 - AU Extended ValueSet
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-05-pass-05.xml" exists
    And its element "ValueSet.id" has value "au-v2-0203"
    And its element "ValueSet.url" has value "http://terminology.hl7.org.au/ValueSet/v2-0203"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "succeed" with output message "Success: 0 errors, 1 warnings"
    And the command should "succeed" with output message "Rule hl7au-vsd-base-05: 'The url should end with the id value, unless it is an AU extended ValueSet'"

Scenario: URL value ends with id warning variation #2 - AU Extended ValueSet
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-05-pass-06.xml" exists
    And its element "ValueSet.id" has value "au-v3-ActCode"
    And its element "ValueSet.url" has value "http://terminology.hl7.org.au/ValueSet/v3-ActCode"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "succeed" with output message "Success: 0 errors, 1 warnings"
    And the command should "succeed" with output message "Rule hl7au-vsd-base-05: 'The url should end with the id value, unless it is an AU extended ValueSet'"