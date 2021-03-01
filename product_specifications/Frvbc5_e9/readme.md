## Problem

There are is not a way to visualize the top co-authors of a particular researcher.

Problem validation: [This issue has been discussed in the context of FREYA as something that the PID Graph should provide.](https://github.com/datacite/freya/issues/26).

## Solution 

Display a list of the top five co-authors of a particular researcher.

 [WireFrame](https://www.figma.com/file/JZXYSUc6ZofDBlFmUzNHQG/PARSEC_new-features?node-id=0%3A1)

 Solution Validation: In our researcher, we have seen this feature is present in many other [researcher profiles](https://docs.google.com/document/d/1tQcBpUOi4kg1Gvluvc3dDvhGaVxi2CpmTxZG4U9W1Vw/edit). We also run a [validation with users have good] results(https://docs.google.com/forms/d/1p3DnS796Se1IFE3rwx_f3VX7GQo1PCKpVTMbxsALR1U/edit).

## User Stories

### CRITICAL
- [ ] As a user, I want to know the top five co-authors of a particular researcher so that I can analyze the network of the researcher's collaborations.
- [ ] As a user, I want to be able to navigate to the profile of the top five co-authors of a particular researcher so that I can explore their profiles.
- [ ] As a user, I expect the UI of the top co-author unnumbered list to include a maximum of 5 co-authors' names.

### IMPORTANT
- [ ] As a user, I want a list of top co-authors to be listed by a number of resources they have co-authored so that I can differentiate the most popular collaborator at the top of the list.

### NICE TO HAVE
- [ ] As a user, I want a list of top co-authors to display the quantity of co-authored resources together with the name of the co-author so that I can quickly know how many resources have been co-authored with the co-author 

## Detailed User Stories

```cucumber
Feature: Top co-author list

        Scenario: Navigate to authors with Top co-author list
            Given that the user is in a researcher profile page
              And that a the profile has some resources related to other authors
              And that the authors ORCIDs are available
             When the user clicks on any of the top co-authors list
             Then the user should be redirected to the co-author page

```

## Non Functional Requirements

- [ ] As a user, I expect the UI of the top co-author list to follows Commons style and usability.
- [ ] As a user, I expect the top co-author list to be displayed on the page within seconds of landing on the page.
## Feature Flag

This feature is implemented behind the `top-co-author-list` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

### Feasibility Checks

- How to get all the co-authors of a Person?

```graphql
{
  person(id:"https://orcid.org/0000-0003-3484-6875"){
    works(first:100){
      nodes{
        creators{
          id
        }
      }
    }
  }
}
```

- How can one filter by co-author?

```graphql
{
  person(id:"https://orcid.org/0000-0003-3484-6875"){
    works(first:100 query:"creators.nameIdentifiers.nameIdentifier:\"https://orcid.org/0000-0002-8099-7538\""){
      nodes{
        creators{
          id
        }
        contributors{
          id
        }
      }
    }
  }
}

```

