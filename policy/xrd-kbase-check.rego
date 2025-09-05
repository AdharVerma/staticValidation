# This Rego policy is to check if the Kbase in XRD is as per the defined template 
# metadata.annotation should have the following paramters:
# docs.allianz.io/description: |				
#	docs.allianz.io/usecases: |				    
#	docs.allianz.io/advantages: |				
#	docs.allianz.io/dependencies: |				
#	docs.allianz.io/namingConvention: |			
#	docs.allianz.io/tags: 					   
#	docs.allianz.io/frontEndName:

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



#Checks for metadata.annotations
#Check for "docs.allianz.io/description:" in metadata.annotations in XRD
#deny[msg] {
#	startswith(input.apiVersion, "apiextensions.crossplane.io")
#	input.kind == "CompositeResourceDefinition"
#	not object.get(input.metadata.annotations, "docs.allianz.io/description", false)
 # msg := "Annotation 'docs.allianz.io/description' must be present in metadata.annotations"
#}

#Check for "docs.allianz.io/usecases:" in metadata.annotations in XRD
#deny[msg] {
#	startswith(input.apiVersion, "apiextensions.crossplane.io")
#	input.kind == "CompositeResourceDefinition"
#	not object.get(input.metadata.annotations, "docs.allianz.io/usecases", false)
 # msg := "Annotation 'docs.allianz.io/usecases' must be present in metadata.annotations"
#}

#Check for "docs.allianz.io/advantages:" in metadata.annotations in XRD
#deny[msg] {
#	startswith(input.apiVersion, "apiextensions.crossplane.io")
#	input.kind == "CompositeResourceDefinition"
#	not object.get(input.metadata.annotations, "docs.allianz.io/advantages", false)
 # msg := "Annotation 'docs.allianz.io/advantages' must be present in metadata.annotations"
#}

#Check for "docs.allianz.io/dependencies:" in metadata.annotations in XRD
#deny[msg] {
#	startswith(input.apiVersion, "apiextensions.crossplane.io")
#	input.kind == "CompositeResourceDefinition"
#	not object.get(input.metadata.annotations, "docs.allianz.io/dependencies", false)
#  msg := "Annotation 'docs.allianz.io/dependencies' must be present in metadata.annotations"
#}

#Check for "docs.allianz.io/namingConvention:" in metadata.annotations in XRD
#deny[msg] {
#	startswith(input.apiVersion, "apiextensions.crossplane.io")
#	input.kind == "CompositeResourceDefinition"
#	not object.get(input.metadata.annotations, "docs.allianz.io/namingConvention", false)
#  msg := "Annotation 'docs.allianz.io/namingConvention' must be present in metadata.annotations"
#}

#Check for "docs.allianz.io/tags:" in metadata.annotations in XRD
#deny[msg] {
#	startswith(input.apiVersion, "apiextensions.crossplane.io")
#	input.kind == "CompositeResourceDefinition"
#	not object.get(input.metadata.annotations, "docs.allianz.io/tags", false)
#  msg := "Annotation 'docs.allianz.io/tags' must be present in metadata.annotations"
#}

#Check for "docs.allianz.io/frontEndName:" in metadata.annotations in XRD
#deny[msg] {
#	startswith(input.apiVersion, "apiextensions.crossplane.io")
#	input.kind == "CompositeResourceDefinition"
#	not object.get(input.metadata.annotations, "docs.allianz.io/frontEndName", false)
#  msg := "Annotation 'docs.allianz.io/frontEndName' must be present in metadata.annotations"
#}
