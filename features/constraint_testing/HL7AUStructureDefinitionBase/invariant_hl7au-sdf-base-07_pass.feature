Feature: HL7 AU StructureDefinition Base profile: expected passes for invariant 'hl7au-sdf-base-07'

 - Context: StructureDefinition.name
 - Human: The name value contains no spaces
 - Expression: name = contains(' ').not()

As a verifier of HL7AU content
I want invariant 'hl7au-sdf-base-07' to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU StructureDefinition Base" exists
    And "StructureDefinition.name" has an invariant "hl7au-sdf-base-07::error::The name value contains no spaces"

Scenario: name variation #1
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-07-pass-01.xml" exists
    And its element "StructureDefinition.name" has value "AUBaseCondition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: name variation #2
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-07-pass-02.xml" exists
    And its element "StructureDefinition.name" has value "WoundCondition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: name variation #3
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-07-pass-03.xml" exists
    And its element "StructureDefinition.name" has value "somethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomethingsomething"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: name variation #4
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-07-pass-04.xml" exists
    And its element "StructureDefinition.name" has value "D"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"