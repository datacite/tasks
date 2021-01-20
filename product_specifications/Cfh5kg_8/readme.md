
## Problem

A new version of the metadata schema has been released, and we need users to have access to it via our systems.

Problem Validation: [The metadata WG has already worked on validating the changes of the Schema](https://wiki.tib.eu/confluence/display/datacite/Agenda)

closes: https://github.com/datacite/tasks/issues/43
## Proposed Solution 

Modify our services to handle schema version 4.4

Solution Validation: [We have performed all minor changes activities in the past](https://github.com/datacite/schema/issues/56)


![Fabrica WireFrame](https://www.figma.com/file/4IqpgYiEz3P7VCvBHAfAfJ/schema_44?node-id=0%3A1)

## User Stories

### CRITICAL
- [ ] As a user of datacite services, I would like to be able create/update/retrieve DOI metadata with schema version 4.4 from all DataCite APIs, so that I can manage DOIs with the latest version.
- [ ]  As a user of datacite services, I would like to have access to an XSD file of the 4.4 version of the Schema so that I can do my schema validation.
- [ ]  As a user of datacite services, I would like to have access to a JSON schema file of the 4.4 version of the Schema so that I can do my schema validation.

### IMPORTANT

- [ ]  As fabrica user, I would like to have access to the new values, schema version 4.4, to the `resourceTypeGeneral` property from the DOI form, so I can select/update  `resourceTypeGeneral`.
- [ ]  As fabrica user, I would like to have access to the new values,  schema version 4.4 (`isPublishedIn`), to the relationType property from the DOI form, so I can select/update  `relationType`.
- [ ]  As fabrica user, I would like that when I select a discipline classification in the subject field, the appropiated `classificationCode` were included in the metadata, so that I don't have to do it manually.


### NICE TO HAVE

- [ ]  As fabrica user, I would like to add `relatedItem` field via the DOI form, so that  so that I can add/update  Information about a resource related to the one being registered where the related resource does not have an identifier. 


### Detailed User Stories

[Detailed User Stories](detail.feature)


## Non Functional Requirements

- [ ] As a user of datacite services, I would like to be notified of Schema's change via BlogPost, the newsletter, and Open Hours, so I am fully aware of the details of the change.