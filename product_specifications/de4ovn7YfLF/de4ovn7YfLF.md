## Problem/Idea

There’s growing interest in finding good ways to report on scholars’ openness. 

We can show the distribution of the data of licenses of the DOIs but that just showing raw data. It is not coveying any useful information to the Commons visitor. 

Problem/Idea validation: https://jlsc-pub.org/articles/abstract/10.7710/2162-3309.1025/

## Solution 

Create an Open Access Badge, similar to that of ImpactStory, that [transform](https://danielmiessler.com/blog/difference-data-information-intelligence/) the `data` into useful `information` to the Commons visitor.

Mock up: https://profiles.impactstory.org/about/achievements

Solution validation: [This approach has been pioneered in other researcher profiles such as ImpactStory](https://blog.ourresearch.org/what-level-of-open-access-scholar-are-you/)

## User Stories

### CRITICAL
- [ ] **As a user with a profile**, I like that visitors of my profile get an clear idea of about the openess of my research **So that** they can be aware of my level of openess.

### IMPORTANT
- [ ] **As a user with a profile**, I .. **So that** ...

### NICE-TO-HAVE
- [ ] **As a user**, I .. **So that** ...

## Feature Flag

This feature is implemented behind `open-access-badge` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag in order to publish the feature as GA.
<!-- Read more [Feature flags in development of GitLab](https://docs.gitlab.com/ee/development/feature_flags/) -->

## Non Functional Requirements

- [ ] **As a user**, I expect the that the computation of the degree of openess is consistent and cannot be tampered with, **So that** I can trust the information that it displays.


