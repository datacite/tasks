# Usage Stats Processing as a Service Specification

## Problem

Repositories lack the technical infrastructure to be sending this information regularly via the usage API. 

Problem validation: [This is a t the core of the MDC and its has been voiced by many users]()

## Solution 

We aim to provide a Tracking Code (similar to GoogleAnalytics), that can be embedded in repository landing pages, that forwards for views and downloads counts to our Usage Stats Processing Service.  


Solution Validatio: [We run a feedback session with potential interested parties. The overall feeedback is tha the solution solved their needs]()

## User Stories

### CRITICAL

Users:
- Bibliometrician
- Repository Admin
- 


- [ ] As an repository admin, I would like the tracking code snippet to be as easy to install as a google analytics tracker, So that I don't need to incur in additional technical infrastructure or developing resources.
- [ ] As an repository admin, I would like the tracking code snippet not to incurr any GDPR breaches, So that I don't have to implement any cosent policy.
- [ ] As an repository admin, I would like the tracking code snippet not to incurr any GDPR breaches, So that I don't have to implement any cosent policy.

- [ ] As bibliometrician, I would like the collected usage stats were available via the Datacite GraphQL API, So that I can run my data colle
- [ ] As an repository admin, I would like the collected usage stats were available via the data metrics badge, So that my usage stats can be distributed to the web.

- [ ] As an repository admin, I would like the collected usage stats were available as SUSHI Reports in the DataCite API (/reports), So that we can audit the monthly usage stats if we need it to do it.

- [ ] As a bibliometrician, I would like the processing service to process usage in accordance to the COUNTER code of practice, So I can compare usage stats from using this method with other usage stats collected from other methods (SUSHI reports).

- [ ] As a bibliometrician, I would like the processing service to process usage in accordance to the COUNTER code of practice, So I can compare usage stats from using this method with other usage stats collected from other methods (SUSHI reports).


### IMPORTANT


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



## Feature Flag

This feature is implemented behind the `usage-processing-service` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

## Technical Feasibility

There are a few open questions about technical feasibility:

- How can plausible be used to process and display usage stats? 
- How can relaiably process usage stats according to the CoP and produce similar stats as with the weblogs processing?

