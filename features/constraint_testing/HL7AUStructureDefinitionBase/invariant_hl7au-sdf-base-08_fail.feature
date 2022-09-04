Feature: HL7 AU StructureDefinition Base profile: expected failures for invariant 'hl7au-sdf-base-08'

 - Context: StructureDefinition.title
 - Human: The title value must contain one or more non-leading or non-trailing single spaces
 - Expression: name = matches('^([a-zA-Z]+ )*[a-zA-Z]+$')

 Regex reference: https://www.regextester.com/106053

As a verifier of HL7AU content
I want invariant 'hl7au-sdf-base-08' to fail when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU StructureDefinition Base" exists
    And "StructureDefinition.title" has an invariant "hl7au-sdf-base-08::error::The title value must contain one or more non-leading or non-trailing single spaces"

Scenario: title has 2 non-leading or non-trailing multiple spaces 
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-08-fail-01.xml" exists
    And its element "StructureDefinition.title" has value "AU  Base  Condition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-08: 'The title value must contain one or more non-leading or non-trailing single spaces' Failed"

Scenario: title has 1 non-leading or non-trailing multiple spaces 
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-08-fail-02.xml" exists
    And its element "StructureDefinition.title" has value "Wound        Condition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-08: 'The title value must contain one or more non-leading or non-trailing single spaces' Failed"

Scenario: title has a single leading space
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-08-fail-03.xml" exists
    And its element "StructureDefinition.title" has value " AU Base Condition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-08: 'The title value must contain one or more non-leading or non-trailing single spaces' Failed"

Scenario: title has multiple leading spaces
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-08-fail-04.xml" exists
    And its element "StructureDefinition.title" has value "     AU Base Condition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-08: 'The title value must contain one or more non-leading or non-trailing single spaces' Failed"

Scenario: title has a single trailing space
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-08-fail-05.xml" exists
    And its element "StructureDefinition.title" has value "AU Base Condition "
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-08: 'The title value must contain one or more non-leading or non-trailing single spaces' Failed"

Scenario: title has multiple trailing spaces
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-08-fail-06.xml" exists
    And its element "StructureDefinition.title" has value "AU Base Condition     "
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-08: 'The title value must contain one or more non-leading or non-trailing single spaces' Failed"

Scenario: title has a space-combo palooza
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-08-fail-07.xml" exists
    And its element "StructureDefinition.title" has value "   AU   Base     Condi    tion     "
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-08: 'The title value must contain one or more non-leading or non-trailing single spaces' Failed"
