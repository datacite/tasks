# Usage Stats Processing as a Service Specification

## Problem

Repositories lack the technical infrastructure to be sending this information regularly via the usage API. 

Problem validation: [This is a t the core of the MDC and its has been voiced by many users]()

## Solution 

We aim to provide a Tracking Code (similar to GoogleAnalytics), that can be embedded in repository landing pages, that forwards for views and downloads counts to our Usage Stats Processing Service.  


Solution Validatio: [We run a feedback session with potential interested parties. The overall feeedback is tha the solution solved their needs]()

## User Stories

### CRITICAL

- [ ] As an repository admin, I would like the tracking code snippet to be as easy to install as a google analytics tracker, So that I don't need to incur in additional technical infrastructure or developing resources.
- [ ] As an repository admin, I would like the tracking code snippet not to incurr any GDPR breaches, So that I don't have to implement any cosent policy.
- [ ] As an repository admin, I would like the collected usage stats were available via theREST API and  data metrics badge, So that my usage stats can be distributed to the web.
- [ ] As product designer, I would like to Usage stats tracker ID to be a unique and its generated automatically, So that usega stats do not get mixed and users don't have to spent time generating IDs.
- [ ] As a bibliometrician, I would like the processing service to process usage in accordance to the COUNTER code of practice, So I can compare usage stats from using this method with other usage stats collected from other methods (SUSHI reports).
- [ ] As a bibliometrician, I would like the collected usage stats were available via the Datacite GraphQL API, So that I can run my data analysis in jupyter notebooks and scripts.

### IMPORTANT

- [ ] As an repository admin, I would like to have access to a tracker ID directly from Fabrica, So I don't have to go to any other place to configure my usage stats processing.

### NICE TO HAVE

- [ ] As an repository admin, I would like the collected usage stats were available as SUSHI Reports (JSON) in the DataCite API (/reports), So that we can audit the monthly usage stats if we need it to do it.

### Detailed User Stories

```cucumber
@MUST
Feature: Usage Stats Tracker Installation

        Scenario: Installing the Usage stats tracker correctly
            Given that the user has a Usage stats tracker ID
              And that the user has access to a source code of a repository with DOIs  
              When the user includes the the Usage stats tracker CODE with the correct ID and the DOI name in the repository source code
              And the repository is deployed to the web
              And a third party visit the page with the tracking CODE correctly embeded.
             Then the tracking CODE should trigger a call to the DataCite Usage Stats Processing Service
              And the triggered call should include the tracking ID, the DOI, the URL, timestamp, and user-agent string,  

        Scenario: Installing the Usage stats tracker incorrectly
            Given that the user has a Usage stats tracker ID
              And that the user has access to a source code of a repository with DOIs  
              When the user includes the the Usage stats tracker CODE but either the tracking ID or the DOI name are missing the repository source code
             Then an Error Message i nthe developer tools should be displaying 

@MUST
Feature: Getting the Usage stats tracker CODE

        Scenario: Getting the Usage stats tracker CODE in Fabrica
            Given that a Repository admin is logged into Fabrica
             When that user click the setting tab
             Then the would be an non-editable field named USAGE-STATS TRACKER ID
              And the content of the field should be the repositories usage tats tracker ID
              And the usage stats tracker code snippet with the tracker ID should be also displayed.
              And the snippet should have a copy button function to just copy the content of the snippet.
@MUST
Feature: Usage Stats Processing Service 

        Scenario: Recieving usage stats from the Tracker for existing DataCite DOIs
            Given that Stats Processing Service received the analytics from the Tracker
             When ----
             Then the processor must process the analytics following the COUNTER Code of Practice for Research Data.
             And processor must send the processed stats to the Eventdata service with the appropiated metadata: source-id, relation-type-id, total, obj-id, subj-id
             And subj-id must be an url to usage report in the '/reports' endpoint of the month in which the usage stats were captured.

        Scenario: Recieving usage stats from the Tracker for non Datacite DOIs (transfer or malformed)
            Given that Stats Processing Service received the analytics from the Tracker
             When ----
             And the DOI name is not in our index.
             Then the processor must discard the data.
             And it must return a 404 Error.



@MUST
Feature: Usage Stats Processing Display

        Scenario: Displaying Usage Stats from Tracker in the REST API
            Given that usage stats exist for a DOI
             When a user visits to the enpoints '/dois/{doi-name}'
             Then the user should be able to see the usage stats counts in the response

        Scenario: Displaying Usage Stats from Tracker in the GrapQL API
            Given that usage stats exist for a DOI
             When a user visits to the endpoint '/graphql' and makes a query for a viewsCount or downloadsCount
             Then the user should be able to see the usage stats counts in the response

        Scenario: Displaying Usage Stats from Tracker in the EventData API
            Given that usage stats exist for a DOI
             When a user visits to the enpoints '/events/doi={doi-name}'
             Then the user should be able to see the usage stats counts as events in the response

@NICE-TO-HAVE
 Feature: Generating Usage Report
        Scenario: Generating a usage report in SUSHI format on demand
            Given that the user staff admin wants to generate a usage report in SUSHI format for a give repository
              And tha staff_admin user is in the repository settings of a given repository
             When the user click generate report
             Then the Fabrica should transition to generation report page
             And the page should show a month selector and a generate Usage Report button
             When the user selects a month
             And the user click generate report button
             Then a message with the URL of the report to be generated should be displayed
             And a background job should be triggered to generate a USAGE report in SUSHI format using EventData events.

```


## Non Functional Requirements

- 



## Feature Flag

This feature is implemented behind the `usage-processing-service` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

## Technical Feasibility

There are a few open questions about technical feasibility:

- How can plausible be used to process and display usage stats? 
- How can relaiably process usage stats according to the CoP and produce similar stats as with the weblogs processing?

