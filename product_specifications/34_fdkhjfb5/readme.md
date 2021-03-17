
# Create REST API records from Salesforce

## Problem

Creating New Members Account is a manual process that requires syncing between Saleforece and REST API (Fabrica). Every time a new user is account is neeed the staff needs to go to create accounts in both Fabrica and Saleforce. Simplying this workflow would reduce the time the Membership staff spends in onboardings.

Addresses: https://github.com/datacite/datacite/issues/1109

## Proposed Solution 

The REST API has all the functionality needed to manage members, repositories and soon also contacts via API calls. This is how Fabrica works, and an external developer could do exactly the same, e.g. when integrating with Salesforce.


## User Stories

### CRITICAL

1. As a Saleforce Manager, I would like that when a Member application is approaved in Saleforce a Member account is generate in Fabrica (Production), So that I do not spend time on generating it manually.
1. As a Saleforce Manager, I would like that when a Opportunity is created in Saleforce a Member account is generated in Fabrica (Test), So that I do not spend time on generating it manually.


### Detailed User Stories


```cucumber

1. Feature: Automatic Member Account Creation

        Scenario: Automatic Member Account Creation in Production
            Given that a Member application exisit in Saleforce
             When a Member application is approaved in Salesforce
             Then a call to the Production instace API should be triggered https://api.datacite.org
             And the call's payload should follow the REST API specification 
             And the call should include Fabrica ID, date created, date last updated, and date deleted.

        Scenario: Automatic Test Member Account Creation
            Given that a opporunity has been created in Salesforce
             When a opporunity has been created in Salesforce
             Then a call to the Test instace API should be triggered https://api.test.datacite.org
             And the call's payload should follow the REST API specification 
             And the call should include Fabrica ID, date created, date last updated, and date deleted.
```

## Non Functional Requirements

- [ ] When using the REST API they client should make sure that the response was succesfull (200).
- [ ] When te response is unsuccesful it should trigger a slack message to DataCite.


## Technical Fesiability

Documentation of the API can be found in our documentation together with the [API reference](https://support.datacite.org/reference/introduction).

- How to create a member?

```json
{
    url: 'https://api.test.datacite.org/providers',
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
    body: {
      data: {
        attributes: {
          symbol: "symbol",
          name: "name",
          displayName: "displayName",
          systemEmail: "systemEmail",
          passwordInput: "passwordInput",
          confirmPasswordInput: "confirmPasswordInput",
        },
        type: 'providers',
      },
    },
  }



```



