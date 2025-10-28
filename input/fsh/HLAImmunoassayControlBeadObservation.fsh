Profile: HLAImmunoassayControlBeadObservation
Parent: USCoreLaboratoryResultObservationProfile
Id: hla-immunoassay-control-bead-observation
Title: "HLA Immunoassay Control Bead Observation"
Description: """Extension of US Core lab result observation to capture attributes specific to solid-phase immunoassay bead test results.

A single bead within a solid phase panel.
This bead usually has a specificity, which may be an allele name or a serological specificity.

The bead has information about it's corresponding positive and negative controls."""
* ^url = "https://fhir.nmdp.org/ig/HlaAntibodyReport/StructureDefinition/hla-immunoassay-control-bead-observation"
* ^version = "0.1.0"
* ^status = #draft
* ^publisher = "NMDP"
* ^contact.name = "David Wroe"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "fhir@nmdp.org"
* ^contact.telecom.use = #work
* ^purpose = "Part of HLA Antibody Diagnostic Report implementation guide to capture results specifically for immunoassay bead results"

* identifier 1..1
* identifier.value 1..1 MS
* identifier.value ^label = "Bead Identifier"

* partOf.reference 1..1 MS
* partOf.reference ^label = "HLA Antibody Diagnostic Report Ref"

* code.coding.system 1..1
* code.coding.system from http://fhir.nmdp.org/terminology/HLAImmunoassay (required)

* focus 0..0
* encounter 0..0

* value[x] 1..1
* value[x] only integer
* value[x] ^label = "Raw MFI"

* interpretation 1..*
* interpretation ^slicing.discriminator.type = #value
* interpretation ^slicing.discriminator.path = "$this"
* interpretation ^slicing.rules = #open
* interpretation contains
    bead-interpretation-classification-entity 0..1 and
    bead-interpretation-classification 0..1 and
    bead-interpretation-rank 0..1 and
    bead-plausible 0..1 and
    bead-plausible-reason 0..1

* interpretation[bead-interpretation-classification-entity] ^short = "Bead result classification entity"
* interpretation[bead-interpretation-classification-entity] ^definition = "Bead observation interpretation indicating the person or entity performing the interpretation of the bead result."
* interpretation[bead-interpretation-classification-entity].coding.system 0..0
* interpretation[bead-interpretation-classification-entity].coding.code 0..0
* interpretation[bead-interpretation-classification-entity].text 1..1 MS
* interpretation[bead-interpretation-classification-entity].text ^label = "Classification Entity"

* interpretation[bead-interpretation-classification] ^short = "Bead result classification"
* interpretation[bead-interpretation-classification] ^definition = "Bead observation interpretation indicating the classification of the bead result."
* interpretation[bead-interpretation-classification].coding.system 1..1 MS
* interpretation[bead-interpretation-classification].coding.system from http://fhir.nmdp.org/terminology/fhir/CodeSystem/hla-immunoassay-codes (extensible)
* interpretation[bead-interpretation-classification].coding.code 1..1 MS
* interpretation[bead-interpretation-classification].coding.code from http://fhir.nmdp.org/terminology/hla-antibody-assay/bead-interpretation-classification (extensible)

* interpretation[bead-interpretation-rank] ^short = "Bead result rank"
* interpretation[bead-interpretation-rank] ^definition = "Bead observation interpretation indicating the rank of the bead result."
* interpretation[bead-interpretation-rank].coding.system 1..1 MS
* interpretation[bead-interpretation-rank].coding.system from http://fhir.nmdp.org/terminology/fhir/CodeSystem/hla-immunoassay-codes (required)
* interpretation[bead-interpretation-rank].coding.code 1..1 MS
* interpretation[bead-interpretation-rank].coding.code from http://fhir.nmdp.org/terminology/hla-antibody-assay/bead-interpretation-ranking (extensible)

* interpretation[bead-plausible] ^short = "Bead result plausibility"
* interpretation[bead-plausible] ^definition = "Bead observation interpretation indicating the plausibility of the bead result."
* interpretation[bead-plausible] ^comment = "Categorical assessment of a laboratory value."
* interpretation[bead-plausible].coding 0..1
* interpretation[bead-plausible].coding.system 1..1 MS
* interpretation[bead-plausible].coding.system from http://fhir.nmdp.org/terminology/fhir/CodeSystem/hla-immunoassay-codes (extensible)
* interpretation[bead-plausible].coding.code 1..1 MS
* interpretation[bead-plausible].coding.code from http://fhir.nmdp.org/terminology/fhir/ValueSet/hla-immunoassay-boolean (required)

* interpretation[bead-plausible-reason] ^short = "Bead result plausibility reason"
* interpretation[bead-plausible-reason] ^definition = "Bead observation interpretation indicating the reason code for the plausibility assessment of the bead result."
* interpretation[bead-plausible-reason] ^comment = "Categorical assessment of a laboratory value."
* interpretation[bead-plausible-reason].coding.system 1..1 MS
* interpretation[bead-plausible-reason].coding.system from http://fhir.nmdp.org/terminology/fhir/CodeSystem/hla-immunoassay-codes (extensible)
* interpretation[bead-plausible-reason].coding.code 1..1 MS
* interpretation[bead-plausible-reason].coding.code from http://fhir.nmdp.org/terminology/fhir/ValueSet/hla-immunoassay-bead-plausible-reason (extensible)

* bodySite 0..0
* referenceRange 0..0

* component 1..* MS
* component ^label = "bead-info"
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "$this"
* component ^slicing.ordered = false
* component ^slicing.rules = #open
* component.code.coding 0..1
* component.code.coding.system ^code.display = "hla-target-type"
* component.code.text 1..1 MS
* component.code.text = "HLA immunoassay Bead Information"

* component contains
    bead-hla-target-type 1..1 MS and
    bead-hla-target-serological-specificity 1..1 MS and
    bead-type 1..1 MS and
    bead-count 0..1 and
    bead-conversion-formula 0..1 and
    bead-converted-mfi 1..1 MS

* component[bead-hla-target-type].code.coding.display ^label = "hla-target-serological-specificity"
* component[bead-hla-target-type].code.text 1..1
* component[bead-hla-target-type].code.text ^label = "hla-target-type"
* component[bead-hla-target-type].value[x] 1..1
* component[bead-hla-target-type].value[x] only string
* component[bead-hla-target-type].value[x] from http://fhir.nmdp.org/terminology/glstring (required)

* component[bead-hla-target-serological-specificity] ^label = "hla-target-serological-specificity"
* component[bead-hla-target-serological-specificity].code.coding.display ^mustSupport = false
* component[bead-hla-target-serological-specificity].code.text MS
* component[bead-hla-target-serological-specificity].code.text ^label = "hla-target-serological-specificity"
* component[bead-hla-target-serological-specificity].value[x] 1..1 MS
* component[bead-hla-target-serological-specificity].value[x] only string
* component[bead-hla-target-serological-specificity].value[x] from http://fhir.nmdp.org/terminology/glstring (required)

* component[bead-type].code.coding.system 1..1 MS
* component[bead-type].code.coding.system from http://fhir.nmdp.org/terminology/fhir/CodeSystem/hla-immunoassay-codes (extensible)
* component[bead-type].code.coding.code 1..1 MS
* component[bead-type].code.coding.code from http://fhir.nmdp.org/terminology/fhir/ValueSet/hla-immunoassay-bead-type (extensible)
* component[bead-type].code.text ^mustSupport = false
* component[bead-type].value[x] ^mustSupport = false

* component[bead-count].code.text 1..1
* component[bead-count].code.text ^label = "bead-count"
* component[bead-count].value[x] 1..1
* component[bead-count].value[x] only integer

* component[bead-conversion-formula].code.text 1..1
* component[bead-conversion-formula].code.text ^label = "bead-conversion-formula"
* component[bead-conversion-formula].value[x] 1..1
* component[bead-conversion-formula].value[x] only string

* component[bead-converted-mfi].code.text 1..1 MS
* component[bead-converted-mfi].code.text ^label = "bead-converted-mfi"
* component[bead-converted-mfi].value[x] 1..1 MS
* component[bead-converted-mfi].value[x] only integer