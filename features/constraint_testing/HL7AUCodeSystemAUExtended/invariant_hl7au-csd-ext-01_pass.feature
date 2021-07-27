Feature: HL7 AU CodeSystem AU Extended profile: expected passes for invariant 'hl7au-csd-ext-01'

 - Context: CodeSystem.id
 - Human: The id must start with 'au-'
 - Expression: startsWith('au-')

As a verifier of HL7AU content
I want invariant 'hl7au-csd-ext-01' to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU CodeSystem AU Extended" exists
    And "CodeSystem.id" has an invariant "hl7au-csd-ext-01::error::The id must start with 'au-'"

Scenario: id is 'au-hl7au-csd-ext-01-pass-01'
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-ext-01-pass-01.xml" exists
    And its element "CodeSystem.id" has value "au-hl7au-csd-ext-01-pass-01"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-ext-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: id is 'au-testing-02'
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-ext-01-pass-02.xml" exists
    And its element "CodeSystem.id" has value "au-testing-02"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-ext-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: id is 'au-TESTING-03'
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-ext-01-pass-03.xml" exists
    And its element "CodeSystem.id" has value "au-TESTING-03"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-ext-1"
    Then the command should "succeed" with output message "Success: 0 errors"

