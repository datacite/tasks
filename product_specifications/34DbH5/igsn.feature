
Feature: Repository exclusive for IGSN-DOIs

        Scenario: Creating a IGSN Catalogue in Fabrica
            Given that a user is creating a repository in Fabrica
             When the user chooses the repository type
             Then the  repository type field should show the 'IGSN Catalogue' option
             When the user selects 'IGSN Catalogue'
             Then a info message should be displayed reading: "This repository will only be able to mind IGSN-DOIs."
             When clicking create a new repository with type 'IGSN Catalogue' should be created.
 
        Scenario: Editing a IGSN Catalogue in Fabrica
            Given the repository is type IGSN Catalogue
             When the user is editing in the IGSN Catalogue edit form
             Then the repository type field should be disabled.
              And a tooltip should be shown when hovering over the field that read "IGSN Catalogues cannot be edited"

        Scenario: Editing a repository in Fabrica
            Given the repository is NOT type IGSN Catalogue
             When the user is editing in the repository edit form
             Then the  repository type form field should NOT show the 'IGSN Catalogue' option

Feature: Creating IGSN-DOI from an IGSN Catalogue

        Scenario: Creating/Editing a IGSN-DOI in any API
            Given the user is creating a DOI for a IGSN Catalogue
             When the user sends a payload for a DOI metadata
             Then the metadata resourceTypeGeneral should be set to 'PhysicalObject' by default
              And the record cretaed should include the field 'authority' set to 'igsn.org'
 
        Scenario: Creating/Editing an IGSN-DOI in Fabrica form
            Given the user is in the DOI form
              And the user is within a IGSN Catalogue
             When the user enter DOI metadata
             Then the resourceTypeGeneral input field should be disabled
              And a tooltip should be shown when hovering over the field that read "IGSN Catalogues can only mint PhysicalObject"
              And the resourceTypeGeneral default should be set to 'PhysicalObject'
              And the fabrica should set the metadata payload with the field 'authority' set to 'igsn.org'

 
Feature: IGSN Catalogue DOI Transfers

        Scenario: Transfering IGSN-DOI
            Given the repository is type IGSN Catalogue
              And the user is not a staff_admin
             When the user is the a IGSN-DOI page
             Then the 'Transfer DOI' button should be disabled.
              And a tooltip should be shown when hovering over the field that read "IGSN-DOIs cannot be transfered"

        Scenario: Transfering IGSN-DOIs
            Given the repository is type IGSN Catalogue
              And the user is not a staff_admin
             When the user is the a IGSN Catalogue Settings page
             Then the 'Transfer' button should be disabled.
              And a tooltip should be shown when hovering over the field that read "IGSN-DOIs cannot be transfered"

        Scenario: Transfering DOIs to a IGSN Catalogue
            Given the a user is inteding to Transfer DOIs from non IGSN Catalogue client
              And the user is in the transfer repository page (e.g. repositories/CLIENT-ID/transfer)
              And the user is not a staff_admin
             When the user is searching for repositories
             Then No IGSN Catalogue should be shown in the result box

Feature: Creating report of IGSN-DOIs

        Background: Obtaining a list of IGSN-DOIs
            Given there are DOI minted by a IGSN Catalogue

        Scenario: Obtaining a list of IGSN-DOIs from the API
             When the user makes a DOI query to our doi endpoint
              And includes the 'authority' flag set to  'igsn.org'
             Then our query should return a set of DOI metadata from IGSN-DOIs.

        Scenario: Obtaining a list of IGSN-DOIs from the Fabrica
              And the user is a staff_admin
              And the user makes a query for DOIs
             When the user facets by authority "IGSN.org"
             Then Fabrica should return a set of DOI metadata from IGSN-DOIs.

