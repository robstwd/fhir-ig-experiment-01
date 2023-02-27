Feature: HL7 AU StructureDefinition Base profile: expected failures for invariant 'hl7au-sdf-base-09'

 - Context: StructureDefinition.extension:fmm
 - Human: The FMM maturity level must be an integer between 0 and 5
 - Expression: name = matches('^[0-5]$')

 Regex reference: 

As a verifier of HL7AU content
I want invariant 'hl7au-sdf-base-09' to fail when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU StructureDefinition Base" exists
    And "StructureDefinition.extension:fmm" has an invariant "hl7au-sdf-base-09::error::The FMM maturity level must be an integer between 0 and 5"

Scenario: FMM level is 6
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-09-fail-01.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm" has child element "valueInteger" with value "6"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-09: 'The FMM maturity level must be an integer between 0 and 5' Failed"

Scenario: FMM level is 17
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-09-fail-02.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm" has child element "valueInteger" with value "17"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-09: 'The FMM maturity level must be an integer between 0 and 5' Failed"

Scenario: FMM level is 294
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-09-fail-03.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm" has child element "valueInteger" with value "294"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-09: 'The FMM maturity level must be an integer between 0 and 5' Failed"

Scenario: FMM level is -43
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-09-fail-04.xml" exists
    * extension "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm" has child element "valueInteger" with value "-43"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    Then the command should "fail" with output message "Rule hl7au-sdf-base-09: 'The FMM maturity level must be an integer between 0 and 5' Failed"
