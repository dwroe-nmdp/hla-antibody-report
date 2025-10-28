Profile: HLAAntibodyDiagnosticReport
Parent: USCoreDiagnosticReportProfileLaboratoryReporting
Id: hla-antibody-diagnostic-report
Title: "HLA Antibody Diagnostic Report"
Description: """HLA Antibody Diagnostic Report

Consolidated laboratory report on the execution of solid-phase immunoassay
Based on the work of the HAML working group maintained here: https://github.com/immunomath/haml

HLA based antibody assay results and expert interpretation for a solid-phase-panel analysis.

This includes metadata about the solid phase panel and a series of beads.
Elements:

Assay
A solid-phase-panel analysis.
This includes metadata about the solid phase panel and a series of beads.
Modifications/preparations/dilutions were done to a sample to create a working sample.

Elements:

            assay-id: A unique identifier for this assay.
            assay-date:
            working-sample:
            interpretation:
            interpretation-software: The software which was used for analysis of the solid-phase-panel results.
            interpretation-software-version: The version of the software used for analysis of the solid-phase-panel results.
            positive-serum-id: An identifier of the serum used as a positive control.
            negative-serum-id: An identifier of the serum used as a negative control.
            bead: Individual beads contained within this panel
            Raw-MFI-divider: This constant is used for comparing multiple analysis machines.
            Note: Sometimes these devices systematically have biases on the same sample, and this constant can be used to calibrate raw-MFI across multiple batches.

Assay Kit

Elements:

            kit-manufacturer: The company or institution that developed the kit
            kit-description:
            catalog-number: A string identifying the specific kit or that was used in this analysis
            lot-number: A string identifying the specific  lot that was used in this analysis

Assay Interpretation

An Interpretation is where we put the results of an entire assay.
This includes which antigens/specificities are determined to be positive or negative.

Elements:

            interpretation-context: "Clinical Interpretation"
            reject-assay: Boolean if the assay was rejected or not.
            reject-reason: Reason for rejecting entire assay
            failure-code: Failure code from assay run
            positive-specificities: HLA GLstring of positively reactive HLA
            questionable-specificities: : HLA GLstring of questionably reactive HLA
            negative-specificities: : HLA GLstring of negatively reactive HLA

Sample and Working Sample
This represents a sample, most likely of blood, which was drawn from a patient.

Elements:

            sample-id: A string with a unique identifier for this sample
            sample-datetime: A dateTime which identifies the date and (optionally) the time when a sample was drawn.
            testing-laboratory: A string with a unique identifier for the laboratory where this sample was drawn
            assay: A number of "assay" elements specify an analysis performed on this sample

A working sample is a part of a sample which is subjected to sample preparations and a subsequent solid-phase panel analysis.

Elements:

            working-sample-id: A unique identifier for this working sample.
            treatment:
            dilution:
            solid-phase-panel:

A treatment describes a process which was performed on a working sample in preparation for solid phase analysis.

Elements:

            method:

A working sample may be diluted in preparation for solid-phase-panel analysis.
This element describes the ratio and substance used for dilution.

Elements:

            ratio: This is expected to be a dilution ratio, a floating point number usually between 0 and 1.
            diluent: This is a text description of the diluent substance or buffer


Bead Result
A single bead within a solid phase panel.
This bead usually has a specificity, which may be an allele name or a serological specificity.
The bead result has information about it's corresponding positive and negative control beads.

Elements:
----------
            bead-info: Structure containing details on the specificity and identifiers of an individual bead
            raw-data: Structure containing measured MFI or raw data as measured in the assay.
            converted-data: Structure containing converted MFIs, formulas used, and interpretations of bead-specific results.
            raw-MFI: Actual measured luminescense from assay
            bead-count:
            formula: transformation appied to raw-MFI value to derive normalized value for clinical decision making
            adjusted-MFI: Derived normalized value for clinical decision making
            bead-interpretation: Bead level interpretation of result
            bead-plausible: Boolean indicator for specific bead

Bead Interpretation
Elements:
----------
            classification-entity: This is the individual or entity who has performed a bead interpretation.
            interpretation-reason: This is the reason a bead has been interpreted. For example, a standard MFI threshold (e.g. 500) was used
            bead-classification: A text Positive/Negative/Borderline/Unspecified classification.
            bead-rank: a numerical bead rank specifying if there was reactivity on this bead."""
* ^url = "https://fhir.nmdp.org/ig/HlaAntibodyReport/StructureDefinition/hla-antibody-diagnostic-report"
* ^version = "0.1.0"
* ^status = #draft
* ^publisher = "NMDP"
* ^contact.name = "David Wroe"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "fhir@nmdp.org"
* ^contact.telecom.use = #work
* ^purpose = "Immunoassay of a patient to identify presence of reactive levels of non-self antibodies to be used in the determination of adverse reactions in the selection of unrelated donor transplant."
* ^language = #English

* . ^short = "An HLA Antibody Diagnostic Report - a combination of request information, atomic results and result interpretations"
* . ^definition = "The findings and interpretation of diagnostic  tests performed on patients including specimens derived from these. The report includes clinical context such as requesting and provider information, and some mix of atomic results, images, textual and coded interpretations, and formatted representation of diagnostic reports."

* extension contains HLAAntibodyDiagnosticReportExt named hLAAntibodyDiagnosticReportExt 0..1

* identifier.value 1..1 MS
* encounter 0..0
* performer.reference MS
* resultsInterpreter.reference MS

* specimen MS
* specimen ^slicing.discriminator.type = #pattern
* specimen ^slicing.discriminator.path = "$this"
* specimen ^slicing.rules = #open
* specimen contains
    HLAImmunoassayWorkingSample 0..1 MS and
    negativeSerum 0..1 MS and
    positiveSerum 0..1 MS

* specimen[HLAImmunoassayWorkingSample].reference 1..1 MS
* specimen[HLAImmunoassayWorkingSample].reference ^label = "HLA Immunoassay Working Sample Reference"
* specimen[HLAImmunoassayWorkingSample].type ^mustSupport = false

* specimen[negativeSerum].reference 1..1
* specimen[negativeSerum].reference ^label = "Negative Serum Reference"

* specimen[positiveSerum] ^label = "Positive Serum"
* specimen[positiveSerum].reference 1..1 MS
* specimen[positiveSerum].reference ^label = "HLA Positive Serum Reference"

* result 1..*
* result only Reference
* result ^type.aggregation[0] = #contained
* result ^type.aggregation[+] = #referenced
* result ^type.aggregation[+] = #bundled
* result.reference 1..1 MS
* result.reference ^label = "Immunoassay Observation"
* result.display = "HLA Immunoassay Bead Observation"

* imagingStudy 0..0
* media 0..0