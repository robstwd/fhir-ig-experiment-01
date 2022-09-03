Feature: HL7 AU StructureDefinition Base profile: expected falures for invariant 'hl7au-sdf-base-06'

 - Context: StructureDefinition (name and title)
 - Human: The name value matches the title value when spaces are removed
 - Expression: name = title.replace(' ','')

As a verifier of HL7AU content
I want invariant 'hl7au-sdf-base-06' to pass when expected to
In order to be assured of quality

Scenario: name and title value variation #1
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-06-fail-01.xml" exists
    And its element "StructureDefinition.name" has value "AUBaseCondition"
    And its element "StructureDefinition.title" has value "AU BASE Condition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule hl7au-sdf-base-06: 'The name value matches the title value when spaces are removed' Failed"

Scenario: name and title value variation #2
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-06-fail-02.xml" exists
    And its element "StructureDefinition.name" has value "AUBaseCondition"
    And its element "StructureDefinition.title" has value "AU Base Codnition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule hl7au-sdf-base-06: 'The name value matches the title value when spaces are removed' Failed"

Scenario: name and title value variation #3
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-06-fail-03.xml" exists
    And its element "StructureDefinition.name" has value "AUBaseCondition"
    And its element "StructureDefinition.title" has value "Au Base Condition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule hl7au-sdf-base-06: 'The name value matches the title value when spaces are removed' Failed"
