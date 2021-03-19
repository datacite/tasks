## Public REST Versioning Strategy 

## Problem

Our API is getting versionied but we dont know expose/follow a clear strategy of how we do versioning.

## Solution 

Display a list of the top five co-authors of a particular researcher.

As up today that would be:

Relese Candiate
- REST Version 3



 [API Versioning at DataCite Documentation](/support_doc.md)

 Solution Validation: We run a feedback session with a number REST API users and gather their feedback.




## User Stories


```cucumber

Feature: deprecation header

        Scenario: Responses to calls to a API that is to be deprecated
            Given that a API has been announced to be deprecated
             When the user make a call tho a API 
             Then response header should include the Custom header 'X-Datacite-API-Deprecated-Reason'  with a url linking to the changelog of the deprecation.

Feature: release candiate header

        Scenario: Responses to calls to a API that is a release candidate
            Given that a API is a release candiate
             When the user make a call tho a API 
             Then response header should include the Custom header 'X-Datacite-API-Release-Candiate' with a url linking to the changelog of the announcing the release candiate

````


