## Problem

There are not enough DOIs with discipline in their metadata to analyze by the MDC partners. 

Problem validation: [We ran an analysis of metadata gaps and discussed it with the MDC partners. ](https://github.com/datacite/pidgraph-notebooks-python/tree/master/mdc-dataset-discipline)

## Solution 

Enrich DOI metadata with client/repository's subject metadata. But only for single discipline repositories.
- For client/repositories with re3dataId, get the discipline metadata from re3data.
- For the rest, allow repositories to add the discipline metadata via the API or Fabrica to their repositories

- [ ] [Wire Frame](https://www.figma.com/file/DaxVvIydnmVDod3bRP6jx1/DOI-enrichment?node-id=2%3A5699)


further details: https://docs.google.com/document/d/1sJUQ_IemyPp0CktKXv_tfa7PhHcZ1NCBNUZwAv0iwCc/edit#

## User Stories

### CRITICAL
- [ ] As an MDC partner, I would like to get the DOIs metadata from single discipline repositories enriched with disciplinary metadata from the repository so that I can carry disciplinary analysis.
- [ ] As a repository Manager from a single discipline repository, I would like to get suggestions about my repository discipline based on my re3DataId. 
- [ ] As Staff, I would like that all discipline DOI metadata enrichment is performed via the  OECD subject classification so we can analyze DOI metadata using this controlled vocabulary.
- [ ] As Staff, I would like to restrict the access to discipline enriched DOI metadata fields to be displayed ONLY via the GraphQL API, so that do not confuse our repositories.

### IMPORTANT

- [ ] As Staff, I would like to encourage, using the earliest open hours session and newsletter, members and clients to add subject discipline using the OECD subject classification in the DOIs metadata, so that we can organically increase the completeness of subject classification in all DOIs metadata.

### Detailed User Stories

```cucumber
Feature: Suggested subject-area-classification for repository

        Scenario: Repository get suggested subject-area-classification from re3data metadat
            Given that the repository has not defined a subject-area-classification
              And that the repository has a re3data Id
              And the re3data id has one or many subject-area-classification in its record
             Then the repository field for subject-area-classification should be populated for as many subject-area-classifications as the re3data record has
              And the suggested subject-area-classifications should be mapped to OECD list
              And the suggested subject-area-classification should be displayed in the input field in Fabrica

Feature: Repository defines its subject-area-classification field

        Scenario: Repository adds/delete/updates its subject-area-classification field in Fabrica
            Given that the repository has a suggested or defined subject-area-classification field
              And the user is logged into fabrica as client admin
             When the user adds/updates/removes the subject-area-classification field for the repository
             Then the subject-area-classification field in the repository metadata must change accordingly
```


## Non Functional Requirements

- [ ] As a user, I expect the UI to add/remove/update discipline metadata to the repository to follow the default Fabrica style and usability.
- [ ] As a user, I expect only the client admin and staff_admin to add/removing/updating discipline metadata to the repository. 
- [ ] As Staff, I would like to avoid any mixed data between the metadata supplied from members/client/repositories and that enriched using this approach, so we can avoid compromising our client's metadata.

## Feature Flag

This feature is implemented behind the `discipline-metadata-enrichment` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

