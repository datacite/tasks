
## Problem


## Proposed Solution 

Repository search in Commons will support:
Show links to works/organizations/people
Display re3data repository information where they exist
We will be using DataCite local repository identifiers in Commons to connect to other PIDs within the PID graph.


- [Wire Frame](https://www.figma.com/proto/8xRL8uhipz0UYNePwfizHy/Repository-Search?node-id=2%3A5707&scaling=min-zoom )

## User Stories

### CRITICAL

- [ ] As a user, I would like to search for repositories by their name
- [ ] As a user, I would like to see repositories by an organization.
- [ ] As a user, I would like to see related outputs for a given repository.
- [ ] As a user, I would like to see basic repository metadata eg: name, description, repository URL, subjects
- [ ] As a user, I would like to be able to find who has been depositing data for a given repository.

### IMPORTANT

- [ ] As a FAIRsFAIR user, I would like to search for trustworthy (certified) repositories.
- [ ] As a FAIRsFAIR user, I would like to search for DOIs by filtering for trustworthy (certified) repositories.
- [ ] As a FAIRsFAIR user, I would like to see additional repository metadata, including:
  - Certifications
  - Data is openly accessible
  - Licensing
  - Persistent Identifiers usage
  - Repository Type
  - link to re3data
- [ ] As a AGU (American Geophysical Union) user, I would like to find repositories that allows for upload and provide DOIs

### NICE TO HAVE

- [ ] As a researcher, I would like to find repositories that meet certain criteria
- [ ] As a AGU user, I would like to find community recommended repositories
- [ ] As a FAIRsFAIR user, I would like to find community recommended repositories


Phase 2:

- API to retrieve dois for a mapped re3data repository
- Process to add links to re3data where they don’t exist
- Explore PIDs like ROR in the re3data metadata

Phase 3:

- Explore process for linking between other repositories to Commons
- FAIRSharing
- COAR
- RRID
- OpenDOAR
- References
- Repository Identifiers
- Repository PID quiz at PIDapalooza
- FAIRsFAIR WP4 T4.4 Registry for FAIR repositories description of work


### Detailed User Stories

```cucumber


```

## Feature Flag

This feature is implemented behind `repository-finder` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

## Non Functional Requirements

