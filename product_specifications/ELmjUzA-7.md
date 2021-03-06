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
- [ ] As Staff, I would like to [restrict the access](https://github.com/datacite/lupo/blob/5c9de77d427f7accf29057538dd52b89fb82c82a/app/serializers/datacite_doi_serializer.rb#L247) (e.g., GET calls) to discipline enriched DOI metadata fields for non-authenticated users, so that do not confuse our repositories. 

## Non Functional Requirements

- [ ] As a user, I expect the UI to add/remove/update discipline metadata to the repository to follow the default Fabrica style and usability.
- [ ] As a user, I expect only the client admin to add/removing/updating discipline metadata to the repository. 
- [ ] As Staff, I would like to avoid any mixed data between the metadata supplied from members/client/repositories and that enriched using this approach, so we can avoid compromising our client's metadata.

## Feature Flag

This feature is implemented behind the `discipline-metadata-enrichment` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.
<!-- Read more [Feature flags in development of GitLab](https://docs.gitlab.com/ee/development/feature_flags/) -->

