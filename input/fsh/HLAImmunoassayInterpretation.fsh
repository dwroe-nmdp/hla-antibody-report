Profile: HLAImmunoassayInterpretation
Parent: Observation
Id: hla-immunoassay-interpretation
Title: "HLA Immunoassay Interpretation"
Description: """An HLA Antibody Assay Interpretation contains the overall human interpretation of an entire assay.
This includes which antigens/specificities are determined to be positive or negative.

Components of this observation:
------------------------------------

interpretation-context: "Clinical Interpretation"
reject-assay: Boolean if the assay was rejected or not.
reject-reason: Reason for assay rejection
failure-code: Failure code generated for assay
positive-specificities: multi-locus HLA GLstring of all loci and alleles considered positive
questionable-specificities: multi-locus HLA GLstring of all loci and alleles considered questionable
negative-specificities: multi-locus HLA GLstring of all loci and alleles considered negative"""
* ^url = "https://fhir.nmdp.org/ig/HlaAntibodyReport/StructureDefinition/hla-immunoassay-interpretation"
* ^version = "0.0.1"
* ^status = #draft
* ^publisher = "NMDP"
* ^contact.name = "David Wroe"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "fhir@nmdp.org"
* ^contact.telecom.use = #work
* ^purpose = "An HLA Antibody Assay Interpretation contains the overall human interpretation of an entire assay. This includes which antigens/specificities are determined to be positive or negative."

* partOf.reference 1..1 MS
* partOf.reference ^label = "HLA Antibody Diagnostic Report Ref"
* focus 0..0
* encounter 0..0
* performer MS
* performer.reference 1..1 MS
* interpretation 0..0
* bodySite 0..0
* specimen MS
* specimen.reference 1..1
* referenceRange 0..0

* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "$this"
* component ^slicing.rules = #open
* component contains
    assay-rejected 0..1 MS and
    assay-failure-code 0..1 MS and
    assay-interpretation-context 1..1 MS and
    assay-interpretation-negative-specificities 0..1 MS and
    assay-interpretation-positive-specificities 0..1 and
    assay-interpretation-questionable-specificities 0..1

* component[assay-rejected] ^label = "assay-rejected"
* component[assay-rejected].code.coding.system 1..1 MS
* component[assay-rejected].code.coding.system from http://fhir.nmdp.org/terminology/fhir/CodeSystem/hla-immunoassay-codes (extensible)
* component[assay-rejected].code.coding.code 1..1 MS
* component[assay-rejected].code.coding.code from http://fhir.nmdp.org/terminologyfhir/ValueSet//hla-immunoassay-rejected-reason (extensible)

* component[assay-failure-code] ^label = "assay-failure-code"
* component[assay-failure-code].code.coding.system 1..1 MS
* component[assay-failure-code].code.coding.system from http://fhir.nmdp.org/terminology/fhir/CodeSystem/hla-immunoassay-codes (extensible)
* component[assay-failure-code].code.coding.code 1..1 MS
* component[assay-failure-code].code.coding.code from http://fhir.nmdp.org/terminology/fhir/ValueSet/hla-immunoassay-failure-code (extensible)

* component[assay-interpretation-context] ^label = "assay-interpretation-context"
* component[assay-interpretation-context].code.coding.system 0..0
* component[assay-interpretation-context].code.coding.code 0..0
* component[assay-interpretation-context].code.text 1..1 MS
* component[assay-interpretation-context].code.text = "Clinical Interpretation"

* component[assay-interpretation-negative-specificities] ^label = "Negative Specificities"
* component[assay-interpretation-negative-specificities].code.coding.system MS
* component[assay-interpretation-negative-specificities].code.coding.system from http://fhir.nmdp.org/terminology/fhir/CodeSystem/hla-immunoassay-codes (required)
* component[assay-interpretation-negative-specificities].code.coding.code 1..1 MS
* component[assay-interpretation-negative-specificities].code.coding.code = #Negative
* component[assay-interpretation-negative-specificities].code.coding.code ^label = "Specificity"
* component[assay-interpretation-negative-specificities].code.coding.code from http://fhir.nmdp.org/terminology/fhir/ValueSet/hla-immunoassay-interpretation-specificity (extensible)
* component[assay-interpretation-negative-specificities].value[x] 1..1
* component[assay-interpretation-negative-specificities].value[x] only string
* component[assay-interpretation-negative-specificities].value[x] ^label = "Negative Specificities"

* component[assay-interpretation-positive-specificities].code.coding.system 1..1 MS
* component[assay-interpretation-positive-specificities].code.coding.system from http://fhir.nmdp.org/terminology/fhir/CodeSystem/hla-immunoassay-codes (extensible)
* component[assay-interpretation-positive-specificities].code.coding.code 1..1 MS
* component[assay-interpretation-positive-specificities].code.coding.code = #Positivie
* component[assay-interpretation-positive-specificities].code.coding.code ^label = "Specificity"
* component[assay-interpretation-positive-specificities].code.coding.code from http://fhir.nmdp.org/terminology/fhir/ValueSet/hla-immunoassay-interpretation-specificity (extensible)
* component[assay-interpretation-positive-specificities].value[x] 1..1 MS
* component[assay-interpretation-positive-specificities].value[x] only string
* component[assay-interpretation-positive-specificities].value[x] ^label = "Positive Specificities"

* component[assay-interpretation-questionable-specificities].code.coding.system 1..1 MS
* component[assay-interpretation-questionable-specificities].code.coding.system from http://fhir.nmdp.org/terminology/fhir/CodeSystem/hla-immunoassay-codes (extensible)
* component[assay-interpretation-questionable-specificities].code.coding.version ^mustSupport = false
* component[assay-interpretation-questionable-specificities].code.coding.code 1..1 MS
* component[assay-interpretation-questionable-specificities].code.coding.code = #Questionable
* component[assay-interpretation-questionable-specificities].code.coding.code ^label = "Specificity"
* component[assay-interpretation-questionable-specificities].code.coding.code from http://fhir.nmdp.org/terminology/fhir/ValueSet/hla-immunoassay-interpretation-specificity (extensible)
* component[assay-interpretation-questionable-specificities].value[x] only string
* component[assay-interpretation-questionable-specificities].value[x] MS
* component[assay-interpretation-questionable-specificities].value[x] ^label = "Questionable Specificities"