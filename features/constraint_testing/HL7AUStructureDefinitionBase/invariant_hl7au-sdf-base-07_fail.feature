Feature: HL7 AU StructureDefinition Base profile: expected failures for invariant 'hl7au-sdf-base-07'

 - Context: StructureDefinition.name
 - Human: The name value contains no spaces
 - Expression: name = contains(' ').not()

As a verifier of HL7AU content
I want invariant 'hl7au-sdf-base-07' to fail when expected to
In order to be assured of quality

Note that when .name includes any spaces to test this invatriant, the instance also fails against hl7au-sdf-base-06
therefore, 2 errors are expected not 1

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU StructureDefinition Base" exists
    And "StructureDefinition.name" has an invariant "hl7au-sdf-base-07::error::The name value contains no spaces"

Scenario: name has leading single space
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-07-fail-01.xml" exists
    And its element "StructureDefinition.name" has value " AUBaseCondition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 2 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-07: 'The name value contains no spaces' Failed"

Scenario: name has leading multiple spaces
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-07-fail-02.xml" exists
    And its element "StructureDefinition.name" has value "   AUBaseCondition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 2 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-07: 'The name value contains no spaces' Failed"

Scenario: name has multiple instances of single spaces
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-07-fail-03.xml" exists
    And its element "StructureDefinition.name" has value "A U Base Condition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 2 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-07: 'The name value contains no spaces' Failed"

Scenario: name has multiple instances of multiple spaces
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-07-fail-04.xml" exists
    And its element "StructureDefinition.name" has value "A   U     Base   Condition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 2 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-07: 'The name value contains no spaces' Failed"

Scenario: name has single trailing space
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-07-fail-05.xml" exists
    And its element "StructureDefinition.name" has value "AUBaseCondition "
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 2 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-07: 'The name value contains no spaces' Failed"

Scenario: name has multiple trailing spaces
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-07-fail-06.xml" exists
    And its element "StructureDefinition.name" has value "AUBaseCondition        "
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 2 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-07: 'The name value contains no spaces' Failed"

Scenario: name has space combo
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-07-fail-07.xml" exists
    And its element "StructureDefinition.name" has value " A U    Base Condition        "
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 2 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-07: 'The name value contains no spaces' Failed"