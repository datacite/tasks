
## Problem


## Proposed Solution 

Repository search in Commons will support:
- Separate repository search tab
- Show links to works/organizations/people
- Display re3data repository information where they exist

We will be using DataCite local repository identifiers in Commons to connect to other PIDs within the PID graph.


- [Wire Frame](https://www.figma.com/proto/8xRL8uhipz0UYNePwfizHy/Repository-Search?node-id=2%3A5707&scaling=min-zoom )

## User Stories

### CRITICAL

- [ ] As a user, I would like to search for repositories by their name. For example: 
  - A researcher searching for a repository to deposit data
  - A librarian helping a student to find a repository to find relevant research outputs
- [ ] As a user, I would like to see repositories by an organization. For example 
  - A researcher searching for repositories supported by their organization 
  - A repository manager of an organisation making sure their repositories are available for discovery 
- [ ] As a user I would like to filter repositories by their capabilities. For example:
  - A researcher searching for repositories that allow data deposits
- [ ] As a user, I would like to see related outputs for a given repository. For example:
  - A repository manager creating reports
  - A funder looking for impact of the repository they are funding
- [ ] As a user, I would like to see basic repository metadata eg: name, description, repository URL, subjects
- [ ] As a user, I need to be sure that all found repository related information is up to date and correct.


### IMPORTANT

- [ ] As a user, I would like to search for trustworthy (certified) repositories [FAIRsFAIR requirement].
- [ ] As a user, I would like to search for digital objects referenced by DOIs by filtering for trustworthy (certified) repositories [FAIRsFAIR requirement].
- [ ] As a user, I would like to search for FAIR-aligned repositories [FAIRsFAIR requirement]
- [ ] As a user, I would like to see additional repository metadata, including:
  - Certifications
  - Data is openly accessible
  - Licensing
  - Persistent Identifiers usage
  - Repository Type
  - link to re3data
- [ ] As a user, I would like to find repositories that allows for upload and provide DOIs [American Geophysical Union (AGU) requirement]


### NICE TO HAVE

- [ ] As a researcher, I would like to find repositories that meet certain criteria
- [ ] As a user, I would like to find community recommended repositories [American Geophysical Union (AGU) requirement]
- [ ] As a user, I would like to find community recommended repositories [FAIRsFAIR requirement]
- [ ] As a user I would like to filter repositories by their long term perspective (certification).



### Detailed User Stories

```cucumber


```

## Feature Flag

This feature is implemented behind `repository-finder` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

## Non Functional Requirements

