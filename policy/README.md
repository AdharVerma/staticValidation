# Validate AI Consumable Knowledgebase in XRD Objects

This Rego policy validates CompositeResourceDefinition (XRD) objects in Crossplane to ensure the Kbase, added for AI chatbot claim generator, is following the standards.

It checks that the metadata.annotations has the following parameters:

- docs.allianz.io/description: |				# paragraph (multiline) 
-	docs.allianz.io/usecases: |				    # hyphened statements of possible usecases
-	docs.allianz.io/advantages: |				# hyphened statements of the advantages
-	docs.allianz.io/dependencies: |				# hyphened values of all the dependent XRD metadata.names
-	docs.allianz.io/namingConvention: |			# hyphened rules explained with an example
-	docs.allianz.io/tags: 					    # Comma separated values. E.g.: tag1, tag2, tag3
-	docs.allianz.io/frontEndName:
The policy does not have any exclusion mechanism as it is globally scoped to ensure uniformity and add more value to AI chatbot user experience.

The policy is scoped to apiextensions.crossplane.io API versions and CompositeResourceDefinition objects.
