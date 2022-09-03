Feature: HL7 AU StructureDefinition Base profile: expected passes for invariant 'hl7au-sdf-base-01'

 - Context: StructureDefinition.version
 - Human: The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1
 - Expression: matches('^([1-9]{1,2})[.]([0-9]{1}|[1-9]{1}[0-9]{1})[.]([0-9]{1}|[1-9]{1}[0-9]{1})$')
   (Rubular: https://rubular.com/r/7m1tgS4U2UYCic)

As a verifier of HL7AU content
I want invariant 'hl7au-sdf-base-01' to pass when expected to
In order to be assured of quality

# Background: Profile exists
#     Given the generated "xml" file of profile "HL7 AU StructureDefinition Base" exists
#     And "StructureDefinition.version" has an invariant "hl7au-sdf-base-01::error::The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1"

# Scenario: version is '1.0.0'
#     Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-01-pass-01.xml" exists
#     And its element "StructureDefinition.version" has value "1.0.0"
#     When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
#     Then the command should "succeed" with output message "Success: 0 errors"

# Scenario: version is '1.0.5'
#     Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-01-pass-02.xml" exists
#     And its element "StructureDefinition.version" has value "1.0.5"
#     When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
#     Then the command should "succeed" with output message "Success: 0 errors"

# Scenario: version is '3.7.11'
#     Given a test file named "test-cases/StructureDefinition/structuredefinition-hl7au-sdf-base-01-pass-03.xml" exists
#     And its element "StructureDefinition.version" has value "3.7.11"
#     When I run the validator command on this testfile against profile "structuredefinition-hl7au-sdf-1"
#     Then the command should "succeed" with output message "Success: 0 errors"

