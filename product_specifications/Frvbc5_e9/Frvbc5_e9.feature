Feature: Top co-author list

        Scenario: Navigate to authors with Top co-author list
            Given that the user is in a researcher profile page
              And that a the profile has some resources related to other authors
              And that the authors ORCIDs are available
             When the user clicks on any of the top co-authors list
             Then the user should be redirected to the co-author page
