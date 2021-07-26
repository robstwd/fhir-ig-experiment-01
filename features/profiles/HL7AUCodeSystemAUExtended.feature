Feature: HL7 AU CodeSystem AU Extended profile

    As a reviewer of the HL7 AU content
    I want to have machine processable rules about metadata
    In order to ensure consistency without requiring manual inspection

Background: Profile exists
    Given the generated "html" file of profile "HL7 AU CodeSystem AU Extended" exists
    And the generated "xml" file of profile "HL7 AU CodeSystem AU Extended" exists

Scenario: HL7 AU CodeSystem AU Extended profile derivation
    Then it has been derived from "HL7 AU CodeSystem AU Extended"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.id
    Then "CodeSystem.id" has an invariant "hl7au-csd-ext-01::error::The id must start with 'au-'"

