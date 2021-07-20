Feature: expected passes for HL7 AU CodeSystem Base Invariant 'hl7au-csd-base-01'

 - Context: CodeSystem.version
 - Human: The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1
 - Expression: matches('^[0-9]{1,2}[.][0-9]{1,2}[.][0-9]{1,2}$')

As a verifier of HL7AU content
I want invariant 'hl7au-csd-base-01' to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU CodeSystem Base" exists
    And "CodeSystem.version" has an invariant "hl7au-csd-base-01::error::The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1"

Scenario: version is '1.0.0'
    Given a test file named "test/CodeSystem/codesystem-hl7au-csd-base-01-pass-01.xml" exists
    And its element "CodeSystem.version" has value "1.0.0"
    When I run the validator command on the instance "test/CodeSystem/codesystem-hl7au-csd-base-01-pass-01.xml"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: version is '1.0.5'
    Given a test file named "test/CodeSystem/codesystem-hl7au-csd-base-01-pass-02.xml" exists
    And its element "CodeSystem.version" has value "1.0.5"
    When I run the validator command on the instance "test/CodeSystem/codesystem-hl7au-csd-base-01-pass-02.xml"
    Then the command should "succeed" with output message "Success: 0 errors"

Scenario: version is '3.7.11'
    Given a test file named "test/CodeSystem/codesystem-hl7au-csd-base-01-pass-03.xml" exists
    And its element "CodeSystem.version" has value "3.7.11"
    When I run the validator command on the instance "test/CodeSystem/codesystem-hl7au-csd-base-01-pass-03.xml"
    Then the command should "succeed" with output message "Success: 0 errors"
