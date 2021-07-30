Feature: HL7 AU CodeSystem AU Extended profile: expected failures for inherited constraints

This profile is derived from HL7 AU CodeSystem Base, and this feature is about ensuring
that inherited constraints are properly managed (ie cause failures) in instances 
conforming to their derived profiles.
All test cases listed below are all valid against constraints unique to HL7 AU CodeSystem AU Extended profile
but have have specific failures against constraints in the inherited profile HL7 AU CodeSystem Base.

As a verifier of HL7AU content
I want inherited constraints to cause failures in instances comforming to derived profiles
In order to be assured of quality

Background: Profile exists
    Given the generated "xml" file of profile "HL7 AU CodeSystem AU Extended" exists

Scenario: hl7au-csd-base-01: The version number is NOT in semantic versioning format ('n.n.n')
    Given a test file named "test-cases/CodeSystem/codesystem-inherited-constraints-fail-01.xml" exists
    And its element "CodeSystem.version" has value "9.5"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-ext-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Error @ CodeSystem.version"
    And the command should "fail" with output message "The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1"

Scenario: hl7au-csd-base-02: The url DOES NOT start with 'http://terminology.hl7.org.au/CodeSystem/'
    Given a test file named "test-cases/CodeSystem/codesystem-inherited-constraints-fail-02.xml" exists
    And its element "CodeSystem.url" has value "http://terminology.hl7.org.au/fhir/CodeSystem/inherited-constraints-fail-02"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-ext-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Error @ CodeSystem.url"
    And the command should "fail" with output message "Rule 'The url starts with 'http://terminology.hl7.org.au/CodeSystem/'' Failed"

Scenario: hl7au-csd-base-03: The identifier.value DOES NOT start with 'urn:oid:2.16.840.1.113883.2.3.4.'
    Given a test file named "test-cases/CodeSystem/codesystem-inherited-constraints-fail-03.xml" exists
    And its element "CodeSystem.identifier.value" has value "urn:oid:7.16.840.1.113883.2.3.4.1.3.443"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-ext-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Error @ CodeSystem.identifier[0].value"
    And the command should "fail" with output message "The identifier.value starts with 'urn:oid:2.16.840.1.113883.2.3.4."

Scenario: hl7au-csd-base-04: The publisher DOES NOT start with 'Health Level Seven Australia'
    Given a test file named "test-cases/CodeSystem/codesystem-inherited-constraints-fail-04.xml" exists
    And its element "CodeSystem.publisher" has value "Heath Level Seven Australia (Patient Administration WG)"
    When I run the validator command on this testfile against profile "structuredefinition-hl7au-csd-ext-1"
    Then the command should "fail" with output message "*FAILURE*: 1 errors"
    And the command should "fail" with output message "Error @ CodeSystem.publisher"
    And the command should "fail" with output message "Rule 'The publisher starts with 'Health Level Seven Australia''"
