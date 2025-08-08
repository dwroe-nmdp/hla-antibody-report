---
canonical: https://fhir.nmdp.org/ig/HlaAntibodyReport/StructureDefinition/hla-immuno-assay-kit
expand: 2
---

# {{page-title}}

## Metadata

These are the details for this resource:

<fql output="table">
	from
		StructureDefinition
	where
		url = %canonical
	select
		Name: name,
		Description: description,
		Canonical_URL: url,
		Status: status,
		Version: version
</fql>

## Resource content

These are different views on this resource:

<tabs>
<tab title="Overview">
	This is the tree view:
	{{tree, buttons}}
</tab>
<tab title="Detailed view">
	This is the detailed view:
	{{dict}}
</tab>
<tab title="XML">
	This is the resource in XML:
	{{xml}}
</tab>
<tab title="JSON">	
	This is the resource in JSON:
	{{json}}
</tab>
<tab title="Link">
	{{link}}
</tab>
</tabs>

## Terminology Bindings

These are the terminology bindings within this resource:

<fql>
	from
    	StructureDefinition
	where
    	url = %canonical
	select
    	join for differential.element
      		select {
				Path: id,
				join
				for binding
				where valueSet.exists()
				select {
					Conformance: strength,
					ValueSet: valueSet}
        	}
</fql>

## Constraints

These are the constraints (invariants) defined within this resource:

<fql>
    from
		StructureDefinition
    where
		url = %canonical
    select
		differential.element {
			Path: id,
			join constraint {
				Id: key,
				Grade: severity,
				Details: human,
				Expression: expression
				}
			}
</fql>