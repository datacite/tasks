
## Problem

A new version of the metadata schema has been released, and we need users to be able to access and make deposit of metadata using our systems.

Problem Validation: [The metadata WG has already worked on validating the changes of the Schema](https://wiki.tib.eu/confluence/display/datacite/Agenda)

closes: https://github.com/datacite/tasks/issues/43
## Proposed Solution 

Modify our services to handle schema version 4.4 metadata deposits and access.

Solution Validation: [We have performed all minor changes activities in the past](https://github.com/datacite/schema/issues/56)


[Fabrica WireFrame](https://www.figma.com/file/4IqpgYiEz3P7VCvBHAfAfJ/schema_44?node-id=0%3A1)

## User Stories

### CRITICAL
- [ ] As a user of datacite services, I would like to be able create/update/retrieve DOI metadata with schema version 4.4 from all DataCite APIs, so that I can manage DOIs with the latest version.
- [ ]  As a user of datacite services, I would like to have access to an XSD file of the 4.4 version of the Schema so that I can do my schema validation.

### IMPORTANT

- [ ]  As fabrica user, I would like to have access to the new values, schema version 4.4, to the `resourceTypeGeneral` property from the DOI form, so I can select/update  `resourceTypeGeneral`.
- [ ]  As fabrica user, I would like to have access to the new values,  schema version 4.4 (`isPublishedIn`), to the relationType property from the DOI form, so I can select/update  `relationType`.


### NICE TO HAVE

- [ ]  As fabrica user, I would like to add/update `relatedItem` field via the DOI form, so that  so that I can add/update  Information about a resource related to the one being registered where the related resource does not have an identifier. 
- [ ]  As a user of datacite services, I would like to have access to a JSON schema file of the 4.4 version of the Schema so that I can do my schema validation.


### Detailed User Stories

[Detailed User Stories](detail.feature)

```cucumber
Feature: Creating metadata with schema 4.4 using the API

        Scenario: creating a new DOI
            Given that user has the correct user name and password
              And it has provided metadata in following schema 4.4
             When the user deposit metadata using the API
             Then the API should accept the new values for the 'resourceTypeGeneral' property
              And the API should accept the new values for the 'classificationCode' sub-property
              And the API should accept the new values for the 'relationType' sub-property
              And the API should accept the new values for the 'relatedItem' property and all its sub-properties


        Scenario: creating a updating an existing DOI to schema 4.4
            Given that user has the correct user name and password
              And that the user has provided metadata in following schema 4.4
              And that exisiting DOI is previous compatible version
             When the user deposit metadata using the API
             Then the API should accept the new values for the 'resourceTypeGeneral' property
              And the API should accept the new values for the 'classificationCode' sub-property
              And the API should accept the new values for the 'relationType' sub-property
              And the API should accept the new values for the 'relatedItem' property and all its sub-properties
              And the API should accept save the metadata deposit with schema version 4.4

Feature: Adding relatedItem information to a new DOI in Fabrica

        Scenario: User want to add relatedItem to the a new DOI
            Given that user is logged in Fabrica
             When the user visits the DOI Form page
             Then the user would be able to add 'resourceTypeGeneral' following schema 4.4
              And the user would be able to add 'relationType' sub-property following schema 4.4
              And the user would be able to add the 'relatedItem' property
              And the user would be able to add the 'relationType' sub-property for 'relatedItem'
              And the user would be able to add the 'relatedItemType' sub-property for 'relatedItem'
              And the user would be able to add the 'relatedItemIdentifier' property
              And the user would be able to add the 'relatedItemIdentifierType' property
              And the user would be able to add the 'title' sub-property for 'relatedItem', but not other 'titles' subproperties
              And the user would be able to add the 'volume' sub-property for 'relatedItem'
              And the user would be able to add the 'issue' sub-property for 'relatedItem'
              And the user would be able to add the 'number' sub-property for 'relatedItem', but not its subproperties
              And the user would be able to add the 'publicationYear' sub-property for 'relatedItem'
              And the user would be able to add the 'creatorName' sub-property for 'relatedItem', but not other 'creator' subproperties
              And the user would be able to add the 'contributorName'  and 'contributorType' sub-property for 'relatedItem', but not other 'contributor' subproperties



```


## Non Functional Requirements

- [ ] As a user of datacite services, I would like to be notified of Schema's change via BlogPost, the newsletter, and Open Hours, so I am fully aware of the details of the change.
- [ ]  As a user of datacite services, I would like to support pages documentation updated with the pertientn changes to  schema version 4.4, so that I can refer to them if I need to.
