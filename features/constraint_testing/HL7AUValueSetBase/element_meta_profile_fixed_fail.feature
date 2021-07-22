Feature: HL7 AU ValueSet Base profile: expected failures for element meta.profile fixed value

 - Context: ValueSet.meta.profile
 - fixedValue = http://hl7.org/fhir/StructureDefinition/shareablevalueset

As a verifier of HL7AU content
I want ValueSet.meta.profile to fail when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU ValueSet Base" exists
    And "ValueSet.meta.profile" has fixedCanonical "http://hl7.org/fhir/StructureDefinition/shareablevalueset"

Scenario: ValueSet.meta.profile value is completely wrong
    Given a test file named "test-cases/ValueSet/valueset-meta-profile-fixed-fail-01.xml" exists
    And its element "ValueSet.meta.profile" has value "http://example.org/fhir/StructureDefinition/examplecodesystem"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message " must be 'http://hl7.org/fhir/StructureDefinition/shareablevalueset'"

Scenario: ValueSet.meta.profile value has the wrong case
    Given a test file named "test-cases/ValueSet/valueset-meta-profile-fixed-fail-02.xml" exists
    And its element "ValueSet.meta.profile" has value "http://hl7.org/fhir/structuredefinition/ShareableValueSet"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message " must be 'http://hl7.org/fhir/StructureDefinition/shareablevalueset'"

Scenario: ValueSet.meta.profile url has 'https' instead of 'http'
    Given a test file named "test-cases/ValueSet/valueset-meta-profile-fixed-fail-03.xml" exists
    And its element "ValueSet.meta.profile" has value "https://hl7.org/fhir/StructureDefinition/shareablevalueset"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message " must be 'http://hl7.org/fhir/StructureDefinition/shareablevalueset'"
