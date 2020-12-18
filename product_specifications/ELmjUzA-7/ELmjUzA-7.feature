Feature: Suggested subject-area-classification for repository

        Scenario: Repository get suggested subject-area-classification from re3data metadat
            Given that the repository has not defined a subject-area-classification
              And that the repository has a re3data Id
              And the re3data id has one or many subject-area-classification in its record
             Then the repository field for subject-area-classification should be populated for as many subject-area-classifications as the re3data record has
              And the suggested subject-area-classifications should be mapped to OECD list
              And the suggested subject-area-classification should be displayed in the input field in Fabrica

Feature: Repository defines its subject-area-classification field

        Scenario: Repository adds/delete/updates its subject-area-classification field in Fabrica
            Given that the repository has a suggested or defined subject-area-classification field
              And the user is logged into fabrica as client admin
             When the user adds/updates/removes the subject-area-classification field for the repository
             Then the subject-area-classification field in the repository metadata must change accordingly

