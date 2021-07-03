Feature: Patient Base profile

    As the product owner of the FHIR repository
    I want to have a profile Patient Base
    In order to offer appropriate structures

Background: Profile exists
    Given the generated "html" file of profile "Patient Base" exists
    And the generated "xml" file of profile "Patient Base" exists

Scenario: Patient Base profile derivation
    Then it has been derived from "R4 Patient resource"

Scenario: Patient Base profile constraints on Patient.identifier
    Then "Patient.identifier" has must support set to true
    And "Patient.identifier" has its default cardinality

Scenario: Patient Base profile constraints on Patient.name
    Then "Patient.name" has must support set to true
    And "Patient.name" has cardinality "1..*"

Scenario: Patient Base profile constraints on Patient.name.text
    Then "Patient.name.text" has must support set to true
    And "Patient.name.text" has its default cardinality

Scenario: Patient Base profile constraints on Patient.name.family
    Then "Patient.name.family" has must support set to true
    And "Patient.name.family" has cardinality "0..1"

Scenario: Patient Base profile constraints on Patient.name.given
    Then "Patient.name.given" has must support set to true
    And "Patient.name.given" has its default cardinality

Scenario: Patient Base profile constraints on Patient.telecom
    Then "Patient.telecom" has must support set to true
    And "Patient.telecom" has its default cardinality

Scenario: Patient Base profile constraints on Patient.gender
    Then "Patient.gender" has must support set to true
    And "Patient.gender" has cardinality "1..1"

Scenario: Patient Base profile constraints on Patient.birthDate
    Then "Patient.birthDate" has must support set to true
    And "Patient.birthDate" has cardinality "1..1"

Scenario: Patient Base profile constraints on Patient.address
    Then "Patient.address" has must support set to true
    And "Patient.address" has its default cardinality
    And "Patient.address" has an invariant "pat-cnt-2or3-char::warning::The content of the country element (if present) SHALL be selected EITHER from ValueSet ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2 OR MAY be selected from ISO Country Alpha-3 Value Set http://hl7.org/fhir/ValueSet/iso3166-1-3, IF the country is not specified in value Set ISO Country Alpha-2 http://hl7.org/fhir/ValueSet/iso3166-1-2."

Scenario: Patient Base profile constraints on Patient.contact
    Then "Patient.contact" has must support set to true
    And "Patient.contact" has its default cardinality

Scenario: Patient Base profile constraints on Patient.contact.name
    Then "Patient.contact.name" has must support set to true
    And "Patient.contact.name" has its default cardinality

Scenario: Patient Base profile constraints on Patient.contact.telecom
    Then "Patient.contact.telecom" has must support set to true
    And "Patient.contact.telecom" has its default cardinality

Scenario: Patient Base profile constraints on Patient.contact.address
    Then "Patient.contact.address" has must support set to true
    And "Patient.contact.address" has its default cardinality

Scenario: Patient Base profile constraints on Patient.contact.organization
    Then "Patient.contact.organization" has must support set to true
    And "Patient.contact.organization" has its default cardinality

Scenario: Patient Base profile constraints on Patient.communication
    Then "Patient.communication" has must support set to true
    And "Patient.communication" has its default cardinality

Scenario: Patient Base profile constraints on Patient.communication.language
    Then "Patient.communication.language" has must support set to true
    And "Patient.communication.language" has its default cardinality
    And "Patient.communication.language" is bound to "http://hl7.org/fhir/ValueSet/all-languages" as "required"

Scenario: Patient Base profile constraints on Patient.generalPractitioner
    Then "Patient.generalPractitioner" has must support set to true
    And "Patient.generalPractitioner" has its default cardinality
