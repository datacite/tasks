
## Problem

There is no way to claim DOI and visualize which DOIs have been already claimed to someone's ORCID Record in DataCite Commons.

Problem Validation: 

Addresses: https://github.com/datacite/tasks/issues/26

## Solution 

Add ORCID Claiming and DOIs claims to DataCite Commons.
- [Wire Frame](https://www.figma.com/file/XY0mHdFJAqI0WkGAdBo3JJ/ORCID-Claiming?node-id=243%3A1)
- Solution Validation: 

## User Stories

### CRITICAL
- [ ] As a logged user, I would like to see which DOIs I can claim into my ORCID Record so that I can add those DOIs to my ORCID record.
- [ ] As a logged user, I would like to remove my ORCID claims so that if I make a mistake claiming a DOI, I can correct it.
- [ ] As a logged user, I would like to be able to claim DOIs into my ORCID record so that I can improve my ORCID record.

- [ ] As a non-logged user, I would like to see links to the person page of DOIs that have been claimed using search and link so that I can follow through the links.
- [ ] As a user, I would like to claim the process follows a clear define set of steps, so I don't get confused about the state of my claims.


### NICE-TO-HAVE
- [ ] As a logged user, I would like to be able to claim DOIs and add my contributor-role to the Claim to specify my contribution.
- [ ] As a logged user, I would like to be able to claim DOIs directly from the worklist, so I don't need to click to go to the DOI page to claim a DOI.

## Feature Flag

This feature is implemented behind `orcid-claiming` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.
<!-- Read more [Feature flags in development of GitLab](https://docs.gitlab.com/ee/development/feature_flags/) -->

## Non Functional Requirements

- [ ] As a logged user, I would like to have a near-instantaneous response on the success of my claiming or unclaiming actions.
- [ ] As a logged user, I would like that the "Claim waiting" status had a lifespan of the order of minutes, so I can continue working without worrying about the state of the Claim.
- [ ] As a user, I would like the UI to claim DOIs follow the default Commons style and usability elements.
- [ ] As a product designer, I would like that the Claiming buttons be visible to the user on arrival to the DOI page so that users do not need to scroll to find the functionality. Insight: More than 60% of the Common's users have a screen resolution that will satisfy requirements then [scroll to see claiming functionality](https://analytics.google.com/analytics/web/#/savedreport/nCDFZOa8SOeOXMQvx90NMw/a22806196w244715860p227694677/_u.date00=20200901&_u.date01=20201125).

