## Problem

There are is not a way to visulise the top co-authors of a particular researcher.

Problem validation: [This issue has been dicussed in the context of FREYA as a something that the PID Graph should provide.](https://github.com/datacite/freya/issues/26).

## Solution 


Display a list of top five of co-authors of a particular researcher.

- [WireFrame]()

 Solution Validation: This feature is present in many other [researcher profiles](https://docs.google.com/document/d/1tQcBpUOi4kg1Gvluvc3dDvhGaVxi2CpmTxZG4U9W1Vw/edit).

## User Stories

### CRITICAL
- [ ] As a user, I want to know the top five the co-authors of a particular researcher, so that I can analyse the network of the researcher's collaborations.
- [ ] As a user, I want to be able to navigate to the profile of the top five the co-authors of a particular researcher, so that I can explore their profiles.

## Non Functional Requirements

- [ ] As a user, I expect the UI of the top co-author list to follows Commons style and usability.

## Feature Flag

This feature is implemented behind the `top-co-author-list` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

