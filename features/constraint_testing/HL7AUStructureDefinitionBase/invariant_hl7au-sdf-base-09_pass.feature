Feature: HL7 AU StructureDefinition Base profile: expected passes for invariant 'hl7au-sdf-base-09'

 - Context: StructureDefinition.extension:fmm
 - Human: The FMM maturity level must be an integer between 0 and 5
 - Expression: name = matches('^[0-5]$')

 Regex reference: 

As a verifier of HL7AU content
I want invariant 'hl7au-sdf-base-09' to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU StructureDefinition Base" exists
    And "StructureDefinition.extension:fmm" has an invariant "hl7au-sdf-base-09::error::The FMM maturity level must be an integer between 0 and 5"

Scenario: FMM level is 0
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-09-pass-01.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm" has child element "valueInteger" with value "0"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: FMM level is 1
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-09-pass-02.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm" has child element "valueInteger" with value "1"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: FMM level is 2
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-09-pass-03.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm" has child element "valueInteger" with value "2"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: FMM level is 3
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-09-pass-04.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm" has child element "valueInteger" with value "3"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: FMM level is 4
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-09-pass-05.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm" has child element "valueInteger" with value "4"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: FMM level is 5
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-09-pass-06.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm" has child element "valueInteger" with value "5"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"
