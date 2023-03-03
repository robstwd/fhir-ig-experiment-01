Feature: HL7 AU StructureDefinition Base profile

    As a reviewer of the HL7 AU content
    I want to have machine processable rules about metadata
    In order to ensure consistency without requiring manual inspection

  Background: Profile exists
    Given the generated "html" file of profile "HL7 AU StructureDefinition Base" exists
    And the generated "xml" file of profile "HL7 AU StructureDefinition Base" exists

  Scenario: HL7 AU StructureDefinition Base profile derivation
    Then it has been derived from "R4 StructureDefinition resource"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition
    Then "StructureDefinition" has an invariant "hl7au-sdf-base-05::error::The url must end with the id value"
    Then "StructureDefinition" has an invariant "hl7au-sdf-base-06::error::The name value matches the title value when spaces are removed"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.id
    Then "StructureDefinition.id" has cardinality "1..1"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.meta
    Then "StructureDefinition.meta" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.implicitRules
    Then "StructureDefinition.implicitRules" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.language
    Then "StructureDefinition.language" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.text
    Then "StructureDefinition.text" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.contained
    Then "StructureDefinition.contained" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.modifierExtension
    Then "StructureDefinition.modifierExtension" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile extension FMM
    * "StructureDefinition.extension:fmm" has cardinality "1..1"
    * "StructureDefinition.extension:fmm" has an invariant "hl7au-sdf-base-09::error::The FMM maturity level must be an integer between 0 and 5"
    * extension "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm", with sliceName "fmm", is present in node "StructureDefinition"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.url
    Then "StructureDefinition.url" has cardinality "1..1"
    And "StructureDefinition.url" has an invariant "hl7au-sdf-base-02::error::The url starts with 'http://hl7.org.au/fhir/StructureDefinition/'"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.identifier
    Then "StructureDefinition.identifier" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.version
    Then "StructureDefinition.version" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.name
    Then "StructureDefinition.name" has cardinality "1..1"
    And "StructureDefinition.name" has an invariant "hl7au-sdf-base-07::error::The name value contains no spaces"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.title
    Then "StructureDefinition.title" has cardinality "1..1"
    And "StructureDefinition.title" has an invariant "hl7au-sdf-base-08::error::The title value must contain one or more non-leading or non-trailing single spaces"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.experimental
    Then "StructureDefinition.experimental" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.date
    Then "StructureDefinition.date" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.publisher
    Then "StructureDefinition.publisher" has cardinality "1..1"
    And "StructureDefinition.publisher" has an invariant "hl7au-sdf-base-03::error::The publisher starts with 'Health Level Seven Australia'"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.contact
    Then "StructureDefinition.contact" has cardinality "1..1"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.contact.name
    Then "StructureDefinition.contact.name" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.contact.telecom
    Then "StructureDefinition.contact.telecom" has cardinality "1..1"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.contact.telecom.system
    Then "StructureDefinition.contact.telecom.system" has cardinality "1..1"
    And "StructureDefinition.contact.telecom.system" has fixedCode "url"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.contact.telecom.value
    Then "StructureDefinition.contact.telecom.value" has cardinality "1..1"
    And "StructureDefinition.contact.telecom.value" has fixedString "http://hl7.com.au"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.contact.telecom.use
    Then "StructureDefinition.contact.telecom.use" has cardinality "1..1"
    And "StructureDefinition.contact.telecom.use" has fixedCode "work"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.contact.telecom.rank
    Then "StructureDefinition.contact.telecom.rank" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.contact.telecom.period
    Then "StructureDefinition.contact.telecom.period" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.description
    Then "StructureDefinition.description" has cardinality "1..1"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.useContext
    Then "StructureDefinition.useContext" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.jurisdiction
    Then "StructureDefinition.jurisdiction" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.purpose
    Then "StructureDefinition.purpose" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.copyright
    Then "StructureDefinition.copyright" has cardinality "1..1"
    And "StructureDefinition.copyright" has an invariant "hl7au-sdf-base-04::error::The copyright starts with 'HL7 Australia© 2018+; Licensed Under Creative Commons No Rights Reserved.'"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.keyword
    Then "StructureDefinition.keyword" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.fhirVersion
    Then "StructureDefinition.fhirVersion" has cardinality "1..1"
    And "StructureDefinition.fhirVersion" has fixedCode "4.0.1"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.mapping
    Then "StructureDefinition.mapping" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.abstract
    And "StructureDefinition.abstract" has fixedBoolean "false"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.contextInvariant
    Then "StructureDefinition.contextInvariant" has cardinality "0..0"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.baseDefinition
    Then "StructureDefinition.baseDefinition" has cardinality "1..1"

  Scenario: HL7 AU StructureDefinition Base profile constraints on StructureDefinition.derivation
    Then "StructureDefinition.derivation" has cardinality "1..1"
    And "StructureDefinition.derivation" has fixedCode "constraint"
