Feature: ORCID Claiming

        Scenario: Claim DOI
            Given that the user is logged-in
              And that the user is in single DOI page
              And that a the DOI on the page is not been claimed by the user himself
             When the user clicks on claim DOI
             Then the "Claim DOI" button should dissapear
              And the label "Updating Claim" should be shown
              And the DOI Claim should be sent to the ORCID profile as author role
              And after a few minutes the label "Remove Claim" should replace the previous label
              And the "Remove Claim" button shall be shown

        Scenario: Remove DOI Claim
            Given that the user is logged-in
              And that the user is in single DOI page
              And that a the DOI on the page has been claimed by the user himself
             When the user clicks on "Remove Claim"
             Then a pop-up request to confirm whether the user wants to remove the claim
             When the user clicks confirm
             Then the "Remove Claim" button should dissapear
              And the label "Updating Claim" should be shown
              And the request to Remove the Claim should be sent to the ORCID profile
              And after a few minutes the label "Claim DOI" should replace the previous label
              And the "Claim DOI" button shall be shown

        Scenario: Claim DOI or Remove DOI Claim attempt with response error
            Given that the user is logged-in
              And that the user is in single DOI page
              And the user clicks on "claim DOI" or "remove claim"
             When the reponse from ORCID Claim is not succesful
             Then the label "Claim Error" should replace the previous label
              And the "Claim DOI" or "Remove Claim" button be removed.
