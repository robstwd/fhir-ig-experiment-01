Feature: HL7 AU CodeSystem AU Extended profile: expected failures for invariant 'hl7au-csd-ext-01'

 - Context: CodeSystem.id
 - Human: The id must start with 'au-'
 - Expression: startsWith('au-')

As a verifier of HL7AU content
I want invariant 'hl7au-csd-ext-01' to fail when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU CodeSystem AU Extended" exists
    And "CodeSystem.id" has an invariant "hl7au-csd-ext-01::error::The id must start with 'au-'"

Scenario: id has no hyphen after 'au'
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-ext-01-fail-01.xml" exists
    And its element "CodeSystem.id" has value "auv203"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-ext-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The id must start with 'au-'' Failed"

Scenario: id has wrong case of 'au'
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-ext-01-fail-02.xml" exists
    And its element "CodeSystem.id" has value "AU-v204-extended"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-ext-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The id must start with 'au-'' Failed"

Scenario: id has no 'au-' prefix
    Given a test file named "test-cases/CodeSystem/codesystem-hl7au-csd-ext-01-fail-03.xml" exists
    And its element "CodeSystem.id" has value "hl7au-csd-ext-01-fail-03"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-ext-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The id must start with 'au-'' Failed"
