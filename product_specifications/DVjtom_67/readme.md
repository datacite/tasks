# Usage Stats Processing as a Service Specification

## Problem

Repositories lack the technical infrastructure to be sending this information regularly via the usage API. 

Problem validation: [This is a t the core of the MDC and its has been voiced by many users](https://datacite.productboard.com/roadmap/2537097-development-journey/features/7041967/detail) as wel las in the previous [survey](https://zenodo.org/record/3476545#.YIBZ36kzZUI). 

## Solution 

We aim to provide a Tracking Code (similar to GoogleAnalytics), that can be embedded in repository landing pages, that forwards for views and downloads counts to our Usage Stats Processing Service.  

WireFrames: [Figma File](https://www.figma.com/file/Fd54mIb3WVYqQfw3KQmp68/SAAS-Processor?node-id=0%3A1)

Solution Validatio: [We run a feedback session with potential interested parties. The overall feeedback is tha the solution solved their needs]()

## User Stories

### CRITICAL
- [ ] As an repository admin, I would like the tracking code snippet to be as easy to install as a google analytics tracker, So that I don't need to incur in additional technical infrastructure or developing resources.
- [ ] As an repository admin, I would like the tracking code snippet not to incurr any GDPR breaches, So that I don't have to implement any consent policy.
- [ ] As a bibliometrician, I would like the processing service to process usage in accordance to the COUNTER code of practice, So I can compare usage stats from using this method with other usage stats collected from other methods (SUSHI reports).
- [ ] As a bibliometrician, I would like the collected usage stats were available via the Datacite GraphQL API, So that I can run my data analysis in jupyter notebooks and scripts.
- [ ] As an repository admin, I would like to have access to the usage stats directly Fabrica, So I have a quick overview of the usage when adminitrating my DOIs.

### IMPORTANT

- [ ] As an repository admin, I would like the collected usage stats were available via the REST API, GraphQL and  data metrics badge, So that my usage stats can be distributed to the web.
- [ ] As an repository admin, I would like to have access to a tracker ID directly from Fabrica, So I don't have to go to any other place to configure my usage stats processing.

### NICE TO HAVE

- [ ] As an repository admin, I would like the collected usage stats were available as SUSHI Reports (JSON) in the DataCite API (/reports), So that we can audit the monthly usage stats if we need it to do it.

### Detailed User Stories

```cucumber

Feature: Usage Stats Tracker Installation

        Scenario: Installing the Usage stats tracker correctly
            Given that the user has a Usage stats tracker CODE
              And that the user has access to a source code of a repository with DOIs  
              When the user includes the the Usage stats tracker CODE with the correct DOI name in the landing pages source code
              And the repository is deployed to the web
              And a third party visit the landing page with the tracking CODE correctly embeded.
             Then the tracking CODE should trigger a call to the DataCite Usage Stats Processing Service
              And the triggered call should include the all data needed for usage stats processing. 

        Scenario: Installing the Usage stats tracker incorrectly
            Given that the user has a Usage stats tracker CODE
              And that the user has access to a source code of a repository with DOIs  
              When the user includes the the Usage stats tracker CODE but either the tracking CODE or the DOI name are missing the repository source code
             Then an Error Message in the developer tools should be displaying 

Feature: Getting the Usage stats tracker CODE

        Scenario: Activating the Usage stats tracking
            Given that a Repository admin is logged into Fabrica
             And the Repository admin is in the repository update form 
             When the user checks the usage tracking field
             And fills in the domain and time zone tracking fields.
             And clicks save
             Then a site tracking should be created in the  Usage stats processing service.
             And the embed code for a [Embed dashboard](https://plausible.io/docs/visibility) should be generated
             And the tracker CODE for the repository should be generated
             And a new Tab, named Usage Tracking Dashboard, should be avaialble in Fabrica 
             And the tracker CODE for the repository should be visible in the repository update page


        Scenario: Getting the Usage stats tracker CODE in Fabrica
            Given that a Repository admin is logged into Fabrica
             And that it has activited Usage stats tracking
             When that user click the settings tab
             Then the would be an non-editable field named USAGE-STATS TRACKER CODE
              And the content of the field should be the repositories usage stats tracker CODE
              And the snippet should have a copy button function to just copy the content of the snippet.


Feature: Usage Stats Processing Service 

        Scenario: Recieving usage stats from the Tracker for existing DataCite DOIs
            Given that Stats Processing Service received the analytics from the Tracker
             When the end of the month arrives.
             Then the processor must process the analytics following the COUNTER Code of Practice for Research Data.
             And the processor must generate a JSON SUSHI report of the stats by repository with the following metrics types:
                unique-investigations-regular
                unique-requests-regular
                total-investigations-regular
                total-requests-regular
             And processor must send the JSON SUSHI report to the REST API '/reports'

        Scenario: Recieving usage stats from the Tracker for non Datacite DOIs (transfer or malformed)
            Given that Stats Processing Service received the analytics from the Tracker
             When data is sent to the processor
             And the DOI name is not in our index.
             Then the processor must discard the data.
             And it must return a 404 Error to the tracker.

Feature: Acessing Usage Stats Processing

        Scenario: Displaying Usage Stats from Tracker in the REST API
            Given that usage stats exist for a DOI
             When a user visits to the enpoints '/dois/{doi-name}'
             Then the user should be able to see the usage stats counts in the response

        Scenario: Displaying Usage Stats from Tracker in the GrapQL API
            Given that usage stats exist for a DOI
             When a user visits to the endpoint '/graphql' and makes a query for a viewsCount or downloadsCount
             Then the user should be able to see the usage stats counts in the response

        Scenario: Displaying Usage Stats from Tracker in the Data metrics badge
            Given that usage stats exist for a DOI
             When a user visits a page that include the Data metrics badge for that DOI
             Then the user should be able to see the usage stats counts in the badge

        Scenario: Displaying Usage Stats from Tracker in the EventData API
            Given that usage stats exist for a DOI
             When a user visits to the enpoints '/events/doi={doi-name}'
             Then the user should be able to see the usage stats counts as events in the response

        Scenario: Displaying Usage Stats from Tracker in Fabrica
            Given that usage stats exist for a DOI
             When a user visits to the Usage Tracking Dashboard Tab
             Then the user should be able to see the usage stats in different views.

        Scenario: Displaying Usage Stats from Tracker in SUSHI Reports
            Given that usage stats exist for a Repository on a given month
             When a user visits to the enpoint '/reports/{report-id}'
             Then the user should be able to download a usage report (SUSHI JSON) 

```


## Non Functional Requirements

- As an repository admin, I would like the collected usage stats were available, in the different interfaces, within 10 days after the end of month of collection.

## Feature Flag

This feature is implemented behind the `usage-processing-service` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

## Technical Feasibility

There are a few open questions about technical feasibility:

- How can plausible be used display usage stats? 
- How can relaiably process usage stats according to the CoP and produce similar stats as with the weblogs processing?
