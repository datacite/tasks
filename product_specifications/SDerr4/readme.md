# Public REST Versioning Strategy and Version 3

## Problem

Our API is getting versionied but we dont know expose/follow a clear strategy of how we do versioning.
## Solution 

We are documentating our [API Versioning strategy](/support_doc.md) and including a set of features that should help developers to identify the version they are using.

Solution Validation: We run a feedback session with a number REST API users and gather their feedback.


As up today that would be:

Relese Candiate
- https://api.datacite.org paths:
  - /v3/dois
  - /v3/repositories
  - /v3/organisations

For Deprecation
- https://api.datacite.org, paths:
  - /works
  - /clients
  - /users

## User Stories

- As datacite staff, I would like that Fabrica and "Content Negotiation" is adapted to the new version changes so that we don't have problems reported by members.
- As datacite staff, I would like that REST API V3 were to be released as release candiate following the [API Versioning strategy](/support_doc.md).

```cucumber

Feature: API versioning Strategy

        Scenario: A new API version was released
            Given that breaking changes are expected to be introduced in the API.
            When that breaking changes are introduced into the public interface of the API
            Then a new path for the new version of the API should be created accessible.

Feature: Changelog File

        Scenario: Looking for changes in the API version
            Given that a new API version has been released
            When the user looks into the changelog file
            Then the changelog file should include an accumlative list of changes.

Feature: deprecation Custom header

        Scenario: Responses to calls to a API endpoint that is to be deprecated
            Given that a API endpoint has been announced to be deprecated
            When the user make a call the API endpoint 
            Then response header should include the Custom header 'X-Datacite-API-Deprecated-Reason'  with a url linking to the changelog of the deprecation.

Feature: release candiate Custom header

        Scenario: Responses to calls to a API endpoint that is a release candidate
            Given that a API endpoint is a release candiate
            When the user make a call the API endpoint 
            Then response header should include the Custom header 'X-Datacite-API-Release-Candiate' with a url linking to the changelog of the announcing the release candiate


Feature: Depraction of Endpoints in V3

        Scenario: API user goes to /v3/clients or /v3/users or /v3/providers or /v3/members endpoint 
            Given that a API call is made to /v3/clients or /v3/users or /v3/providers or /v3/members
            When a API call is made to /v3/clients or /v3/users or /v3/providers or /v3/memberss
            Then the API reponse be 404 should include the message "The resource you are looking for doesn't exist."

Feature: Depraction of Endpoints in V2

        Scenario: API user goes to /clients or /users or /providers or /members endpoint 
            Given that a API call is made to /v3/clients or /v3/users or /v3/providers or /v3/members
            When a API call is made to /v3/clients or /v3/users or /v3/providers or /v3/memberss
            Then the API reponse be 404 should include the message "The resource you are looking for doesn't exist."
            And the API reponse should include the custom header "X-Datacite-API-Deprecated-Reason" with the value "https://github.com/datacite/lupo/blob/main/CHANGELOG.md#New-schema"


Feature: DOI Endpoints for V3

        Scenario: Retrieve DOI metadata
            Given that an API call is made using the path /v3/dois/{doi}
            When a API reponse is recalled
            Then the API reponse  won’t show “container” property
            And the API reponse would show the “Related item” property 
            And the API reponse would show the other schema 4.4 properties
            And the API reponse should include the custom header "X-Datacite-API-Release-Candiate" with the value "https://github.com/datacite/lupo/blob/main/CHANGELOG.md#New-schema"

        Scenario: API user goes to /v3/dois (collection) endpoint
            Given that a API call is made to /dois (collection)
            When a API call is made to /dois (collection)
            Then the API reponse should not include aggregations
            And the API reponse should include the custom header "X-Datacite-API-Release-Candiate" with the value "https://github.com/datacite/lupo/blob/main/CHANGELOG.md#New-schema"


````

## Non Functional Requirements

- As API user, I would like that all versioning changes were published in the documentation so that I have a reference to follow.
- As API user, I would like that a changelog of the API versions were published so that I can be aware of the changes included in the new API version

## Feature Flag

This feature is implemented behind the `version-three` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

## Technical Feasibility

The some of the changes are already imlplemented 

- https://api.datacite.org/v3/clients
- https://api.datacite.org/v3/repositories
