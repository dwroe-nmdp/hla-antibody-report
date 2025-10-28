Profile: HLAImmunoassayKit
Parent: DeviceDefinition
Id: hla-immunoassay-kit
Title: "HLA Immunoassay Kit"
* ^url = "https://fhir.nmdp.org/ig/HlaAntibodyReport/StructureDefinition/hla-immunoassay-kit"
* ^version = "0.1.0"
* ^status = #draft
* ^publisher = "NMDP"
* ^contact.name = "David Wroe"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "fhir@nmdp.org"
* ^contact.telecom.use = #work

* identifier 1..1 MS
* identifier.type.text ^mustSupport = false
* identifier.value 1..1 MS
* manufacturer[x] MS
* deviceName.name MS
* deviceName.name ^short = "Solid Phase Immunoassay"
* deviceName.name = "Solid Phase Immunoassay"
* deviceName.type = #manufacturer-name
* modelNumber 1..1 MS
* version 0..1 MS
* safety 0..0
* shelfLifeStorage 0..0
* physicalCharacteristics 0..0
* capability 0..0

* property ^slicing.discriminator.type = #value
* property ^slicing.discriminator.path = "$this"
* property ^slicing.rules = #open
* property contains
    interpretationSoftware 0..1 MS and
    interpretationSoftwareVersion 0..1 MS and
    lotNumber 0..1 MS

* property[interpretationSoftware].valueCode.text MS
* property[interpretationSoftware].valueCode.text ^label = "Interpretation Software"

* property[interpretationSoftwareVersion].valueCode.text MS
* property[interpretationSoftwareVersion].valueCode.text ^label = "Interpretation Software Version"

* property[lotNumber].valueCode.text MS
* property[lotNumber].valueCode.text ^label = "Lot Number"

* contact 0..0
* onlineInformation 0..0
* quantity 0..0
* material 0..0