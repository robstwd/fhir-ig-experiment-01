Feature: expected failures for HL7 AU CodeSystem Base Invariant 'hl7au-csd-base-01'

 - Context: CodeSystem.version
 - Human: The version number is in semantic versioning format ('n.n.n'), with the major verion number at least 1
 - Expression: matches('^[0-9]{1,2}[.][0-9]{1,2}[.][0-9]{1,2}$')

As a verifier of HL7AU content
I want invariant 'hl7au-csd-base-01' to pass when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU CodeSystem Base" exists
    And "CodeSystem.version" has an invariant "hl7au-csd-base-01::error::The version number is in semantic versioning format ('n.n.n'), with the major verion number at least 1"

Scenario: version is '1'
    Given a test file named "test/CodeSystem/codesystem-hl7au-csd-base-01-fail-01.xml" exists
    And its element "CodeSystem.version" has value "1"
    When I run the validator command on the instance "test/CodeSystem/codesystem-hl7au-csd-base-01-fail-01.xml"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The version number is in semantic versioning format ('n.n.n'), with the major verion number at least 1' Failed"

Scenario: version is '1.1'
    Given a test file named "test/CodeSystem/codesystem-hl7au-csd-base-01-fail-02.xml" exists
    And its element "CodeSystem.version" has value "1.1"
    When I run the validator command on the instance "test/CodeSystem/codesystem-hl7au-csd-base-01-fail-02.xml"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The version number is in semantic versioning format ('n.n.n'), with the major verion number at least 1' Failed"

Scenario: version is '0.1.1'
    Given a test file named "test/CodeSystem/codesystem-hl7au-csd-base-01-fail-03.xml" exists
    And its element "CodeSystem.version" has value "0.1.1"
    When I run the validator command on the instance "test/CodeSystem/codesystem-hl7au-csd-base-01-fail-03.xml"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The version number is in semantic versioning format ('n.n.n'), with the major verion number at least 1' Failed"

Scenario: version is '2.1.01'
    Given a test file named "test/CodeSystem/codesystem-hl7au-csd-base-01-fail-04.xml" exists
    And its element "CodeSystem.version" has value "2.1.01"
    When I run the validator command on the instance "test/CodeSystem/codesystem-hl7au-csd-base-01-fail-04.xml"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The version number is in semantic versioning format ('n.n.n'), with the major verion number at least 1' Failed"
    
Scenario: version is '1.1.1-alpha'
    Given a test file named "test/CodeSystem/codesystem-hl7au-csd-base-01-fail-05.xml" exists
    And its element "CodeSystem.version" has value "1.1.1-alpha"
    When I run the validator command on the instance "test/CodeSystem/codesystem-hl7au-csd-base-01-fail-05.xml"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The version number is in semantic versioning format ('n.n.n'), with the major verion number at least 1' Failed"
