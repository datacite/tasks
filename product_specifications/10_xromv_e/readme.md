
## Problem

There is no way to claim DOI and visualize which DOIs have been already claimed to someone's ORCID Record in DataCite Commons.

Problem Validation: 

Addresses: https://github.com/datacite/tasks/issues/26

## Proposed Solution 

Add ORCID Claiming and DOIs claims to DataCite Commons.
- [Wire Frame](https://www.figma.com/file/XY0mHdFJAqI0WkGAdBo3JJ/ORCID-Claiming?node-id=243%3A1)
- Solution Validation: 

## User Stories

### CRITICAL
- [ ] As a logged user, I would like to see which DOIs I can claim into my ORCID Record so that I can add those DOIs to my ORCID record.
- [ ] As a logged user, I would like to remove my ORCID claims so that if I make a mistake claiming a DOI, I can correct it.
- [ ] As a logged user, I would like to be able to claim DOIs into my ORCID record so that I can improve my ORCID record.
- [ ] As a user, I would like to claim the process follows a clear define set of steps, so I don't get confused about the state of my claims.

### Detailed User Stories

[Detailed User Stories File](detail.feature)

## Feature Flag

This feature is implemented behind `orcid-claiming` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

## Non Functional Requirements

- [ ] As a logged user, I would like to have a near-instantaneous response on the success of my claiming or unclaiming actions.
- [ ] As a logged user, I would like that the "Updating Claim" status had a lifespan of the order of minutes, so I can continue working without worrying about the state of the Claim.
- [ ] As a user, I would like the UI to claim DOIs follow the default Commons style and usability elements.

