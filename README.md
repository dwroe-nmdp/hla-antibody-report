[![Contributors](https://img.shields.io/github/contributors/owners/repo)](CONTRIBUTORS.md)

<!-- Graphic-style Header -->
<p align="center">
  <img src="https://www.nmdp.org/-/media/project/nmdp/global/images/logos/nmdp_logo_tm_300x96.svg?h=33&iar=0&w=279&rev=3e13c88086fd4134b9c8588dd337bf15&hash=962753EC04F56EC53A91717E3F2DB963" alt="NMDP" width="150"/>
</p>
<!-- Graphic-style Header -->
<p align="center">
  <img src="https://immunepolymorphismsociety.org/img/logo120.png" alt="Society for Immune Polymorphism" width="120" />
</p>

<h1 align="center">HLA Antibody Diagnostic Report FHIR Implementation Guide</h1>
<p align="center">
  <i>A consolidated laboratory report based on the work of the <a href="https://github.com/immunomath/haml">HAML Working Group</a></i>
</p>

---

# HLA Antibody Reporting
FHIR standard documents for the electronic exchange of HLA antibody reports

FHIR Project: [FHIR HLA Antibody Diagnostic Report](https://simplifier.net/hla-antibody-report)

FHIR Implementation Guide: [FHIR HLA Antibody Diagnostic Report IG](https://simplifier.net/guide/hla-antibody-report-ig?version=current)

## Contributors

Based on the HAML working group specification, version 0_5_0

HAML Repository: [HAML HLA Antibody Markup Language](https://github.com/immunomath/haml/tree/main/schemas/0_5)

Thanks to all our amazing [contributors](CONTRIBUTORS.md)! 🎉

Want to contribute? Check out our [contributing guide](CONTRIBUTING.md).

---

## FHIR Repository Structure

```asciiflow

hla-antibody-report
├── input
│   ├── fsh/               # FHIR Shorthand (FSH) source files (if used)
│   ├── resources/         # FHIR resources (StructureDefinitions, ValueSets, CodeSystems, etc.)
│   │   ├── StructureDefinition/
│   │   │   └──  your-profile-name.json  (or .xml)
│   │   ├── ValueSet/
│   │   │   └──  your-valueset-name.json  (or .xml)
│   │   └── CodeSystem/
│   │       └──  your-codesystem-name.json  (or .xml)
│   ├── images/            # Images for documentation
│   ├── pages/             # Markdown or HTML pages for your implementation guide
│   │   └── index.md
│   └──  package-list.json # Metadata for the FHIR package
├── output/                #  Generated Implementation Guide (after building)
├── .github/               # GitHub-specific files (e.g., CI/CD workflows)
├── package.json           # Project metadata (for SUSHI/IG publisher)
├── sushi-config.yaml      # SUSHI configuration file (if using FSH)
├── README.md              # Repository README
├── LICENSE                # Project license
├── TRADEMARKS             # Project trademark attributions
├── CONTRIBUTING           # Project contribution procedures
├── CONTRIBUTORS           # Project contributor attributions
└── CODE_OF_CONDUCT        # Project contributor code of conduct

```

---

## Dependencies

| Name                         | Version         | Release Date |
|------------------------------|-----------------|--------------|
| hl7.fhir.r4.core             | 4.0.1           | 11/18/2019   |
| hl7.fhir.us.core             | 8.0.0           | 6/11/2025    |
| hl7.terminology.r4           | 6.4.0           | 5/29/2025    |
| hl7.fhir.uv.extensions.r4    | 5.2.0           | 2/11/2025    |
| hl7.fhir.us.core             | 8.0.0           | 6/11/2025    |
| hl7.fhir.us.core             | 8.0.0           | 6/11/2025    |
| hl7.fhir.uv.smart-app-launch | 2.2.0           | 7/29/2024    |
| hl7.fhir.uv.extensions       | 5.1.0-snapshot1 | 7/29/2024    |
| hl7.terminology.r5           | 5.3.0           | 9/11/2023    |
| hl7.fhir.r5.core             | 5.0.0           | 5/3/2023     |
| hl7.terminology              | 5.5.0           | 3/10/2024    |
| hl7.fhir.uv.sdc              | 3.0.0           | 3/8/2022     |
| hl7.fhir.r4.examples         | 4.0.1           | 11/18/2019   |
| us.cdc.phinvads              | 0.12.0          | 7/26/2022    |

---

## Installation

npm --registry https://packages.simplifier.net install hla.antibody.report@0.1.2

---
## Use Case Description
---
Here is the general use case for this guide

```mermaid
sequenceDiagram
"Transplant Center" -> "Lab": Request
"Lab" -> "Immunoassay": Run
"Immunoassay" -> "LIMS": Raw-Data
"LIMS" -> "Interpretation Software": Convert
"Interpretation Software" -> "LIMS": Interpret
"LIMS" -> "LIMS FHIR": Raw+Converted+Interpretation
"LIMS FHIR" -> "NMDP FHIR": Bundle
"NMDP FHIR" -> "LIMS FHIR": Conformance
"NMDP FHIR" -> "NMDP Antibody Service": All-Data
"NMDP Antibody Service" -> "NMDP MatchSource": Antibody-Profile
"NMDP MatchSource" -> "Transplant Center": Cross-Match

```

---

## Overview

A consolidated laboratory report on the execution of solid-phase immunoassay based on the work of the HAML working group, maintained [here](https://github.com/immunomath/haml).

HLA-based antibody assay results and expert interpretation for a solid-phase-panel analysis.
This includes metadata about the solid phase panel and a series of beads.

---

## Assay

A solid-phase-panel analysis with modifications/preparations/dilutions applied to a sample to create a working sample.

### Elements

* **assay-id**: A unique identifier for this assay
* **assay-date**
* **Raw-MFI-divider**: Constant used for comparing multiple analysis machines
    * *Note*: Devices may have systematic biases on the same sample. This constant helps calibrate raw MFI across batches.
* **working-sample**
* **positive-control-serum**: Identifier for the positive control serum
* **negative-control-serum**: Identifier for the negative control serum
* **assay-interpretation**
* **target-bead-observation**: Individual HLA Target beads contained within this assay
* **control-bead-observation**: Positive, negative or HLA Target control beads contained within this assay

---

## Assay Kit Elements

* **kit-manufacturer**: Company or institution that developed the kit
* **kit-description**
* **catalog-number**: Identifier for the specific kit used
* **lot-number**: Identifier for the lot used
* **interpretation-software**: Software used for analysis
* **interpretation-software-version**: Version of the software used

---

## Assay Interpretation

Interpretation includes the outcome of the assay: which antigens/specificities are positive or negative.

### Elements

* **interpretation-context**: `"Clinical Interpretation"`
* **reject-assay**: Boolean indicating if the assay was rejected
* **reject-reason**: Reason for rejecting the assay
* **failure-code**: Failure code from the assay run
* **positive-specificities**: HLA GLstring of positively reactive HLA
* **questionable-specificities**: HLA GLstring of questionably reactive HLA
* **negative-specificities**: HLA GLstring of negatively reactive HLA

---

## Working Sample

A sample (likely blood) drawn from a patient.

### Elements

### Working Sample

* **working-sample-id**: Unique identifier for this working sample
* **sample-id**: Unique identifier for this patient sample
* **sample-datetime**: Date and time when the sample was drawn
* **testing-laboratory**: Identifier for the lab

* A processed portion of the sample prepared for panel analysis.

### Working Sample (Treatment)

#### Elements

* **treatment**: Process performed during preparation
* **dilution**: Describes dilution ratio and substance used
* **method**: Describes treatment method example: dilution ratio and substance used
* **ratio**: Dilution ratio (usually between 0 and 1) example: 0.5 (50%)
* **diluent**: Description of the diluent substance/buffer example: Water

---

## Target Bead Result

Describes a single bead with target HLA and the working sample applied within a solid phase panel.

### Elements

* **bead-info**: Specificity and identifiers of the bead
* **raw-MFI**: Actual measured luminescence
* **formula**: Transformation applied to raw-MFI
* **adjusted-MFI**: Normalized value for clinical decision-making
* **bead-count**: [TO-DO: Explanation of this attribute]
* **bead-plausible**: Boolean indicator of bead plausibility
* **bead-interpretation**: Interpretation structure of bead result

---

### Target Bead Interpretation Elements

* **classification-entity**: Person/entity who performed interpretation
* **interpretation-reason**: Rationale (e.g., MFI threshold of 500)
* **bead-classification**: *Positive* / *Negative* / *Questionable* / *Unspecified*
* **bead-rank**: Numerical rank of bead reactivity

### Bead Info Elements

* **bead-id**: Unique identifier of bead (Assay Catalog Number + Lot Number + Bead Serial Number)
* **bead-type**: Target, Negative Control or Positive Control
* **target-hla-specificity**: HLA Allele target for bead
* **target-serological-specificity**: Serological target for bead

---

## Control Bead Result

Describes a single bead with negative control, positive control or target HLA and the working sample, negative control serum or positive control serum applied within a solid phase panel assay.

### Elements

* **bead-info**: Specificity and identifiers of the bead
* **serum**: Serum applied to this bead (negative control, positive control or working sample)
* **raw-MFI**: Actual measured luminescence
* **formula**: Transformation applied to raw-MFI
* **adjusted-MFI**: Normalized value for clinical decision-making
* **bead-count**: [TO-DO: Explanation of this attribute]

---

## Element Relationships

```mermaid

classDiagram
    class Patient {
        +labRefId: 6898456
    }

    class HLAAntibodyDiagnosticReport {
        +DiagnosticReportId: 1937364874673
    }

    class LaboratoryOrg {
        +laboratoryId: 12393712
        +name: HLA Laboratory
    }

    class WorkingSample {
        +workingSampleId: 3739373468
        +patientSpecimenId: 4343847748
        +treatment: Dilution
        +Diluent: Water
        +Ratio: 0.5
    }

    class ImmunoassayInterpretation {
        +negative-specificities: "HLA-A*01:01+HLA-A*24:02"
        +positive-specificities: "HLA-A*01:01+HLA-A*24:02"
        +questionable-specificities: "HLA-A*01:01+HLA-A*24:02"
    }

    class ImmunoassayBeadObservationTargetSample1 {
        +beadId: 100238373678-1001
        +targetHLA: HLA-A*01:01
        +raw_mfi: 7650
        +converted_mfi: 7500
    }
    class ImmunoassayBeadControlNegBeadSample1 {
        +beadId: 100238373678-1002
        +raw_mfi: 650
        +converted_mfi: 500
    }
    class ImmunoassayBeadControlPosBeadSample1 {
        +beadId: 100238373678-1003
        +raw_mfi: 10000
        +converted_mfi: 10000
    }
    class ImmunoassayBeadObservationTargetNegSerum1 {
        +beadId: 100238373678-1004
        +raw_mfi: 7650
        +converted_mfi: 7500
    }
    class ImmunoassayBeadObservationNegBeadNegSerum1 {
        +beadId: 100238373678-1005
        +raw_mfi: 40
        +converted_mfi: 40
    }
    class ImmunoassayBeadObservationPosBeadNegSerum1 {
        +beadId: 100238373678-1006
        +raw_mfi: 650
        +converted_mfi: 750
    }
    class ImmunoassayBeadObservationTargetPosSerum1 {
        +beadId: 100238373678-1007
        +raw_mfi: 7650
        +converted_mfi: 7500
    }
    class ImmunoassayBeadObservationNegBeadPosSerum1 {
        +beadId: 100238373678-1008
        +raw_mfi: 200
        +converted_mfi: 250
    }
    class ImmunoassayBeadObservationPosBeadPosSerum1 {
        +beadId: 100238373678-1009
        +raw_mfi: 15000
        +converted_mfi: 15000
    }

    class ImmunoassayKit {
        +deviceId: 100238373678
        +catalogRef: A-987243
        +lotNumber: 8973
    }

%% Relationships
    Patient <|--o HLAAntibodyDiagnosticReport
    HLAAntibodyDiagnosticReport <|--o LaboratoryOrg
    HLAAntibodyDiagnosticReport <|--o WorkingSample
    HLAAntibodyDiagnosticReport <|--o ImmunoassayInterpretation
    HLAAntibodyDiagnosticReport <|--o ImmunoassayKit

    HLAAntibodyDiagnosticReport <|--o ImmunoassayBeadObservationTargetSample1

    ImmunoassayBeadObservationTargetSample1 <|--o WorkingSample
    ImmunoassayBeadControlNegBeadSample1    <|--o WorkingSample
    ImmunoassayBeadControlPosBeadSample1    <|--o WorkingSample

    ImmunoassayBeadObservationTargetNegSerum1 <|--o NegativeSerum
    ImmunoassayBeadObservationNegBeadNegSerum1 <|--o NegativeSerum
    ImmunoassayBeadObservationPosBeadNegSerum1 <|--o NegativeSerum

    ImmunoassayBeadObservationTargetPosSerum1 <|--o PositiveSerum
    ImmunoassayBeadObservationNegBeadPosSerum1 <|--o PositiveSerum
    ImmunoassayBeadObservationPosBeadPosSerum1 <|--o PositiveSerum

    ImmunoassayBeadObservationTargetSample1 <|--o ImmunoassayBeadControlNegBeadSample1
    ImmunoassayBeadObservationTargetSample1 <|--o ImmunoassayBeadControlPosBeadSample1
    ImmunoassayBeadObservationTargetSample1 <|--o ImmunoassayBeadObservationTargetNegSerum1
    ImmunoassayBeadObservationTargetSample1 <|--o ImmunoassayBeadObservationNegBeadNegSerum1
    ImmunoassayBeadObservationTargetSample1 <|--o ImmunoassayBeadObservationPosBeadNegSerum1
    ImmunoassayBeadObservationTargetSample1 <|--o ImmunoassayBeadObservationTargetPosSerum1
    ImmunoassayBeadObservationTargetSample1 <|--o ImmunoassayBeadObservationNegBeadPosSerum1
    ImmunoassayBeadObservationTargetSample1 <|--o ImmunoassayBeadObservationPosBeadPosSerum1

```
