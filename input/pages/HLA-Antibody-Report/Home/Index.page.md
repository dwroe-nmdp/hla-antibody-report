<!-- Graphic-style Header -->
<p align="center">
  <img src="https://www.nmdp.org/-/media/project/nmdp/global/images/logos/nmdp_logo_tm_300x96.svg?h=33&iar=0&w=279&rev=3e13c88086fd4134b9c8588dd337bf15&hash=962753EC04F56EC53A91717E3F2DB963" alt="NMDP Logo" width="150"/>
<img src="https://immunepolymorphismsociety.org/img/logo120.png" alt="SIP Logo" width="120" />
</p>

<h1 align="center">HLA Antibody Diagnostic Report Implementation Guide</h1>
<p align="center">
  <i>A consolidated laboratory report based on the work of the <a href="https://github.com/immunomath/haml">HAML Working Group</a></i>
</p>

---

## {{page-title}} 
{{index:root}}

---
## Use Case Description
---
Here is the general use case for this guide

<plantuml>
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
"NMDP MatchSource" -> "Transplant Center": Virtual Cross-Match
</plantuml>



## Overview
---

# HLA Antibody Diagnostic Report

A consolidated laboratory report on the execution of solid-phase immunoassay based on the work of the HAML working group, maintained [here](https://github.com/immunomath/haml).

HLA-based antibody assay results and expert interpretation for a solid-phase-panel analysis.
This includes metadata about the solid phase panel and a series of beads.

---

## Assay

A solid-phase-panel analysis with modifications/preparations/dilutions applied to a sample to create a working sample.

### Elements

* **assay-id**: A unique identifier for this assay
* **assay-date**
* **assay-kit**
* **working-sample**
* **assay-interpretation**
* **negative-serum**: Reference for the negative control serum
* **positive-serum**: Reference for the positive control serum
* **target-bead-observation**: Individual beads contained within this panel
* **control-bead-observation**: Individual beads contained within this panel

---

## Assay Kit Elements

* **kit-manufacturer**: Company or institution that developed the kit
* **kit-description**
* **solid-phase-panel**
* **catalog-number**: Identifier for the specific kit used
* **lot-number**: Identifier for the lot used
* **interpretation-software**: Software used for analysis
* **interpretation-software-version**: Version of the software used
* **Raw-MFI-divider**: Constant used for comparing multiple analysis machines
  * *Note*: Devices may have systematic biases on the same sample. This constant helps calibrate raw MFI across batches.

---

## Assay Interpretation

Interpretation includes the outcome of the assay: which antigens/specificities are positive or negative.

### Elements

* **interpretation-context**: `"Clinical Interpretation"`
* **reject-assay**: Boolean indicating if the assay was rejected
* **reject-reason**: Reason for rejecting the assay
* **failure-code**: Failure code from the assay run
* **negative-specificities**: HLA GLstring of negatively reactive HLA
* **positive-specificities**: HLA GLstring of positively reactive HLA
* **questionable-specificities**: HLA GLstring of questionably reactive HLA

---

## Working Sample

A sample (likely blood) drawn from a patient.

### Elements

* **working-sample-id**: Unique identifier for this sample
* **sample-datetime**: Date and time when the sample was drawn
* **testing-laboratory**: Identifier for the lab

### Working Sample (Preparation)

A processed portion of the sample prepared for panel analysis.

#### Elements

* **treatment**: Process performed during preparation
* **method**: Ex. dilution
* **diluent**: Description of the diluent substance/buffer
* **ratio**: Dilution ratio (usually between 0 and 1)

---

## Serum

Control serum for assay.

### Elements

* **serum-id**: Unique identifier for this sample
* **control-type**: Negative or positive control serum

---

## Target Bead Result

Describes a single bead within a solid phase panel.

### Elements

* **bead-info**: Specificity and identifiers of the bead
* **bead-type**: Target
* **sample-ref**: Working sample
* **raw-MFI**: Actual measured luminescence
* **bead-count**
* **formula**: Transformation applied to raw-MFI
* **adjusted-MFI**: Normalized value for clinical decision-making
* **bead-interpretation**: Interpretation of bead result
* **bead-plausible**: Boolean indicator of bead plausibility

---

### Target Bead Interpretation Elements

* **classification-entity**: Person/entity who performed interpretation
* **interpretation-reason**: Rationale (e.g., MFI threshold of 500)
* **bead-classification**: *Positive* / *Negative* / *Borderline* / *Unspecified*
* **bead-rank**: Numerical rank of bead reactivity

---

## Control Bead Result

Describes a single control bead within a solid phase panel.

### Elements

* **bead-info**: Specificity and identifiers of the bead
* **target-bead-ref**: Target bead reference of the control bead
* **sample-ref**: Working sample, negative or positive control serum
* **bead-type**: Negative or positive control bead
* **raw-MFI**: Actual measured luminescence
* **bead-count**
* **formula**: Transformation applied to raw-MFI
* **adjusted-MFI**: Normalized value for clinical decision-making

---
