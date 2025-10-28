Profile: HLAImmunosssayWorkingSample
Parent: Specimen
Id: hla-immunoassay-working-sample
Title: "HLA Immunoassay Working Sample"
* ^url = "https://fhir.nmdp.org/ig/HlaAntibodyReport/StructureDefinition/hla-immunoassay-working-sample"
* ^version = "0.1.0"
* ^status = #draft
* ^publisher = "NMDP"
* ^contact.name = "David Wroe"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "fhir@nmdp.org"
* ^contact.telecom.use = #work

* processing 1..*
* processing.procedure 1..1
* processing.procedure.coding.system 1..1 MS
* processing.procedure.coding.system from http://fhir.nmdp.org/terminology/fhir/CodeSystem/hla-immunoassay-codes (required)
* processing.procedure.coding.code 1..1 MS
* processing.procedure.coding.code from http://fhir.nmdp.org/terminologyfhir/ValueSet//hla-immunoassay-sample-treatment (required)