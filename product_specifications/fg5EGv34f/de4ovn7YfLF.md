# Fabrica Improvements 2022

## Problem/Idea

We have been collecting feedback about potential improvements in Fabrica that can help users in the way they use Fabrica.

## Proposed Solution 

This set of users stories represents the synthesis of all those improvements. The fall in two main categories:

- Help indicators for users
- Ease the flow of usual actions.


- [WireFrame](https://www.figma.com/file/ume5zbfFlcTTaFncbBS0VJ/Fabrica-Improvements?node-id=0%3A1)


Solution validation: 

All the features were proposed by the users.


## Acceptance Criteria

```cucumber

Feature: Create DOI from any page

        Scenario: The user is a client-admin and wants to create a new DOI
            Given that the user is a client-admin
             When when the user land in any tab of Fabrica
             Then a "Create new DOI" button should be shown in the left side bar above all other button
             And the button should link to the corresponding DOI form
             
        Scenario: The user is not a client-admin
            Given that the user is not a client-admin
             When when the user land in any tab of Fabrica
             Then the "Create new DOI" button should not be shown in any place


Feature: Home Landing page

        Scenario: The user has logged in
            Given the user has used correct credentials
             When the user has logged in
             Then the user should be redirected to the info tab
             And the info tab should show the Role of the user
             And the info tab charts and role display should be right-aligned


Feature: Autosuggest input Format

        Scenario: Adding Format using auto suggest
            Given that the user is in the DOI form
             When the he user is entering data in the Format input
             Then the input field should suggest format based on the inputed data
              And the suggested values should be based on the IANA media types https://www.iana.org/assignments/media-types/media-types.xhtml
              and the Format input help test should read: "The default format scheme is provided by the IANA Media Types. https://www.iana.org/assignments/media-types/media-types.xhtml"

        Scenario: Selecting Format using auto suggest
            Given that the user is in the DOI form
              And the user entered some value in the Format input field
             When the user selected one of the suggested values
             Then the FORMAT input field should be filled with the "Name" value from the IANA media types
              And the FORMAT value to be sent should be the "Template" value from the IANA media types

        Scenario: Ignoring Format auto suggest
            Given that the user is in the DOI form
              And the user entered some value in the Format input field
             When the user ignored the suggested values
             Then the FORMAT input field should allow the user to enter its new value into the field

Feature: Fabrica help messages

        Scenario: Visit the DOI form
            Given that user is correctly authenticated
             When visiting the DOI form
             Then the URL input help text should read: "Should be a https URL – within the allowed domain(s) of your repository if domain restrictions are enabled in the repository settings. Http and ftp are also supported. For example http://example.org"
              And the Creator input help text should read: "Use name identifier expressed as URL. Uniquely identifies an individual or legal entity, according to various schemas, e.g. ORCID, ROR or ISNI. The Given Name, Family Name and Name will automatically be filled out for ORCID and ROR identifiers."

        Scenario: Visit the DOI List page
            Given that user is correctly authenticated
             When visiting the DOI List page
             Then the Search input in-cell help text should read: "Type to search. For example 10.4121/17185607.v1"

Feature: DOIs List sorting

        Scenario: Visit the DOI List page
            Given that there are DOIs in the List
             When the user clicks on the sorting options
             Then a "Sort alphabethically" option should show up
              And when selecting "Sort alphabethically"
             Then the DOI list should be sorted by its first title.

Feature: New Logo

        Scenario: user goes to Fabrica
            Given user visit Fabrica
             When visiting any fabrica page
             Then the new Fabrica Logo should appear instead of the "Datacite Fabrica" title

Feature: Register DOIs into the future

        Scenario: User want to create a DOI a few years into the future
            Given user visit DOI form
             When enters a publication Year that is future 
             Then the new Fabrica Logo should allow the user to save the doi

Feature: Render LAtex Formulas correctly

        Scenario: the user views metadata with Latex math syntax
            Given the DOI metadata available includes Latex math syntax in the Title or description
             When the user visit a page with the DOI metadata 
             Then the the page should render  Latex math syntax metadata correctly

Feature: Add terms to controlled vocabularies

        Scenario: User is updating/adding repository software
            Given the user is editing/creating a repository
              And the user is opening the dropdown menu for the software
             When the dropdown is openned
             Then the dropdown vocabulary should include "OPUS" as a selecteable option
              And the dropdown vocabulary should include "Pubman" as a selecteable option

        Scenario: User is updating/adding member organisation type
            Given the user is editing/creating member
              And the user is opening the dropdown menu for the organisation type
             When the dropdown is openned
             Then the dropdown vocabulary should include "International Organization" as a selecteable option


Feature: Remove Profile pages from Fabrica

        Scenario: user tries to visit a profile page using the address bar (https://doi.datacite.org/users/{ORCID})
            Given user tries to visit a profile page in fabrica 
             When the user enters the profile page directly in the address bar 
             Then the user should be redirected to a 404

        Scenario: user tries to visit a profile page in fabrica (e.g. https://doi.datacite.org/users/{ORCID}) from the Fabrica interface
            Given user tries to visit a profile page in fabrica 
             When clicks on a profile like in the DOI metadata 
             Then the user should be redirected to Commons page for the same ORCID (https://commons.datacite.org/orcid.org/{ORCID})

```


https://doi.datacite.org/users/0000-0003-3484-6875



## Non Functional Requirements

- [ ] As a product designer, I would like the following html element to have a ID so that we can track selection in our analytics platform.
 - In the "create new DOI" button



## Feature Flag

This feature is implemented behind `fabrica-2022` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag in order to publish the feature as GA.


