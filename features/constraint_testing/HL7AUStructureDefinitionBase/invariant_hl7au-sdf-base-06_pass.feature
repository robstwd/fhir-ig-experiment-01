Feature: HL7 AU StructureDefinition Base profile: expected passes for invariant 'hl7au-sdf-base-06'

 - Context: StructureDefinition (name and title)
 - Human: The name value matches the title value when spaces are removed
 - Expression: name = title.replace(' ','')

As a verifier of HL7AU content
I want invariant 'hl7au-sdf-base-06' to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU StructureDefinition Base" exists
    And "StructureDefinition" has an invariant "hl7au-sdf-base-06::error::The name value matches the title value when spaces are removed"

Scenario: name and title value variation #1
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-06-pass-01.xml" exists
    And its element "StructureDefinition.name" has value "AUBaseCondition"
    And its element "StructureDefinition.title" has value "AU Base Condition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: name and title value variation #2
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-06-pass-02.xml" exists
    And its element "StructureDefinition.name" has value "AUBaseCondition"
    And its element "StructureDefinition.title" has value "AU     Base      Condition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: name and title value variation #3
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-06-pass-03.xml" exists
    And its element "StructureDefinition.name" has value "AUBaseCondition"
    And its element "StructureDefinition.title" has value "    AU Base Condition       "
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: name and title value variation #4
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-06-pass-04.xml" exists
    And its element "StructureDefinition.name" has value "AUBaseCondition"
    And its element "StructureDefinition.title" has value "AUBaseCondition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"