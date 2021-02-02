Feature: Creating metadata with schema 4.4 using the API

        Scenario: creating a new DOI
            Given that user has the correct user name and password
              And it has provided metadata in following schema 4.4
             When the user deposit metadata using the API
             Then the API should accept the new values for the 'resourceTypeGeneral' property
              And the API should accept the new values for the 'classificationCode' sub-property
              And the API should accept the new values for the 'relationType' sub-property
              And the API should accept the new values for the 'relatedItem' property and all its sub-properties


        Scenario: creating a updating an existing DOI to schema 4.4
            Given that user has the correct user name and password
              And that the user has provided metadata in following schema 4.4
              And that exisiting DOI is previous compatible version
             When the user deposit metadata using the API
             Then the API should accept the new values for the 'resourceTypeGeneral' property
              And the API should accept the new values for the 'classificationCode' sub-property
              And the API should accept the new values for the 'relationType' sub-property
              And the API should accept the new values for the 'relatedItem' property and all its sub-properties
              And the API should accept save the metadata deposit with schema version 4.4

Feature: Adding relatedItem information to a new DOI in Fabrica

        Scenario: User want to add relatedItem to the a new DOI
            Given that user is logged in Fabrica
             When the user visits the DOI Form page
             Then the user would be able to add 'resourceTypeGeneral' following schema 4.4
              And the user would be able to add 'relationType' sub-property following schema 4.4
              And the user would be able to add the 'relatedItem' property
              And the user would be able to add the 'relationType' sub-property for 'relatedItem'
              And the user would be able to add the 'relatedItemType' sub-property for 'relatedItem'
              And the user would be able to add the 'relatedItemIdentifier' property
              And the user would be able to add the 'relatedItemIdentifierType' property
              And the user would be able to add the 'title' sub-property for 'relatedItem', but not other 'titles' subproperties
              And the user would be able to add the 'volume' sub-property for 'relatedItem'
              And the user would be able to add the 'issue' sub-property for 'relatedItem'
              And the user would be able to add the 'number' sub-property for 'relatedItem', but not its subproperties
              And the user would be able to add the 'publicationYear' sub-property for 'relatedItem'
              And the user would be able to add the 'creatorName' sub-property for 'relatedItem', but not other 'creator' subproperties
              And the user would be able to add the 'contributorName'  and 'contributorType' sub-property for 'relatedItem', but not other 'contributor' subproperties


