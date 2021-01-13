Feature: Open Access Badges in DataCite Commons

        Scenario: Open Hero Badge
            Given that every single one of the researcher associated DOIs have metadata with rights as CC-BY, CC0, or public domain license.
             When visiting the researcher page
             Then Display a "Open Hero" Badge on the researcher page

        Scenario: Open License Badge
            Given n% of the researcher's associated DOIs have metadata with rights as CC-BY, CC0, or public domain license.
             When visiting the researcher page
             Then Display a "Open License" Badge on the researcher page

        Scenario: Open Science Triathlete Badge
            Given that the researcher's associated DOIs have metadata with rights has an Open Access paper, open dataset, and open source software
             When visiting the researcher page
             Then Display a "Open Science Triathlete" Badge on the researcher page

        Scenario: Open Access Badge
            Given n% of researcher's associated DOIs have metadata with contentUrl accessible without restrictions.
             When visiting the researcher page
             Then Display a "Open Access" Badge on the researcher page

        Scenario: Not Open Access Badge
            Given that a researchers associated DOIs do not generate any badge
             When visiting the researcher page
             Then the whole section of achievements should not be visible