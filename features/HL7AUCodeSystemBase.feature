Feature: HL7 AU CodeSystem Base profile

    As a reviewer of the HL7 AU content
    I want to have machine processable rules about metadata
    In order to ensure consistency without requiring manual inspection

Background: Profile exists
    Given the generated "html" file of profile "HL7 AU CodeSystem Base" exists
    And the generated "xml" file of profile "HL7 AU CodeSystem Base" exists

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.id
    Then "CodeSystem.id" has cardinality "1..1"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.meta
    Then "CodeSystem.meta" has cardinality "1..1"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.meta.versionId
    Then "CodeSystem.meta.versionId" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.meta.lastUpdated
    Then "CodeSystem.meta.lastUpdated" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.meta.source
    Then "CodeSystem.meta.source" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.meta.profile
    Then "CodeSystem.meta.profile" has cardinality "1..1"
    And "CodeSystem.meta.profile" has fixedCanonical "http://hl7.org/fhir/StructureDefinition/shareablecodesystem"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.meta.security
    Then "CodeSystem.meta.security" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.meta.tag
    Then "CodeSystem.meta.tag" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.implicitRules 
    Then "CodeSystem.implicitRules" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.language 
    Then "CodeSystem.language" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.contained 
    Then "CodeSystem.contained" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.url
    Then "CodeSystem.url" has cardinality "1..1"
    And "CodeSystem.url" has an invariant "hl7au-csd-base-02::error::The url starts with 'http://terminology.hl7.org.au/CodeSystem/'"
    
Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.identifier
    Then "CodeSystem.identifier" has cardinality "1..1"
        
Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.identifier.use
    Then "CodeSystem.identifier.use" has cardinality "0..0"
        
Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.identifier.type
    Then "CodeSystem.identifier.type" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.identifier.system
    Then "CodeSystem.identifier.system" has cardinality "1..1"
    And "CodeSystem.identifier.system" has fixedUri "urn:ietf:rfc:3986"
        
Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.identifier.value
    Then "CodeSystem.identifier.value" has cardinality "1..1"
    And "CodeSystem.identifier.value" has an invariant "hl7au-csd-base-02::error::The identifier.value starts with 'urn:oid:2.16.840.1.113883.2.3.4.'"
    
Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.identifier.period
    Then "CodeSystem.identifier.period" has cardinality "0..0"
    
Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.identifier.assigner
    Then "CodeSystem.identifier.assigner" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.version
    Then "CodeSystem.version" has cardinality "1..1"
    
Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.name
    Then "CodeSystem.name" has cardinality "1..1"
    
Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.title
    Then "CodeSystem.title" has cardinality "1..1"
    
Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.experimental
    Then "CodeSystem.experimental" has cardinality "1..1"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.date
    Then "CodeSystem.date" has cardinality "1..1"
    
Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.publisher
    Then "CodeSystem.publisher" has cardinality "1..1"
    And "CodeSystem.publisher" has an invariant "hl7au-csd-base-03::error::The publisher starts with 'Health Level Seven Australia'"
    
Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.contact
    Then "CodeSystem.contact" has cardinality "1..1"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.contact.name
    Then "CodeSystem.contact.name" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.contact.telecom
    Then "CodeSystem.contact.telecom" has cardinality "1..1"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.contact.telecom.system
    Then "CodeSystem.contact.telecom.system" has cardinality "1..1"
    And "CodeSystem.contact.telecom.system" has fixedCode "url"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.contact.telecom.value
    Then "CodeSystem.contact.telecom.value" has cardinality "1..1"
    And "CodeSystem.contact.telecom.value" has fixedString "http://hl7.com.au"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.contact.telecom.use
    Then "CodeSystem.contact.telecom.use" has cardinality "1..1"
    And "CodeSystem.contact.telecom.use" has fixedCode "work"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.contact.telecom.rank
    Then "CodeSystem.contact.telecom.rank" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.contact.telecom.period
    Then "CodeSystem.contact.telecom.period" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.description
    Then "CodeSystem.description" has cardinality "1..1"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.useContext 
    Then "CodeSystem.useContext" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.jurisdiction
    Then "CodeSystem.jurisdiction" has cardinality "1..1"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.jurisdiction.coding
    Then "CodeSystem.jurisdiction.coding" has cardinality "1..1"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.jurisdiction.coding.system
    Then "CodeSystem.jurisdiction.coding.system" has cardinality "1..1"
    And "CodeSystem.jurisdiction.coding.system" has fixedUri "urn:iso:std:iso:3166"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.jurisdiction.coding.version
    Then "CodeSystem.jurisdiction.coding.version" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.jurisdiction.coding.code
    Then "CodeSystem.jurisdiction.coding.code" has cardinality "1..1"
    And "CodeSystem.jurisdiction.coding.code" has fixedCode "AU"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.jurisdiction.coding.display
    Then "CodeSystem.jurisdiction.coding.display" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.jurisdiction.coding.userSelected
    Then "CodeSystem.jurisdiction.coding.userSelected" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.jurisdiction.text
    Then "CodeSystem.jurisdiction.text" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.purpose
    Then "CodeSystem.purpose" has cardinality "0..0"

Scenario: HL7 AU CodeSystem Base profile constraints on CodeSystem.copyright
    Then "CodeSystem.copyright" has cardinality "1..1"
    And "CodeSystem.copyright" has an invariant "hl7au-csd-base-04::error::The copyright starts with 'HL7 Australia© 2018+; Licensed Under Creative Commons No Rights Reserved.'"

