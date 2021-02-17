## Problem

User feedback has indicated that the researcehr profile has proven unsatisfactory in two specifica areas (1) response time and (2) confusion over tabbed navigation on a item page.


Problem validation: [A survey was conducted via our AGU partners to gather feedback of the researcher profile features](https://docs.google.com/document/d/1cbi_GxL79cmMFewaj3kZ57EBJtOEzmodAMTciCIhbKc/edit#heading=h.yddq5ssbuhv8)

## Proposed Solution 

A series of solutions are here proposed:

**Response time problems**

Reduce reponse time to acceptable web standards for individual item pages. 

Solution Validation: [After 1 second, users get impatient and notice that they're waiting for a slow computer to respond. The longer the wait, the more this impatience grows; after about 10 seconds, the average attention span is maxed out. At that point, the user's mind starts wandering and doesn't retain enough information in short-term memory to easily resume the interaction once the computer finally loads the next screen.](https://www.nngroup.com/articles/powers-of-10-time-scales-in-ux/)


**Navigation Problems**

- Separate "Search on Page" from website navigation. and set search on page together with the filter facets.

- [WireFrame](https://www.figma.com/file/L1z8E4vwQbcN7txinDKYGt/parsec-search?node-id=1%3A5719)

Solution Validation: We collected UX feedback using 3 questions survey with 4 users (Including PARSEC lead) and two other competing solutions. The search on the side bar was the highest ranked.

## User Stories

### CRITICAL
- [ ] As a user, I would like the pages for DOI/ORCID/ROR identifiers to load in less than 10 seconds, so that I don't leave the page without seeing the results.

- [ ] As a user, I would like a filter works box to search the list of resources in a Researcher Profile page, so that I can find items.

## Non Functional Requirements

- [ ] As a user, I expect the reponse time to be under 10 seconds


## Feature Flag

This feature is implemented behind the `parsec-feedback` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

