Feature: deactivation of repository

        Background:
            Given that a Consortium Lead or Member cannot find a suitable host

        Scenario: Fabrica de-activation
            Given that a staff_admin user is in the Consortium Lead or Member
             When the user select in-active
             Then the member and all its repositories are to be labeled un-active in both Fabrica and the REST API
              And all the DOIs of the member should be set to 'registered'
              And all the url of all DOIs of the member should be set to a thombstone page

Feature: Thombstone page for DOIs of inactive clients

        Background:
            Given that a Consortium Lead or Member has been set inactive
              And that the DOI was set to 'registered' state by inactive workflow

        Scenario: landing on thombstone page
             When a DOI from the inactive repository is resolved to its thombstone page
             Then the resolution should lead the user to the open Fabrica page (last metadata)
              And DOI Fabrica page should include a [Non-Maintained] Label

Feature: Other Services effects

        Background:
            Given that a Consortium Lead or Member has been set inactive
              And that the DOI was set to 'registered' state by inactive workflow

        Scenario: content negotiation request
             When a DOI from the inactive repository is requested for content negotiation
             Then the content negotiation service should return nothing

        Scenario: Commons/Search request
             When a DOI from the inactive repository is requested for Commons/Search/Fabrica
             Then the Commons/Search service should render nothing

        Scenario: EventData request
             When a DOI from the inactive repository is requested in Eventdata
             Then the Eventdata service should return all the connections that DOI has

        Scenario: Researcher Profile request
            Given that a Researcher Profile has DOIs form an inactive repository claimed into its record
             When the  Researcher Profile is requested
             Then the Researcher Profile service should render the list of DOIs including inactive DOIs
              And inactive DOIs should include their last metadata state
              And inactive DOIs should include the label [Non-Maintained]
              And inactive DOIs should not be linkable
