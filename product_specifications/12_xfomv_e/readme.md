
## Problem

Sometimes members or consortium organizations choose to discontinue their use of DataCite DOI services, this results in inactive repositories and management of the DOIs. We currently have 56 inactive repositories, which includes 449,514 DOIs in Fabrica that are no longer managed by members. This was largely due to the transition in the membership model and we continue to work with these organizations to find solutions. 


Problem Validation: 

closes: https://github.com/datacite/tasks/issues/46

## Proposed Solution 

Use an inactive workflow with a series of features to deal with the departing members.

- [Wire Frame]()
- Solution Validation: 

## User Stories

### CRITICAL

- [ ] As a Datacite staff, I would like to be able set a repository inactive directly from fabrica, so I don't have to worry about any other consequences of the transition to inactivity.
- [ ] As a Datacite staff, I would like that DOIs from a inactive repository were resolving to their urls as long as the urls are the correct, so that we can keep the P in PIDs.
- [ ] As a Datacite staff, I would like that DOIs from a inactive repositories have no access to DataCite service offerings, so that to not incurr in resourcing to support inactive repository DOIs.

## IMPORTANT

- [ ] As a Datacite staff, I would like to see link check statistics graphically for an inactive repository.
- [ ] As a Datacite staff, I would like to select all broken DOIs for an inactive repository and set to a tombstone page.
- [ ] As a Datacite staff, I would like that DOIs from a inactive repository to be set to a tombstone, so that we can keep the quality of the DOIs.
- [ ] As a Datacite staff, I would like to recieve summary email to support, listing the link check statistics for inactive repositories.

### Detailed User Stories

[Detailed User Stories File](detail.feature)

## Feature Flag

This feature is implemented behind `inactive-workflow` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as Generally Available in production.

## Non Functional Requirements

- [ ] As a datacite service user, I would like to have access to documentation that explain the inactive workflow process, so I know what's happening



