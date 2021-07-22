Feature: HL7 AU ValueSet Base profile: expected passes for element meta.profile fixed value

 - Context: ValueSet.meta.profile
 - fixedValue = http://hl7.org/fhir/StructureDefinition/shareablevalueset

As a verifier of HL7AU content
I want ValueSet.meta.profile to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU ValueSet Base" exists
    And "ValueSet.meta.profile" has fixedCanonical "http://hl7.org/fhir/StructureDefinition/shareablevalueset"

# all other variations, such as multiple profile values, will trigger different errors
Scenario: ValueSet.meta.profile value is "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
    Given a test file named "test/ValueSet/valueset-meta-profile-fixed-pass-01.xml" exists
    And its element "ValueSet.meta.profile" has value "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "succeed" with output message "Success: 0 errors"
