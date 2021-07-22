Feature: HL7 AU ValueSet Base profile: expected failures for invariant 'hl7au-vsd-base-01'

 - Context: ValueSet.version
 - Human: The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1
 - Expression: matches('^([1-9]{1,2})[.]([0-9]{1}|[1-9]{1}[0-9]{1})[.]([0-9]{1}|[1-9]{1}[0-9]{1})$')
   (Rubular: https://rubular.com/r/7m1tgS4U2UYCic)

As a verifier of HL7AU content
I want invariant 'hl7au-vsd-base-01' to fail when expected to
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU ValueSet Base" exists
    And "ValueSet.version" has an invariant "hl7au-vsd-base-01::error::The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1"

Scenario: version is '1'
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-01-fail-01.xml" exists
    And its element "ValueSet.version" has value "1"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1' Failed"

Scenario: version is '1.1'
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-01-fail-02.xml" exists
    And its element "ValueSet.version" has value "1.1"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1' Failed"

Scenario: version is '0.1.1'
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-01-fail-03.xml" exists
    And its element "ValueSet.version" has value "0.1.1"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1' Failed"

Scenario: version is '2.1.01'
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-01-fail-04.xml" exists
    And its element "ValueSet.version" has value "2.1.01"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1' Failed"

Scenario: version is '1.1.1-alpha'
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-01-fail-05.xml" exists
    And its element "ValueSet.version" has value "1.1.1-alpha"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1' Failed"
    
Scenario: version is '4.06.10'
    Given a test file named "test-cases/ValueSet/valueset-hl7au-vsd-base-01-fail-06.xml" exists
    And its element "ValueSet.version" has value "4.06.10"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-vsd-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Rule 'The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1' Failed"
   