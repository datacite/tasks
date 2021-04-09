## Problem/Idea

There’s growing interest in finding good ways to report on scholars’ openness. 

We can show the distribution of the data of licenses of the DOIs but that just showing raw data. It is not coveying any useful information to the Commons visitor. 

Problem/Idea validation: https://jlsc-pub.org/articles/abstract/10.7710/2162-3309.1025/

## Proposed Solution 

Create an Open Access Badge, similar to that of ImpactStory, that [transform](https://danielmiessler.com/blog/difference-data-information-intelligence/) the `data` into useful `information` to the Commons visitor. 

Potentially the open access metric that is computed would need to be stored as a value for the researcher/individual/person.

Wireframe: https://www.figma.com/file/LX0jHl9chHKvv430swTpwm/open-access-badge?node-id=243%3A1


Solution validation: 

- [This approach has been pioneered in other researcher profiles such as ImpactStory](https://blog.ourresearch.org/what-level-of-open-access-scholar-are-you/).
- Finally, we ran a [validation with users](https://docs.google.com/forms/d/1p3DnS796Se1IFE3rwx_f3VX7GQo1PCKpVTMbxsALR1U/edit#responses)


## User Stories

### CRITICAL
- [ ] **As a user with a profile**, I like that visitors of my profile get an clear idea of about the openess of my research **So that** they can be aware of my level of openess.
- [ ] **As a user with a profile**, I would like the visitors to get a grasp of my different types of openess **So that** I cannot be categorized in one single dimension of openess.


## Feature Flag

This feature is implemented behind `open-access-badge` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag in order to publish the feature as GA.
<!-- Read more [Feature flags in development of GitLab](https://docs.gitlab.com/ee/development/feature_flags/) -->

## Detailed User Stories

```cucumber
Feature: Open Access Badges in DataCite Commons

        Scenario: Open Hero Badge
            Given that every single one of the researcher associated DOIs have metadata with rights as CC-BY, CC0, or public domain license.
             When visiting the researcher page
             Then Display a "Open Hero" Badge on the researcher page

        Scenario: Open License Badge
            Given n% of the researcher's associated DOIs have metadata with rights as CC-BY, CC0, or public domain license.
             When visiting the researcher page
             Then Display a "Open License" Badge on the researcher page

        Scenario: Open Science Triathlete Badge
            Given that the researcher's associated DOIs have metadata with rights has an Open Access paper, open dataset, and open source software
             When visiting the researcher page
             Then Display a "Open Science Triathlete" Badge on the researcher page

        Scenario: Open Access Badge
            Given n% of researcher's associated DOIs have metadata with contentUrl accessible without restrictions.
             When visiting the researcher page
             Then Display a "Open Access" Badge on the researcher page

        Scenario: Not Open Access Badge
            Given that a researchers associated DOIs do not generate any badge
             When visiting the researcher page
             Then the whole section of achievements should not be visible

```



## Non Functional Requirements

- [ ] **As a user**, I expect that the computation of the degree of openess is consistent and cannot be tampered with, **So that** I can trust the information that it displays.
- [ ] **As a user**, I expect the badge to appear as soon as the page loads **So that** visitors do not have to wonder what the result of badge computation is.
- [ ] **As a product designer**, I would like the badge to use standard icongraphy when possible.
  - https://thenounproject.com/search/?q=superhero&i=2227044 open hero, open license
  - https://thenounproject.com/search/?q=open+access&i=3261458 open access
  - https://thenounproject.com/search/?q=science+journal+computational&i=1885778 triatlethe


## Technical Feasibility 

How to query all DOIs with certain license.

```graphql
{
  person(id:"https://orcid.org/0000-0003-3484-6875"){
    works(first:100, query:"rightsList.rightsIdentifier:\"cc-by-3.0\" && creators.nameIdentifiers.nameIdentifier:\"https://orcid.org/0000-0002-8099-7538\""){
      licenses{
        id
        count
      }
    }
  }
}


```



