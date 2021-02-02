
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

- [ ] As a Datacite staff, I would like to be able set a member inactive directly from fabrica, so I don't have to worry about any other consequences of the transition to inactivity.
- [ ] As a Datacite staff, I would like that DOIs from a inactive member were resolving to their url as long as the ulr is the correct, so that we can keep the P in PIDs.
- [ ] As a Datacite staff, I would like that DOIs from a inactive member have no access to DataCite service offerings, so that to not incurr in resourcing to support inactive memeber DOIs.
- [ ] As a Datacite staff, I would like that DOIs from a inactive member to be link checked periodically, to be able to take action when the link is rotten or the content has drifted
- [ ] As a Datacite staff, I would like that DOIs from a inactive member to be automatically set to a tombstone page when the link is link is rotten, so that we can keep the quality of the DOIs.

## IMPORTANT



### Detailed User Stories

[Detailed User Stories File](detail.feature)

## Feature Flag

This feature is implemented behind `inactive-workflow` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

## Non Functional Requirements

- [ ] As a datacite service user, I would like to have access to documentation that explain the inactive workflow process, so I know what's happening



