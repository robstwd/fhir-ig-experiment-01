Feature: HL7 AU StructureDefinition Base profile: expected passes for invariant 'hl7au- -base-05'

 - Context: StructureDefinition (url and id)
 - Human: The url must end with the id value
 - Expression: url.replace('http://hl7.org.au/fhir/StructureDefinition/','') = id

As a verifier of HL7AU content
I want invariant 'hl7au-sdf-base-05' to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU StructureDefinition Base" exists
    And "StructureDefinition" has an invariant "hl7au-sdf-base-05::error::The url must end with the id value"

Scenario: URL value ends with id value variation #1
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-05-pass-01.xml" exists
    And its element "StructureDefinition.id" has value "hl7au-sdf-base-05-pass-01"
    And its element "StructureDefinition.url" has value "http://hl7.org.au/fhir/StructureDefinition/hl7au-sdf-base-05-pass-01"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: URL value ends with id value variation #2
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-05-pass-02.xml" exists
    And its element "StructureDefinition.id" has value "hl7ausdfbase05pass02"
    And its element "StructureDefinition.url" has value "http://hl7.org.au/fhir/StructureDefinition/hl7ausdfbase05pass02"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: URL value ends with id value variation #3
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-05-pass-03.xml" exists
    And its element "StructureDefinition.id" has value "hl7au-sdf-base-05-pass-03"
    And its element "StructureDefinition.url" has value "http://hl7.org.au/fhir/StructureDefinition/hl7au-sdf-base-05-pass-03"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: URL value ends with id variation #4
    Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-05-pass-04.xml" exists
    And its element "StructureDefinition.id" has value "zxcvbgasjkjiu89ioiio"
    And its element "StructureDefinition.url" has value "http://hl7.org.au/fhir/StructureDefinition/zxcvbgasjkjiu89ioiio"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
    Then the command should "succeed" with output message "Success: 0 errors"