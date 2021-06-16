# Public REST Versioning Strategy 

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
- https://ez.datacite.org, all paths 
- https://api.datacite.org, paths:
  - /works
  - /clients
  - /users

## User Stories


```cucumber

Feature: API versioning Strategy

        Scenario: A new API version was released
            Given that breaking changes are expected to be introduced in the API.
            When that breaking changes are introduced into the public interface of the API
            Then a new path for the new version of the API should be created accessible.

Feature: Changelog File

        Scenario: Looking for changes in the API version
            Given that a API version has been announced
            When the user looks into the changelog file
            Then the changelog file should include an accumlative list of changes.

Feature: deprecation Custom header

        Scenario: Responses to calls to a API that is to be deprecated
            Given that a API has been announced to be deprecated
            When the user make a call tho a API 
            Then response header should include the Custom header 'X-Datacite-API-Deprecated-Reason'  with a url linking to the changelog of the deprecation.

Feature: release candiate Custom header

        Scenario: Responses to calls to a API that is a release candidate
            Given that a API is a release candiate
            When the user make a call tho a API 
            Then response header should include the Custom header 'X-Datacite-API-Release-Candiate' with a url linking to the changelog of the announcing the release candiate

````


