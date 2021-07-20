Feature: expected failures for element meta.profile fixed value

 - Context: CodeSystem.meta.profile
 - fixedValue = http://hl7.org/fhir/StructureDefinition/shareablecodesystem

As a verifier of HL7AU content
I want CodeSystem.meta.profile to fail when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU CodeSystem Base" exists
    And "CodeSystem.meta.profile" has fixedCanonical "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"

Scenario: CodeSystem.meta.profile value is completely wrong
    Given a test file named "test/CodeSystem/codesystem-meta-profile-fixed-fail-01.xml" exists
    And its element "CodeSystem.meta.profile" has value "http://example.org/fhir/StructureDefinition/examplecodesystem"
    When I run the validator command on the instance "test/CodeSystem/codesystem-meta-profile-fixed-fail-01.xml" against profile "structuredefinition-hl7au-csd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message " must be 'http://hl7.org/fhir/StructureDefinition/shareablecodesystem'"

Scenario: CodeSystem.meta.profile value has the wrong case
    Given a test file named "test/CodeSystem/codesystem-meta-profile-fixed-fail-02.xml" exists
    And its element "CodeSystem.meta.profile" has value "http://hl7.org/fhir/structuresefinition/ShareableCodeSystem"
    When I run the validator command on the instance "test/CodeSystem/codesystem-meta-profile-fixed-fail-02.xml" against profile "structuredefinition-hl7au-csd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message " must be 'http://hl7.org/fhir/StructureDefinition/shareablecodesystem'"

Scenario: CodeSystem.meta.profile url has 'https' instead of 'http'
    Given a test file named "test/CodeSystem/codesystem-meta-profile-fixed-fail-03.xml" exists
    And its element "CodeSystem.meta.profile" has value "https://hl7.org/fhir/StructureDefinition/shareablecodesystem"
    When I run the validator command on the instance "test/CodeSystem/codesystem-meta-profile-fixed-fail-03.xml" against profile "structuredefinition-hl7au-csd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message " must be 'http://hl7.org/fhir/StructureDefinition/shareablecodesystem'"
