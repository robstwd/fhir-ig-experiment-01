<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile ValueSet
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:ValueSet</sch:title>
    <sch:rule context="f:ValueSet">
      <sch:assert test="count(f:id) &gt;= 1">id: minimum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:meta) &gt;= 1">meta: minimum cardinality of 'meta' is 1</sch:assert>
      <sch:assert test="count(f:implicitRules) &lt;= 0">implicitRules: maximum cardinality of 'implicitRules' is 0</sch:assert>
      <sch:assert test="count(f:language) &lt;= 0">language: maximum cardinality of 'language' is 0</sch:assert>
      <sch:assert test="count(f:contained) &lt;= 0">contained: maximum cardinality of 'contained' is 0</sch:assert>
      <sch:assert test="count(f:url) &gt;= 1">url: minimum cardinality of 'url' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &gt;= 1">identifier: minimum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:version) &gt;= 1">version: minimum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:name) &gt;= 1">name: minimum cardinality of 'name' is 1</sch:assert>
      <sch:assert test="count(f:title) &gt;= 1">title: minimum cardinality of 'title' is 1</sch:assert>
      <sch:assert test="count(f:experimental) &gt;= 1">experimental: minimum cardinality of 'experimental' is 1</sch:assert>
      <sch:assert test="count(f:date) &gt;= 1">date: minimum cardinality of 'date' is 1</sch:assert>
      <sch:assert test="count(f:publisher) &gt;= 1">publisher: minimum cardinality of 'publisher' is 1</sch:assert>
      <sch:assert test="count(f:contact) &gt;= 1">contact: minimum cardinality of 'contact' is 1</sch:assert>
      <sch:assert test="count(f:contact) &lt;= 1">contact: maximum cardinality of 'contact' is 1</sch:assert>
      <sch:assert test="count(f:description) &gt;= 1">description: minimum cardinality of 'description' is 1</sch:assert>
      <sch:assert test="count(f:useContext) &lt;= 0">useContext: maximum cardinality of 'useContext' is 0</sch:assert>
      <sch:assert test="count(f:jurisdiction) &gt;= 1">jurisdiction: minimum cardinality of 'jurisdiction' is 1</sch:assert>
      <sch:assert test="count(f:jurisdiction) &lt;= 1">jurisdiction: maximum cardinality of 'jurisdiction' is 1</sch:assert>
      <sch:assert test="count(f:purpose) &lt;= 0">purpose: maximum cardinality of 'purpose' is 0</sch:assert>
      <sch:assert test="count(f:copyright) &gt;= 1">copyright: minimum cardinality of 'copyright' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet</sch:title>
    <sch:rule context="f:ValueSet">
      <sch:assert test="not(parent::f:contained and f:contained)">If the resource is contained in another resource, it SHALL NOT contain nested Resources (inherited)</sch:assert>
      <sch:assert test="not(exists(for $id in f:contained/*/f:id/@value return $contained[not(parent::*/descendant::f:reference/@value=concat('#', $contained/*/id/@value) or descendant::f:reference[@value='#'])]))">If the resource is contained in another resource, it SHALL be referred to from elsewhere in the resource or SHALL refer to the containing resource (inherited)</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:versionId)) and not(exists(f:contained/*/f:meta/f:lastUpdated))">If a resource is contained in another resource, it SHALL NOT have a meta.versionId or a meta.lastUpdated (inherited)</sch:assert>
      <sch:assert test="not(exists(f:contained/*/f:meta/f:security))">If a resource is contained in another resource, it SHALL NOT have a security label (inherited)</sch:assert>
      <sch:assert test="exists(f:text/h:div)">A resource should have narrative for robust management (inherited)</sch:assert>
      <sch:assert test="not(exists(f:name/@value)) or matches(f:name/@value, '[A-Z]([A-Za-z0-9_]){0,254}')">Name should be usable as an identifier for the module by machine processing applications such as code generation (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ValueSet/f:meta</sch:title>
    <sch:rule context="f:ValueSet/f:meta">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:versionId) &lt;= 0">versionId: maximum cardinality of 'versionId' is 0</sch:assert>
      <sch:assert test="count(f:lastUpdated) &lt;= 0">lastUpdated: maximum cardinality of 'lastUpdated' is 0</sch:assert>
      <sch:assert test="count(f:source) &lt;= 0">source: maximum cardinality of 'source' is 0</sch:assert>
      <sch:assert test="count(f:profile) &gt;= 1">profile: minimum cardinality of 'profile' is 1</sch:assert>
      <sch:assert test="count(f:profile) &lt;= 1">profile: maximum cardinality of 'profile' is 1</sch:assert>
      <sch:assert test="count(f:security) &lt;= 0">security: maximum cardinality of 'security' is 0</sch:assert>
      <sch:assert test="count(f:tag) &lt;= 0">tag: maximum cardinality of 'tag' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.meta</sch:title>
    <sch:rule context="f:ValueSet/f:meta">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.meta.extension</sch:title>
    <sch:rule context="f:ValueSet/f:meta/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.meta.versionId</sch:title>
    <sch:rule context="f:ValueSet/f:meta/f:versionId">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.meta.lastUpdated</sch:title>
    <sch:rule context="f:ValueSet/f:meta/f:lastUpdated">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.meta.source</sch:title>
    <sch:rule context="f:ValueSet/f:meta/f:source">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.meta.profile</sch:title>
    <sch:rule context="f:ValueSet/f:meta/f:profile">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.meta.security</sch:title>
    <sch:rule context="f:ValueSet/f:meta/f:security">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.meta.tag</sch:title>
    <sch:rule context="f:ValueSet/f:meta/f:tag">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.implicitRules</sch:title>
    <sch:rule context="f:ValueSet/f:implicitRules">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.language</sch:title>
    <sch:rule context="f:ValueSet/f:language">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.text</sch:title>
    <sch:rule context="f:ValueSet/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.extension</sch:title>
    <sch:rule context="f:ValueSet/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.modifierExtension</sch:title>
    <sch:rule context="f:ValueSet/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.url</sch:title>
    <sch:rule context="f:ValueSet/f:url">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ValueSet/f:identifier</sch:title>
    <sch:rule context="f:ValueSet/f:identifier">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:use) &lt;= 0">use: maximum cardinality of 'use' is 0</sch:assert>
      <sch:assert test="count(f:type) &lt;= 0">type: maximum cardinality of 'type' is 0</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:value) &gt;= 1">value: minimum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:period) &lt;= 0">period: maximum cardinality of 'period' is 0</sch:assert>
      <sch:assert test="count(f:assigner) &lt;= 0">assigner: maximum cardinality of 'assigner' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.identifier</sch:title>
    <sch:rule context="f:ValueSet/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.identifier.extension</sch:title>
    <sch:rule context="f:ValueSet/f:identifier/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.identifier.use</sch:title>
    <sch:rule context="f:ValueSet/f:identifier/f:use">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.identifier.type</sch:title>
    <sch:rule context="f:ValueSet/f:identifier/f:type">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.identifier.system</sch:title>
    <sch:rule context="f:ValueSet/f:identifier/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.identifier.value</sch:title>
    <sch:rule context="f:ValueSet/f:identifier/f:value">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.identifier.period</sch:title>
    <sch:rule context="f:ValueSet/f:identifier/f:period">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.identifier.assigner</sch:title>
    <sch:rule context="f:ValueSet/f:identifier/f:assigner">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.version</sch:title>
    <sch:rule context="f:ValueSet/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.name</sch:title>
    <sch:rule context="f:ValueSet/f:name">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.title</sch:title>
    <sch:rule context="f:ValueSet/f:title">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.status</sch:title>
    <sch:rule context="f:ValueSet/f:status">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.experimental</sch:title>
    <sch:rule context="f:ValueSet/f:experimental">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.date</sch:title>
    <sch:rule context="f:ValueSet/f:date">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.publisher</sch:title>
    <sch:rule context="f:ValueSet/f:publisher">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ValueSet/f:contact</sch:title>
    <sch:rule context="f:ValueSet/f:contact">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:name) &lt;= 0">name: maximum cardinality of 'name' is 0</sch:assert>
      <sch:assert test="count(f:telecom) &gt;= 1">telecom: minimum cardinality of 'telecom' is 1</sch:assert>
      <sch:assert test="count(f:telecom) &lt;= 1">telecom: maximum cardinality of 'telecom' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.contact</sch:title>
    <sch:rule context="f:ValueSet/f:contact">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.contact.extension</sch:title>
    <sch:rule context="f:ValueSet/f:contact/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.contact.name</sch:title>
    <sch:rule context="f:ValueSet/f:contact/f:name">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ValueSet/f:contact/f:telecom</sch:title>
    <sch:rule context="f:ValueSet/f:contact/f:telecom">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:value) &gt;= 1">value: minimum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:value) &lt;= 1">value: maximum cardinality of 'value' is 1</sch:assert>
      <sch:assert test="count(f:use) &gt;= 1">use: minimum cardinality of 'use' is 1</sch:assert>
      <sch:assert test="count(f:use) &lt;= 1">use: maximum cardinality of 'use' is 1</sch:assert>
      <sch:assert test="count(f:rank) &lt;= 0">rank: maximum cardinality of 'rank' is 0</sch:assert>
      <sch:assert test="count(f:period) &lt;= 0">period: maximum cardinality of 'period' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.contact.telecom</sch:title>
    <sch:rule context="f:ValueSet/f:contact/f:telecom">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.contact.telecom.extension</sch:title>
    <sch:rule context="f:ValueSet/f:contact/f:telecom/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.contact.telecom.system</sch:title>
    <sch:rule context="f:ValueSet/f:contact/f:telecom/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.contact.telecom.value</sch:title>
    <sch:rule context="f:ValueSet/f:contact/f:telecom/f:value">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.contact.telecom.use</sch:title>
    <sch:rule context="f:ValueSet/f:contact/f:telecom/f:use">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.contact.telecom.rank</sch:title>
    <sch:rule context="f:ValueSet/f:contact/f:telecom/f:rank">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.contact.telecom.period</sch:title>
    <sch:rule context="f:ValueSet/f:contact/f:telecom/f:period">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.description</sch:title>
    <sch:rule context="f:ValueSet/f:description">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.useContext</sch:title>
    <sch:rule context="f:ValueSet/f:useContext">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ValueSet/f:jurisdiction</sch:title>
    <sch:rule context="f:ValueSet/f:jurisdiction">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 0">text: maximum cardinality of 'text' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.jurisdiction</sch:title>
    <sch:rule context="f:ValueSet/f:jurisdiction">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.jurisdiction.extension</sch:title>
    <sch:rule context="f:ValueSet/f:jurisdiction/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:ValueSet/f:jurisdiction/f:coding</sch:title>
    <sch:rule context="f:ValueSet/f:jurisdiction/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 0">version: maximum cardinality of 'version' is 0</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 0">display: maximum cardinality of 'display' is 0</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 0">userSelected: maximum cardinality of 'userSelected' is 0</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.jurisdiction.coding</sch:title>
    <sch:rule context="f:ValueSet/f:jurisdiction/f:coding">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.jurisdiction.coding.extension</sch:title>
    <sch:rule context="f:ValueSet/f:jurisdiction/f:coding/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.jurisdiction.coding.system</sch:title>
    <sch:rule context="f:ValueSet/f:jurisdiction/f:coding/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.jurisdiction.coding.version</sch:title>
    <sch:rule context="f:ValueSet/f:jurisdiction/f:coding/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.jurisdiction.coding.code</sch:title>
    <sch:rule context="f:ValueSet/f:jurisdiction/f:coding/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.jurisdiction.coding.display</sch:title>
    <sch:rule context="f:ValueSet/f:jurisdiction/f:coding/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.jurisdiction.coding.userSelected</sch:title>
    <sch:rule context="f:ValueSet/f:jurisdiction/f:coding/f:userSelected">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.jurisdiction.text</sch:title>
    <sch:rule context="f:ValueSet/f:jurisdiction/f:text">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.immutable</sch:title>
    <sch:rule context="f:ValueSet/f:immutable">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.purpose</sch:title>
    <sch:rule context="f:ValueSet/f:purpose">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.copyright</sch:title>
    <sch:rule context="f:ValueSet/f:copyright">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose</sch:title>
    <sch:rule context="f:ValueSet/f:compose">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.extension</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.modifierExtension</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.lockedDate</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:lockedDate">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.inactive</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:inactive">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:valueSet) or exists(f:system)">A value set include/exclude SHALL have a value set or a system (inherited)</sch:assert>
      <sch:assert test="not(exists(f:concept) or exists(f:filter)) or exists(f:system)">A value set with concepts or filters SHALL include a system (inherited)</sch:assert>
      <sch:assert test="not(exists(f:concept)) or not(exists(f:filter))">Cannot have both concept and filter (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.extension</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.modifierExtension</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.system</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.version</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.concept</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:concept">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.concept.extension</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:concept/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.concept.modifierExtension</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:concept/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.concept.code</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:concept/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.concept.display</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:concept/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.concept.designation</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:concept/f:designation">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.concept.designation.extension</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:concept/f:designation/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.concept.designation.modifierExtension</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:concept/f:designation/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.concept.designation.language</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:concept/f:designation/f:language">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.concept.designation.use</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:concept/f:designation/f:use">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.concept.designation.value</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:concept/f:designation/f:value">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.filter</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:filter">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.filter.extension</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:filter/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.filter.modifierExtension</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:filter/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.filter.property</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:filter/f:property">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.filter.op</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:filter/f:op">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.filter.value</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:filter/f:value">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.include.valueSet</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:include/f:valueSet">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.compose.exclude</sch:title>
    <sch:rule context="f:ValueSet/f:compose/f:exclude">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion</sch:title>
    <sch:rule context="f:ValueSet/f:expansion">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.extension</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.modifierExtension</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.identifier</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:identifier">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.timestamp</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:timestamp">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.total</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:total">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.offset</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:offset">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.parameter</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:parameter">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.parameter.extension</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:parameter/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.parameter.modifierExtension</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:parameter/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.parameter.name</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:parameter/f:name">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.parameter.value[x] 1</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:parameter/f:value[x]">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.contains</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:contains">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:code) or exists(f:display)">SHALL have a code or a display (inherited)</sch:assert>
      <sch:assert test="exists(f:code) or (f:abstract/@value = true())">Must have a code if not abstract (inherited)</sch:assert>
      <sch:assert test="exists(f:system) or not(exists(f:code))">Must have a system if a code is present (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.contains.extension</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:contains/f:extension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.contains.modifierExtension</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:contains/f:modifierExtension">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
      <sch:assert test="exists(f:extension)!=exists(f:*[starts-with(local-name(.), &quot;value&quot;)])">Must have either extensions or value[x], not both (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.contains.system</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:contains/f:system">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.contains.abstract</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:contains/f:abstract">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.contains.inactive</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:contains/f:inactive">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.contains.version</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:contains/f:version">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.contains.code</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:contains/f:code">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.contains.display</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:contains/f:display">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.contains.designation</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:contains/f:designation">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>ValueSet.expansion.contains.contains</sch:title>
    <sch:rule context="f:ValueSet/f:expansion/f:contains/f:contains">
      <sch:assert test="@value|f:*|h:div">All FHIR elements must have a @value or children (inherited)</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
