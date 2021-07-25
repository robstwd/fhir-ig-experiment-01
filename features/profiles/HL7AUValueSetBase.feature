Feature: HL7 AU ValueSet Base profile

    As a reviewer of the HL7 AU content
    I want to have machine processable rules about metadata
    In order to ensure consistency without requiring manual inspection

Background: Profile exists
    Given the generated "html" file of profile "HL7 AU ValueSet Base" exists
    And the generated "xml" file of profile "HL7 AU ValueSet Base" exists

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet
    Then "ValueSet" has an invariant "hl7au-vsd-base-05::error::The url must end with the id value"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.id
    Then "ValueSet.id" has cardinality "1..1"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.meta
    Then "ValueSet.meta" has cardinality "1..1"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.meta.versionId
    Then "ValueSet.meta.versionId" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.meta.lastUpdated
    Then "ValueSet.meta.lastUpdated" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.meta.source
    Then "ValueSet.meta.source" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.meta.profile
    Then "ValueSet.meta.profile" has cardinality "1..1"
    And "ValueSet.meta.profile" has fixedCanonical "http://hl7.org/fhir/StructureDefinition/shareablevalueset"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.meta.security
    Then "ValueSet.meta.security" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.meta.tag
    Then "ValueSet.meta.tag" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.implicitRules 
    Then "ValueSet.implicitRules" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.language 
    Then "ValueSet.language" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.contained 
    Then "ValueSet.contained" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.url
    Then "ValueSet.url" has cardinality "1..1"
    And "ValueSet.url" has an invariant "hl7au-vsd-base-02::error::The url starts with 'http://terminology.hl7.org.au/ValueSet/'"
    
Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.identifier
    Then "ValueSet.identifier" has cardinality "1..1"
        
Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.identifier.use
    Then "ValueSet.identifier.use" has cardinality "0..0"
        
Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.identifier.type
    Then "ValueSet.identifier.type" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.identifier.system
    Then "ValueSet.identifier.system" has cardinality "1..1"
    And "ValueSet.identifier.system" has fixedUri "urn:ietf:rfc:3986"
        
Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.identifier.value
    Then "ValueSet.identifier.value" has cardinality "1..1"
    And "ValueSet.identifier.value" has an invariant "hl7au-vsd-base-02::error::The identifier.value starts with 'urn:oid:2.16.840.1.113883.2.3.4.'"
    
Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.identifier.period
    Then "ValueSet.identifier.period" has cardinality "0..0"
    
Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.identifier.assigner
    Then "ValueSet.identifier.assigner" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.version
    Then "ValueSet.version" has cardinality "1..1"
    And "ValueSet.version" has an invariant "hl7au-vsd-base-01::error::The version number is in semantic versioning format ('n.n.n'), with the major version number at least 1"
    
Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.name
    Then "ValueSet.name" has cardinality "1..1"
    
Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.title
    Then "ValueSet.title" has cardinality "1..1"
    
Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.experimental
    Then "ValueSet.experimental" has cardinality "1..1"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.date
    Then "ValueSet.date" has cardinality "1..1"
    
Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.publisher
    Then "ValueSet.publisher" has cardinality "1..1"
    And "ValueSet.publisher" has an invariant "hl7au-vsd-base-03::error::The publisher starts with 'Health Level Seven Australia'"
    
Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.contact
    Then "ValueSet.contact" has cardinality "1..1"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.contact.name
    Then "ValueSet.contact.name" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.contact.telecom
    Then "ValueSet.contact.telecom" has cardinality "1..1"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.contact.telecom.system
    Then "ValueSet.contact.telecom.system" has cardinality "1..1"
    And "ValueSet.contact.telecom.system" has fixedCode "url"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.contact.telecom.value
    Then "ValueSet.contact.telecom.value" has cardinality "1..1"
    And "ValueSet.contact.telecom.value" has fixedString "http://hl7.com.au"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.contact.telecom.use
    Then "ValueSet.contact.telecom.use" has cardinality "1..1"
    And "ValueSet.contact.telecom.use" has fixedCode "work"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.contact.telecom.rank
    Then "ValueSet.contact.telecom.rank" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.contact.telecom.period
    Then "ValueSet.contact.telecom.period" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.description
    Then "ValueSet.description" has cardinality "1..1"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.useContext 
    Then "ValueSet.useContext" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.jurisdiction
    Then "ValueSet.jurisdiction" has cardinality "1..1"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.jurisdiction.coding
    Then "ValueSet.jurisdiction.coding" has cardinality "1..1"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.jurisdiction.coding.system
    Then "ValueSet.jurisdiction.coding.system" has cardinality "1..1"
    And "ValueSet.jurisdiction.coding.system" has fixedUri "urn:iso:std:iso:3166"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.jurisdiction.coding.version
    Then "ValueSet.jurisdiction.coding.version" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.jurisdiction.coding.code
    Then "ValueSet.jurisdiction.coding.code" has cardinality "1..1"
    And "ValueSet.jurisdiction.coding.code" has fixedCode "AU"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.jurisdiction.coding.display
    Then "ValueSet.jurisdiction.coding.display" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.jurisdiction.coding.userSelected
    Then "ValueSet.jurisdiction.coding.userSelected" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.jurisdiction.text
    Then "ValueSet.jurisdiction.text" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.purpose
    Then "ValueSet.purpose" has cardinality "0..0"

Scenario: HL7 AU ValueSet Base profile constraints on ValueSet.copyright
    Then "ValueSet.copyright" has cardinality "1..1"
    And "ValueSet.copyright" has an invariant "hl7au-vsd-base-04::error::The copyright starts with 'HL7 Australia© 2018+; Licensed Under Creative Commons No Rights Reserved.'"

