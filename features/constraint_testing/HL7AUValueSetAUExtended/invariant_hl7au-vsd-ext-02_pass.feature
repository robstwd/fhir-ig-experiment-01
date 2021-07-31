Feature: HL7 AU ValueSet AU Extended profile: expected passes for invariant 'hl7au-vsd-ext-02'

 - Context: ValueSet.id
 - Human: The id must end with '-extended'
 - Expression: endsWith('-extended')

As a verifier of HL7AU content
I want invariant 'hl7au-vsd-ext-02' to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU ValueSet AU Extended" exists
    And "ValueSet.id" has an invariant "hl7au-vsd-ext-02::error::The id must end with '-extended'"

Scenario: id is 'au-hl7au-vsd-ext-02-pass-01-extended'
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-ext-02-pass-01.xml" exists
    And its element "ValueSet.id" has value "au-hl7au-vsd-ext-02-pass-01-extended"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-ext-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: id is 'au-testing-02-extended'
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-ext-02-pass-02.xml" exists
    And its element "ValueSet.id" has value "au-testing-02-extended"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-ext-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: id is 'au-TESTING-03-extended'
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-ext-02-pass-03.xml" exists
    And its element "ValueSet.id" has value "au-TESTING-03-extended"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-ext-1"
    Then the command should "succeed" with output message "Success: 0 errors"

