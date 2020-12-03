Feature: Open Access Badges
              Everybody wants to know when it's Friday

        Scenario: Open Hero Badge
            Given that every single one of the profilee resources is free to read online.
             When visiting the profilee page
             Then Display a "Open Hero" Badge

        Scenario: Open License Badge
            Given n% of profilee resources has a CC-BY, CC0, or public domain license.
             When visiting the profilee page
             Then Display a "Open License" Badge

        Scenario: Open Science Triathlete Badge
            Given that the profilee resources has an Open Access paper, open dataset, and open source software
             When visiting the profilee page
             Then Display a "Open Science Triathlete" Badge

        Scenario: Open Access Badge
            Given n% of profilee resources is free to read online.
             When visiting the profilee page
             Then Display a "Open Access" Badge