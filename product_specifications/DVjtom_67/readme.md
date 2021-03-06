# Usage Stats Processing as a Service Specification

## Problem

Repositories lack the technical infrastructure to be sending this information regularly via the usage API. 

Problem validation: [This is at the core of the MDC, and many users have voiced its](https://datacite.productboard.com/roadmap/2537097-development-journey/features/7041967/detail) as well as in the previous [survey](https://zenodo.org/record/3476545#.YIBZ36kzZUI). 

## Solution 

We aim to provide a Tracking Code (similar to GoogleAnalytics) that can be embedded in repository landing pages that forward for views and downloads counts to our Usage Stats Processing Service.  

WireFrames: [Figma File](https://www.figma.com/file/Fd54mIb3WVYqQfw3KQmp68/SAAS-Processor?node-id=0%3A1)

Solution Validation: [We run a feedback session with potentially interested user. These, were users that had reached Datacite in the past about processing usage using the code of practice but they found the processing heav yresource intensive for their organisations. The overall feedback is that the solution solved their needs](https://jamboard.google.com/d/1Z2eFVp2St-fKx9bQemYuB25zDfRjaBHMT2jTBizYR6Y/viewer)

## User Stories

### CRITICAL
- [ ] As a repository admin, I would like the tracking snippet snippet to be as easy to install as a google analytics tracker, so I don't need to incur additional technical infrastructure or developing resources.
- [ ] As a repository admin, I would like the tracking snippet snippet not to incur any GDPR breaches, So that I don't have to implement any consent policy.
- [ ] As a repository admin, I would like to have access to Fabrica's usage tracking directly, so I have a quick overview of the Usage when administrating my DOIs.
- [ ] As a bibliometrician, I would like the processing service to process usage according to the COUNTER code of practice, So I can compare usage stats from using this method with other usage stats collected from other methods (SUSHI reports).
- [ ] As a bibliometrician, I would like the collected usage stats were available via the Datacite GraphQL API to run my data analysis in Jupiter notebooks and scripts.
- [ ] As a repository admin, I would like that the tracker were able to collect usage from all my repository DOIs, independetly of their url, so I do not have to configure the tracker per domain.

### IMPORTANT

- [ ] As a repository admin, I would like the collected usage stats were available via the REST API, GraphQL, and data metrics badge, So that my usage stats can be distributed to the web.
- [ ] As a repository admin, I would like to have access to a tracker code directly from Fabrica, So I don't have to go to any other place to configure my usage stats processing.
- [ ] As a repository admin, I would like to enable and configure the usage tracking directly from Fabrica, So I don't have to go to any other place to configure my usage stats processing.

### NICE TO HAVE

- [ ] As a repository admin, I would like the collected usage stats were available as SUSHI Reports (JSON) in the DataCite API (/reports) So that we can audit the monthly usage stats if we need it to do it.

### Detailed User Stories

```cucumber

Feature: Usage Stats Tracker Installation

        Scenario: Installing the Usage stats tracker correctly
            Given that the user has a Usage stats tracker snippet
              And that the user has access to a source code of a repository with DOIs  
              And the user includes the Usage stats tracker snippet with the correct DOI name in the landing pages' source code
              And the repository is deployed to the web
              When a third party visits the landing page with the tracking CODE correctly embedded.
             Then the tracking CODE should trigger a call to the DataCite Usage Stats Processing Service.
              And the triggered call should include all data needed for usage stats processing. 

Feature: Getting the Usage stats tracker snippet

        Scenario: Activating the Usage stats tracking
            Given that a Repository admin is logged into Fabrica
             And the Repository admin is in the update usage settings form 
             When fills in the time zone tracking fields.
             And clicks enable usage settings
             Then a unique "tracker id" that identifies the repository should be generated
             And a site tracking should be created in the  Usage stats processing service, using the "tracker id" as `data-domain`.
             And the embed code for a [Embed dashboard](https://plausible.io/docs/visibility) should be generated
             And the tracker snippet for the repository should be generated 
             And the tracker snippet should include the repositry "tracker-id"
             And a new Tab, named Usage Tracking Dashboard, should be available in Fabrica 
             And the embed dashboard should be available in the Usage Tracking Dashboard tab 
             And the tracker snippet for the repository should be visible on the repository settings page

        Scenario: Deactivating the Usage stats tracking
             Given that a Repository admin is logged into Fabrica
             And the Repository admin is in the update usage settings form 
             When clicks disable usage settings
             Then a site tracking should be deleted in the  Usage stats processing service.
             And the Usage Tracking Dashboard tab should be not accessible in Fabrica 
             And the tracker snippet for the repository should be not visible on the repository settings page

        Scenario: Getting the Usage stats tracker snippet in Fabrica
            Given that a Repository admin is logged into Fabrica
             And that it has activated Usage stats tracking
             When that user click the settings tab
             Then the would-be a non-editable field named USAGE-STATS TRACKER snippet
              And the content of the field should be the repositories usage stats tracker snippet
              And the snippet should have a copy button function just to copy the content of the snippet.

Feature: Tracking Multiple Domains per repository

        Scenario: The DOIs of a single repository (/clients) have URLs with multiple domains and/or subdomains
            Given that the tracking snippet is set with the repository 'tracking id' in a landing page
             When a new usage event is triggered
             Then the tracking snippet will send the usage analytics 
             And the usage analytics should be camptured as part of the repository 'tracking id' independtly of which domain is in the URL
             And the usage analytics should be shown in the repository dashboard independtly of which domain is in the URL

Feature: Detecting DOI names in landing pages

        Scenario: DOI name is stated as an attribute in the tracking snippet
            Given that the tracking snippet in a landing page has the DOI stated as an attribute
             When a new usage event is triggered
             Then the tracking snippet will send the usage information as if it were for the DOI name stated in the attribute

        Scenario: DOI name is not stated as an attribute in the tracking snippet
            Given that the tracking snippet in a landing page has NOT the DOI stated as an attribute
             When a new usage event is triggered
             Then the tracking snippet will look to detect the DOI name in page-embedded (1) schema.org or (2) DublinCore metadata, or (3) the URL of the page.
             And send the usage information as if it were for the DOI name detected

        Scenario: DOI name is not to be found anywhere
            Given that the tracking snippet has found the DOI name nowhere on landing page 
             When a new usage event is triggered
             Then the tracking snippet will return the error 'You need to add the DOI name into your tracking snippet' message to console
             And it will NOT send the usage information 

Feature: Usage Stats Processing Service 

        Scenario: Receiving usage stats from the Tracker for existing DataCite DOIs
            Given that Stats Processing Service received the analytics from the Tracker
             When the end of the month arrives.
             Then the processor must process the analytics following the COUNTER Code of Practice for Research Data.
             And the processor must generate a JSON SUSHI report of the stats by repository with the following metrics types:
                unique-investigations-regular
                unique-requests-regular
                total-investigations-regular
                total-requests-regular
             And processor must send the JSON SUSHI report to the REST API '/reports'

        Scenario: Receiving usage stats from the Tracker for non-Datacite DOIs (transfer or malformed)
            Given that Stats Processing Service received the analytics from the Tracker
             When data is sent to the processor
             And the DOI name is not in our index.
             Then the processor must discard the data.
             And it must return a message error to the Tracker saying: "This DOI doesn't exist, Usage stats cannot be processed".

        Scenario: DOI and URL do not match Handle registry
            Given that Stats Processing Service received the analytics from the Tracker
             When URL and DOI do not match as they should in the Handle registry
             Then the processor must discard the data.
             And it must return a message Error to the Tracker saying: "This DOI doen't match this URL, Usage stats cannot be processed".

Feature: Accessing Usage Stats Processing

        Scenario: Displaying Usage Stats from Tracker in the REST API
            Given that usage stats exist for a DOI
             When a user visits the endpoints '/dois/{doi-name}'
             Then the user should be able to see the usage stats counts in the response

        Scenario: Displaying Usage Stats from Tracker in the GrapQL API
            Given that usage stats exist for a DOI
             When a user visits the endpoint '/graphql' and makes a query for a viewsCount or downloadsCount
             Then the user should be able to see the usage stats counts in the response

        Scenario: Displaying Usage Stats from Tracker in the Data metrics badge
            Given that usage stats exist for a DOI
             When a user visits a page that include the Data metrics badge for that DOI
             Then the user should be able to see the usage stats counts in the badge

        Scenario: Displaying Usage Stats from Tracker in the EventData API
            Given that usage stats exist for a DOI
             When a user visits to the endpoints '/events/doi={doi-name}'
             Then the user should be able to see the usage stats counts as events in the response

        Scenario: Displaying Usage Stats from Tracker in Fabrica
            Given that usage stats exist for a DOI
             When a user visits to the Usage Tracking Dashboard Tab
             Then the user should be able to see the usage stats in different views.

        Scenario: Displaying Usage Stats from Tracker in SUSHI Reports
            Given that usage stats exist for a Repository on a given month
             When a user visits the endpoint '/reports/{report-id}'
             Then the user should be able to download a usage report (SUSHI JSON) 

```


## Non Functional Requirements

- As an repository admin, I would like the collected usage stats were available, in the different interfaces, within 10 days after the end of the month of collection.

## Feature Flag

This feature is implemented behind the `usage-processing-service` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

## Technical Feasibility

There are a few open questions about technical feasibility:

- How can plausible be used display usage stats? 
- How can reliably process usage stats according to the CoP and produce similar stats with weblogs processing?


### How to track multiple domains per repository

There are too many repositories that [use multiple domains](https://docs.google.com/spreadsheets/d/1Ia4vwf22FdzyyplBhxr7-6YXlM9ESjULlOMbTVxUdhU/edit#gid=1733702900) the and default config in plausible needs mutliple configurations for that which would make user seeting very comples. However plausible there seems to be a [workaround](https://github.com/plausible/analytics/issues/440) that involved using an ID instead of a domain.