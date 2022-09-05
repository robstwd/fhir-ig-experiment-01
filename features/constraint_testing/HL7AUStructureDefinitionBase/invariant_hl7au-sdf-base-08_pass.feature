Feature: HL7 AU StructureDefinition Base profile: expected passes for invariant 'hl7au-sdf-base-08'

 - Context: StructureDefinition.title
 - Human: The title value must contain one or more non-leading or non-trailing single spaces
 - Expression: name = matches('^([a-zA-Z0-9]+ )*[a-zA-Z0-9]+$')

 Regex reference: https://www.regextester.com/106053

As a verifier of HL7AU content
I want invariant 'hl7au-sdf-base-08' to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU StructureDefinition Base" exists
    And "StructureDefinition.title" has an invariant "hl7au-sdf-base-08::error::The title value must contain one or more non-leading or non-trailing single spaces"

Scenario: title has 2 non-leading or non-trailing single spaces 
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-08-pass-01.xml" exists
    And its element "StructureDefinition.title" has value "AU Base Condition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: title has 1 non-leading or non-trailing single spaces 
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-08-pass-02.xml" exists
    And its element "StructureDefinition.title" has value "Wound Condition"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: title has multiple non-leading or non-trailing single spaces 
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-08-pass-03.xml" exists
    And its element "StructureDefinition.title" has value "something something something something something something something something something something"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: title has 1 non-leading or non-trailing single spaces
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-08-pass-04.xml" exists
    And its element "StructureDefinition.title" has value "D f"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: title has numerics #1
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-08-pass-05.xml" exists
    And its element "StructureDefinition.title" has value "Encryption Certificate PEM X509"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: title has numerics #2
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-08-pass-06.xml" exists
    And its element "StructureDefinition.title" has value "HL7 V2 Assigning Authority"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"