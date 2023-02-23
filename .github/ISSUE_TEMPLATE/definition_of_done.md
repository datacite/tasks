---
name: Definition of Done
about: Create a definition of done for a feature or change
title: ''
labels: 'definition_of_done'
assignees: ''

---


# DOD:

To complete this DOD both the lead developer that code the feature needs to review and validate every item in the "Development checklist" has been completed and its working correctly. Note: automated test are not enough to tell a feature is working correctly. 
After the "Development checklist" is completed the designer must review and validated every item in "Product Engineering Checklist".


### Development Checklist
- [ ] Passed through peer review see Pull Request Guidelines
- [ ] Unit, integration, and system tests that all pass on the CI.
- [ ] Regressions and bugs are covered (where relevant) with tests that reduce the risk of the issue happening again.
- [ ] Reviewed by relevant reviewers and all comments are addressed.
- [ ] Confirmed to be working in the stage environment with no new Sentry errors.
- [ ] Write an ADR (when relevant).
- [ ] Confirmed that user stories are met:
    - {user stories}
    - {detailed user stories}


### Product Engineering Checklist
- [ ]  Confirmed that user stories are done:
    - {user stories}
    - {detailed user stories}
- [ ] Feature Flag has been removed. (where relevant)




