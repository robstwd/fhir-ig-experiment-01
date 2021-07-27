Feature: HL7 AU CodeSystem AU Extended profile

    As a reviewer of the HL7 AU content
    I want to have machine processable rules about metadata
    In order to ensure consistency without requiring manual inspection

Background: Profile exists
    Given the generated "html" file of profile "HL7 AU CodeSystem AU Extended" exists
    And the generated "xml" file of profile "HL7 AU CodeSystem AU Extended" exists

Scenario: HL7 AU CodeSystem AU Extended profile derivation
    Then it has been derived from "HL7 AU CodeSystem Base"

Scenario: HL7 AU CodeSystem AU Extended profile constraints on CodeSystem.id
    Then "CodeSystem.id" has an invariant "hl7au-csd-ext-01::error::The id must start with 'au-'"

Scenario: HL7 AU CodeSystem AU Extended profile constraints on CodeSystem.name
    Then "CodeSystem.name" has an invariant "hl7au-csd-ext-02::error::The name must end with 'AU'"
    
Scenario: HL7 AU CodeSystem AU Extended profile constraints on CodeSystem.title
    Then "CodeSystem.title" has an invariant "hl7au-csd-ext-03::error::The title must end with ' AU'"

Scenario: HL7 AU CodeSystem AU Extended profile constraints on CodeSystem.description
    Then "CodeSystem.description" has an invariant "hl7au-csd-ext-04::error::The description must start with 'Extended concept codes for '"
    Then "CodeSystem.description" has an invariant "hl7au-csd-ext-05::error::The description must end with ' for use in an Australian context.'"