# This Rego policy is to check if the Kbase in XRD is as per the defined template 

package main

#List of all the required annotations in the Knowledgebase
required_annotations := {
  "docs.allianz.io/description",
  "docs.allianz.io/usecases",
  "docs.allianz.io/advantages",
  "docs.allianz.io/dependencies",
  "docs.allianz.io/namingConvention",
  "docs.allianz.io/tags",
  "docs.allianz.io/frontEndName"
}

#Checks for metadata.annotations
deny[msg] {
  
  #defines the scope of Rego rule: Only on XRD (CompositeResourceDefinition) under the crossplane handled bundle
  startswith(input.apiVersion, "apiextensions.crossplane.io")
  input.kind == "CompositeResourceDefinition"

  # Iterate over required annotations
  key := required_annotations[_]

  # Get the annotation value (returns "" if the annotation is missing)
  val := object.get(input.metadata.annotations, key, "")

  # Condition: missing or empty annotation
  val == ""

  msg := sprintf("XRD: '%s' must include non-empty annotation: '%s' in metadata.annotations. The Knowledge Base in your XRD is not correct please refer: https://cmp.allianz.net/spaces/FCP/pages/2284557527/Instructions+and+support+for+filling+out+XRD+Knowledgebase", [input.metadata.name, key])
}


