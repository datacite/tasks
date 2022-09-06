
Feature: Citations

        Scenario: Add a citation count
            Given that a event exists
              And that it has a relationType IsCitedBy / IsReferencedBy / IsSupplementTo
              And that it has a sourceId = crossref
             When the event is generated
             Then Never will happen


        Scenario: Add a citation count
            Given that a event exists
              And that it has a relationType Cites / References / IsSupplementedBy
              And that it has a sourceId = crossref
             When the event is generated
             Then the source_relation_type_id should be set to the "references"
              And the source_doi subj_id
             Then the target_relation_type_id should be set to the "citations"
              And the target_doi obj_id


        Scenario: Add a citation count
            Given that a event exists
              And that it has a relationType IsCitedBy / IsReferencedBy / IsSupplementTo
              And that it has a sourceId = datacite-crossref
             When the event is generated
             Then the source_relation_type_id should be set to the "citations"
              And the source_doi subj_id
             Then the target_relation_type_id should be set to the "references"
              And the target_doi obj_id

        Scenario: Add a citation count
            Given that a event exists
              And that it has a relationType Cites / References / IsSupplementedBy
              And that it has a sourceId = datacite-crossref
             When the event is generated
             Then the source_relation_type_id should be set to the "references"
              And the source_doi subj_id
             Then the target_relation_type_id should be set to the "citations"
              And the target_doi obj_id

        Scenario: Add a citation count
            Given that a event exists
              And that it has a relationType Cites / References / IsSupplementedBy
              And that it has a sourceId = datacite-datacite
              And that it has a subj.resourceType = *
             When the event is generated
             Then the source_relation_type_id should be set to the "references"
              And the source_doi subj_id
             Then the target_relation_type_id should be set to the "citations"
              And the target_doi obj_id

        Scenario: Add a citation count
            Given that a event exists
              And that it has a relationType IsCitedBy / IsReferencedBy / IsSupplementTo
              And that it has a sourceId = datacite-datacite
              And that it has a subj.resourceType = *
             When the event is generated
             Then the source_relation_type_id should be set to the "citations"
              And the source_doi subj_id
             Then the target_relation_type_id should be set to the "references"
              And the target_doi obj_id

Feature: Formatting metadata using Related Item

        Scenario: When relatedItemIdentifier is same as identifier and relationType is IsPublishedIn
            Given that user requested DOI metadata in a specific Citation Style via any service (CN, Commons, Fabrica, Citations, Boglonese)
             When the DOI metadata in schema 4.4
              And the DOI corresponds to one of the new schema 4.4 resourceTypeGeneral types
              And there are no descriptions with descriptionType "SeriesInformation"
              And there is a 'relatedItem' with the same "relatedItemIdentifier" as the DOI of the resource
              And there is a 'relationType' with is "IsPublishedIn"
             Then the service must use the 'volume' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'issue' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'title' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'number' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'firstpage' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'lastpage' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'edition' sub-property from 'relatedItem' to generate the correct formatted citation
              And return a formatted citation using the specified style of the DOI

        Scenario: When relatedItemIdentifier is same as identifier and relationType is NOT IsPublishedIn
            Given that user requested DOI metadata in a specific Citation Style via any service (CN, Commons, Fabrica, Citations, Boglonese)
             When the DOI metadata in schema 4.4
              And the DOI corresponds to one of the new schema 4.4 resourceTypeGeneral types
              And there are no descriptions with descriptionType "SeriesInformation"
              And there is a 'relatedItem' with the same "relatedItemIdentifier" as the DOI of the resource
              And there is a 'relationType' with is "IsPublishedIn"
             Then the service must use the 'volume' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'issue' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'title' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'number' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'firstpage' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'lastpage' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'edition' sub-property from 'relatedItem' to generate the correct formatted citation
              And return a formatted citation using the specified style of the relatedItem

        Scenario: When relatedItemIdentifier is same as identifier and relationType is NOT IsPublishedIn
            Given that user requested DOI metadata in a specific Citation Style via any service (CN, Commons, Fabrica, Citations, Boglonese)
             When the DOI metadata in schema 4.4
              And the DOI corresponds to one of the new schema 4.4 resourceTypeGeneral types
              And there are no descriptions with descriptionType "SeriesInformation"
              And there is a 'relatedItem' has no "relatedItemIdentifier"
             Then the service must use the 'volume' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'issue' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'title' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'number' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'firstpage' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'lastpage' sub-property from 'relatedItem' to generate the correct formatted citation
              And the service must use the 'edition' sub-property from 'relatedItem' to generate the correct formatted citation
              And return a formatted citation using the specified style of the relatedItem