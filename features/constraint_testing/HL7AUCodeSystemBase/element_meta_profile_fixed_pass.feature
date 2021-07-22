Feature: HL7 AU CodeSystem Base profile: expected passes for element meta.profile fixed value

 - Context: CodeSystem.meta.profile
 - fixedValue = http://hl7.org/fhir/StructureDefinition/shareablecodesystem

As a verifier of HL7AU content
I want CodeSystem.meta.profile to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU CodeSystem Base" exists
    And "CodeSystem.meta.profile" has fixedCanonical "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"

# all other variations, such as multiple profile values, will trigger different errors
Scenario: CodeSystem.meta.profile value is "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
    Given a test file named "test-cases/CodeSystem/codesystem-meta-profile-fixed-pass-01.xml" exists
    And its element "CodeSystem.meta.profile" has value "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-1"
    Then the command should "succeed" with output message "Success: 0 errors"
