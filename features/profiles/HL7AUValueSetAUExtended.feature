Feature: HL7 AU ValueSet AU Extended profile

    As a reviewer of the HL7 AU content
    I want to have machine processable rules about metadata
    In order to ensure consistency without requiring manual inspection

Background: Profile exists
    Given the generated "html" file of profile "HL7 AU ValueSet AU Extended" exists
    And the generated "xml" file of profile "HL7 AU ValueSet AU Extended" exists

Scenario: HL7 AU ValueSet AU Extended profile derivation
    Then it has been derived from "HL7 AU ValueSet Base"

Scenario: HL7 AU ValueSet AU Extended profile constraints on ValueSet.id
    Then "ValueSet.id" has an invariant "hl7au-vsd-ext-01::error::The id must start with 'au-'"
    Then "ValueSet.id" has an invariant "hl7au-vsd-ext-02::error::The id must end with '-extended'"

Scenario: HL7 AU ValueSet AU Extended profile constraints on ValueSet.url
    Then "ValueSet.url" has an invariant "hl7au-vsd-ext-03::error::The url must end with '-extended'"

Scenario: HL7 AU ValueSet AU Extended profile constraints on ValueSet.name
    Then "ValueSet.name" has an invariant "hl7au-vsd-ext-04::error::The name must end with 'AUExtended'"
    
Scenario: HL7 AU ValueSet AU Extended profile constraints on ValueSet.title
    Then "ValueSet.title" has an invariant "hl7au-vsd-ext-05::error::The title must end with ' - AU Extended'"

Scenario: HL7 AU ValueSet AU Extended profile constraints on ValueSet.description
    Then "ValueSet.description" has an invariant "hl7au-vsd-ext-06::error::The description must end with ' extended for use in an Australian context.'"