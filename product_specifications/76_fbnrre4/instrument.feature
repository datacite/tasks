
Feature: Instrument Metadata display
        Scenario: View the instrument metadata and citations
            Given that there are DOIs with resourceType Instrument
              And the user enters a DOI name in the instrument ID box
             When the a user clicks GO for a given instrument DOI
             Then the metadata of the instrument should be displayed
              And the DOI metadata display should be presented in APA style
              And the DOI citations counts should be displayed

Feature: Data that used an Instrument
        Scenario: View all the datasets used by a give instrument DOI
            Given that there are DOIs with resourceType Instrument
              And that there are DOIs with resourceTypeGeneral Dataset
              And there are relations between these type of the type isCompiledBy
              And the user enters a DOI name in the instrument ID box
             When the a user clicks GO for a given instrument DOI
             Then all the links to DOIs with resourceTypeGeneral Dataset should displayed
              And the DOI display should be presented in APA style

Feature: Publications that used an Instrument
        Scenario: View all the JournalArticle used by a give instrument DOI
            Given that there are DOIs with resourceType Instrument
              And that there are DOIs with resourceTypeGeneral JournalArticle
              And there are relations between these type of the type IsReferencedBy
              And the user enters a DOI name in the instrument ID box
             When the a user clicks GO for a given instrument DOI
             Then all the links to DOIs with resourceTypeGeneral JournalArticle should displayed
              And the DOI display should be presented in APA style

Feature: Instrument connections list and histogram
        Scenario: View all the connections to a given instrument DOI
            Given that there are DOIs with resourceType Instrument
              And there are relations of any type to the instrument
              And the user enters a DOI name in the instrument ID box
             When the a user clicks GO for a given instrument DOI
             Then all the links to DOIs
              And the DOI display should be presented in APA style
              And a histogram of all the links should be displayed

