## Problem

Manually Modifying HTML tags is complicated for mere-mortal users that are not genuinely familiar with coding.

## Solution

The builder page allows the repository/users to modify the badge without changing the widget tags manually and generate a snippet with the correct HTML tags. This is a widely used approach used by other widgets https://docs.google.com/document/d/1v3VE9EjtGorEQwCKQLEpmNZogrYNzYR6UnSHqx8JdeE/edit#/ 


Further details and wireframe: https://docs.google.com/document/d/1yqkbQRZKkcumRglPXOemZabjaxNz4lWKRcCh8ancUJE/edit#heading=h.xl0ivbbyvf05

## User Stories

### CRITICAL
- [ ] As a widget integrator, I would like an easy to use builder page to customize the widget so that I can integrate it quickly into my system. 
- [ ] As a widget integrator, I would like an easy way to generate and customize the widget to integrate it easily into my system. 


### IMPORTANT
- [ ] As an integrator, I would like the builder page to have options to customize the type of widget, the DOI, and the type of metrics it should display so that I can customize those parameters.

### NICE-TO-HAVE
- [ ] As a user, I would like the builder page to have copy snippet functionality to make the process faster.

## Feature Flag

This feature is implemented behind the `widget-builder-page` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.
<!-- Read more [Feature flags in development of GitLab](https://docs.gitlab.com/ee/development/feature_flags/) -->

## Non Functional Requirements

- [ ] As a user, I expect the code snippet generation to be instantaneous to use it quickly.
- [ ] As a user, I hope the builder page to follow the default Datacite style and usability guidelines.


## Planned PRs
