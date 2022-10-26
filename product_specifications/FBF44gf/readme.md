# FAIR Visualisation in Organisation and DMP pages

## Problem

Development of a dashboard and further extension GraphQL API nodes building on connections made possible via the networked DMP that allows users to track connections between DMPs, investigators, outputs, organizations, research methods and protocols; and display citations throughout the research lifecycle. 


We determined that it is crucial that the Dashboard can be used to prepare or directly support grant proposals for the NSF and the FSDs' obligation to provide reports to the Station hosting institution. In terms of granularity, we identified that annual distributions are enough to support reporting. Additionally, it was also indicated that lists of abstracts and total production numbers are the main indicators that are needed for reporting. 


Problem validation: [A workshop](https://miro.com/app/board/uXjVOZtNNlI=/?share_link_id=611105669245) was carried out to validate the problem. We used a lighting workshop format to identify goals and challenges. Then the data was analyzed in terms of a data visualization framework and user stories were drawn from there. In a secondary call, we sat with all PIs and project leads a prioritized the [user stories](https://docs.google.com/document/d/1lJ6J-OuKiVSMTR_AoEVg_LirjufTBkAwqR4XbPfDQYA/edit).


## Solution 

To help administrators of organizations and data management plans in their activities to prepare materials to demonstrate the impact of a collection of work Datacite commons would include a set of features that would allow users to get access to all related content to ROR-ids and DMP-ids. 

Solution Validation: We conducted two validation sessions:
1. There was a validation session with end users of [DataCite Commons]()
2. There was a validation with stakeholders of [Datacite services]()

WireFrames: [Figma File](https://www.figma.com/file/zanat9GQIdxtqUUryMOGCh/FAIR-in-Commons?node-id=722%3A5486)


### Detailed User Stories

Detail the user stories providing the acceptance criteria. All user stories are ordered by priority. 


```cucumber



Feature: Getting all scholarly outputs linked to an organisation

        Scenario Outline: Getting all scholarly outputs linked to an organisation when creator.nameIdentifier.affiliantionIdentifier equals Organisation's ROR-Id

            Given there exist DOIs with creator.nameIdentifier.affiliantionIdentifier equals Organisation's ROR-Id,
             When that the user is in a Organisation Page
             Then the page should display a list of the  DOIs

        Scenario Outline: Getting all scholarly outputs linked to an organisation when reator.nameIdentifier equals Organisation's ROR-Id

            Given there exist DOIs with creator.nameIdentifier equals Organisation's ROR-Id,
             When that the user is in a Organisation Page
             Then the page should display a list of the  DOIs

        Scenario Outline: Getting all scholarly outputs linked to an organisation when contributor.nameIdentifier equals Organisation's ROR-Id

            Given there exist DOIs with contributor.contributorType equals "Sponsor"
              And with contributor.nameIdentifier equals Organisation's ROR-Id,
             When that the user is in a Organisation Page
             Then the page should display a list of the  DOIs

        Scenario Outline: Getting all scholarly outputs linked to an organisation when contributor.nameIdentifier.affiliantion equals Organisation's ROR-Id,

            Given there exist DOIs with contributor.contributorType equals "Sponsor"
              And with contributor.nameIdentifier.affiliantion equals Organisation's ROR-Id,
             When that the user is in a Organisation Page
             Then the page should display a list of the  DOIs


        Scenario Outline: Getting all scholarly outputs linked to a DMP linked to an organisation

            Given there exist DOIs with relatedIdentifierType equals "OutputManagementPlan",
              And the relatedIdentifier DMP has contributor.contributorType equals "Sponsor",
              And the relatedIdentifier DMP has relatedIdentifier contributor.nameIdentifier equals Organisation's ROR-Id,
             When that the user is in a Organisation Page
             Then the page should display a list of the  DOIs


Feature: Export all scholarly outputs linked to an organisation

        Scenario Outline: Display Export Menu

            Given there exist DOIs linked to an organisation
             When that the user is in a Organisation Page
             Then a export menu should be displayed in the left-side
              And the export menu should include a link to download Related Works, Funders and Abstracts link


        Scenario Outline: Export as related Works

            Given there exist DOIs linked to an organisation
             When that the user is in a Organisation Page
              And the user clicks on the "Related Works" download link
             Then the a file with all the all scholarly outputs linked to the organisation should be generated
              And the file should include up to 500 scholarly outputs
              And all the scholarly outputs should be formatted in APA style
              And the file should include one scholarly output per line
              And the browser should request the user to download the file

        Scenario Outline: Export as Abstracts

            Given there exist DOIs linked to an organisation
             When that the user is in a Organisation Page
              And the user clicks on the "Abstract" download link
             Then the a file with all the all scholarly outputs linked to the organisation should be generated
              And the file should include up to 500 scholarly outputs
              And all the scholarly outputs should be formatted in Title, YoP, DOI, description
              And the file should include one scholarly output per line
              And the browser should request the user to download the file


        Scenario Outline: Export as Funders

            Given there exist DOIs linked to an organisation
             When that the user is in a Organisation Page
              And the user clicks on the "Funders" download link
             Then the a file with all the all funders linked to the organisation should be generated
              And the file should include up to 500 funders
              And all the funders should be formatted in Title, DOI, description
              And the file should include one funder per line
              And the browser should request the user to download the file


Feature: Organisations Landing search Page Example
        Scenario: displaying example for the searching Organisation
             Given that the user is in a Organisations Landing search Page
             Then the page display the example info box
              And the info box includes a link to the search term of the "British Library"
              And the info box includes a link to the search ROR of the "British Library"

Feature: Organisations Chord Vizsulisation
        Scenario: displaying a Chord Vizsulisation in Organisations Landing Page
            Given there exist DOIs and ORCIDs linked to an organisation
             When the user is in a Organisations Landing Page
             Then a Chord chart should be displayed
              And the chart should show a node segment for Organisations, Datasets, People, Software, Publications, funders
              And the chart should show arc connections between Organisations and Datasets
              And the chart should show arc connections between Organisations and People
              And the chart should show arc connections between Organisations and Software
              And the chart should show arc connections between Organisations and Publications
              And the chart should show arc connections between Organisations and Funders
              And the arc connections size should be defined number of connections
              And the arc connections color should follow the 'PID color pallete'
              And the arc connections color should use the category of the Datasets, People, Software, Publications, funders
              And the chart should show a tooltip in on hover over the  arc connections that number of connections and the category, and PID Category
              And the Chord chart can have data up to 30 days old.

Feature: Summary Mesures Stats

            Given there exist DOIs linked to an organisation
             When that the user is in a Organisation Page
             Then a summary statistics should be displayed at the top of the page
              And the statistics should include number of outputs linked to an organisation
              And the statistics should include number citations of outputs linked to an organisation
              And the statistics should include number views of outputs linked to an organisation
              And the statistics should include number downloads of outputs linked to an organisation

Feature: Top authors and contributors list

        Scenario: Facet author profile page by co-author
            Given that the user is in a Organisation Page
              And that the Top authors and contributors list is being displayed
             When the user clicks on the checkbox of any of the top authors and contributors in the facet
             Then the list of works should be filtered by the authors or contributors ORCID

        Background: Facet authors and contributors
            Given that the user is in a Organisation Page
              And there exist DOIs linked to an organisation

        Scenario: with ORCIDs in DOI metadata
              And the DOIs have creators and/or contributors
              And the creators and/or contributors have nameIdentifiers of the type ORCID
             Then a facet with the authors and Contributors should be shown on the left-side bar face menu
              And the facet  should show an info icon
             When the user hovers over the info icon in co-authors list in the facet
             Then a message saying "This list includes only co-authors with ORCID ids." should be displayed in a tooltip.

        Scenario: with ORCID claim
              And the DOIs have ORCID claims in the system
             Then a facet with the authors and Contributors should be shown on the left-side bar face menu
              And the facet  should show an info icon
             When the user hovers over the info icon in co-authors list in the facet
             Then a message saying "This list includes only co-authors with ORCID ids." should be displayed in a tooltip.


Feature: Action Left-bar Menu

        Scenario: Showing actions left-side bar
            Given there exist DOIs linked to an organisation
             When that the user is in a Organisation Page
             Then the action left-side bar should be Showing
              And the Download Reports  menu should be Showing
              And the share widget should be Showing


Feature: 100% stacked bar chart

        Background: Displaying missing and other values
            Given that there is data to display a chart
             When the chart is being displayed

        Scenario: Display aggregated counts even for missing values
             When some of the aggregated results do not include metadata for the chart category
             Then the chart should display a bar to aggregate all the aggregated results that are missing
              And the bar should be labeled as "Missing"
              And the bar should be colored in "gray"

        Scenario: Display aggregated counts for categories that are not in the top 5
             When some of the aggregated results include more than 5 categories
             Then the chart should display a bar to aggregate all "other" categories that are not in the top 5 into the same bar
              And the bar should be labeled as "Other"
              And the bar should be colored in "black"


        Scenario: Displaying information about the charts
            Given that a user request for more information about a chart
             When the user click on the info icon
             Then a new window should be open.
              And the page in the new window should include a static page with info about each graph (support page).

        Scenario: Displaying License chart
            Given there exist DOIs linked to an organisation
              And the DOIs have licenses in the metadata.
             When the user is in a Organisation Page
             Then a 100% bar chart should be displayed
              And it should include the top 5 licenses
              And the chart should show a tooltip in on hover that display the license and count
              And the chart should include a bottom legend with the licenses
              And the categories should follow the 'License color pallete'

        Scenario: Displaying RelatedIdentifier chart
            Given there exist DOIs linked to an organisation
              And the DOIs have RelatedIdentifier in the metadata.
             When the user is in a Organisation Page
             Then a 100% bar chart should be displayed
              And it should include the top 5 RelatedIdentifierTypes
              And the chart should show a tooltip in on hover  that display the RelatedIdentifierTypes and count
              And the chart should include a bottom legend with the RelatedIdentifierTypes
              And the categories should follow the 'PID color pallete'

        Scenario: Displaying Identifier chart
            Given there exist DOIs linked to an organisation
              And the DOIs have IdentifierType = DOI in the metadata.
             When the user is in a Organisation Page
             Then a 100% bar chart should be displayed
              And it should include the categories DOI, Others, Missing
              And the chart should include a bottom legend with the DOI, Others, Missing
              And the chart should show a tooltip in on hover that show count, category
              And the categories should follow the 'PID color pallete'

        Scenario: Displaying a Chart Insight Text on every chart
            Given that a chart has a top category
              And such cateogry is not '__missing__' or '__other__'
             When the chart is displayed
             Then a Chart Insight Text should be displayed on the top of the chart
              And the chart insight text should show numeric value of the category
              And the chart insight text should include the text related to the category

        Scenario: Displaying a Chart Insight Text  when the top category is  '__missing__' or '__other__'
            Given that a chart has a top category
              And such cateogry is '__missing__' or '__other__'
             When the chart is displayed
             Then a Chart Insight Text should be displayed on the top of the chart
              And the chart insight text should include the next higest category that is not '__missing__' or '__other__'

Feature: ORCID chart with 100% bar
        Scenario: Displaying NameIdentifier chart
            Given there exist DOIs linked to an organisation
              And the DOIs have NameIdentifierType = ORCID in the metadata.
             When the user is in a Organisation Page
             Then a 100% bar chart should be displayed
              And it should include the categories ORCID, Others, Missing
              And the chart should show a tooltip in on hover
              And the chart should include a bottom legend with the RelatedIdentifierTypes
              And the categories should follow the 'PID color pallete'


Feature: PIDs force directed network chart
        Scenario: Displaying PIDs force directed network chart
            Given there exist DOIs and ORCIDs linked to an organisation
             When the user is in a Organisation Page
             Then a force directed network chart should be displayed
              And the chart should show nodes for PIDs connected to the organisation
              And the chart should show links for relationshops between PIDs
              And the node color should follow the 'PID color pallete'
              And the chart should show a tooltip in on hover that show PID of the node, and the type of PID
              And the chart should show up to 100 nodes.



Feature: Metadata Table for DMPs

        Scenario Outline: Display Metadata Table
            Given there exist DOIs with relatedIdentifierType equals "OutputManagementPlan",
              And the relatedIdentifier DMP has contributor.contributorType equals "Sponsor",
              And the relatedIdentifier DMP has contributor.nameIdentifier equals Organisation's ROR-Id,
             When that the user is in a Organisation Page
             Then the page should display a list of the  DMPs in the Organisation page

Feature: Download Metadata button

        Scenario Outline: Download Metadata
            Given the user is in a DMP Landing search Page
             When that the user is in the download Metadata button
             Then the a modal should pop up
              And the modal should include links to all the formats in which DMP DOI metadata can be downloaded


Feature: Contributors/Creators Sankey Vizsulisation
        Scenario: displaying a Sankey Vizsulisation in DMP Landing search Page
            Given there exist Contributors or creators linked to the DMP with ORCIDs
             When the user is in a DMP Landing search Page
             Then a Sankey chart should be displayed
              And the chart should show a three line sets Name, ContributorType, ResourceTypeGeneral
              And the chart should show the Name line set with the name of the ORCIDs linked to resources linked to the DMP
              And the chart should show the ContributorType line set with the types of contribution of the ORCIDs linked to resources linked to the DMP
              And the chart should show the ResourceTypeGeneral line set with the resourceTypeGeneral of the resources linked linked to the DMP
              And the width segment size should be defined number of connections between two adjacent line sets
              And the width segment color should follow the 'ResourceType color pallete'
              And the chart should show a tooltip in on hover over the segment connections that number of connections and the category
              And the chart should highlite the segment of the corresponding segments on hover over the Name-ContributionType segment
              And the chart should highlite the segment of the corresponding segments on hover over the ResourceTypeGeneral-ContributionType segment






Feature: PID Color pallete
paletteer_d("ggthemes::Classic_Green_Orange_6")

Feature: ResourceType Color pallete
paletteer_d("ggsci::category20_d3")

Feature: License Color pallete
paletteer_d("ggthemes::Tableau_20")


```

## Non Functional Requirements


- As a product designer, I would like the following HTML element to have an ID so that we can track selection in our analytics platform.
  - Download report links


## Feature Flag

This feature is implemented behind the `fair-viz` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

## Technical Feasibility



### Feasibility Check: Organisations Chord Vizsulisation GraphQL call

```gpl
{
  publications {
    organizationConnectionCount
  }
  datasets {
    organizationConnectionCount
  }
  softwares {
    organizationConnectionCount
  }
  OutputManagementPlans {
    organizationConnectionCount
  }
  preprints {
    organizationConnectionCount
  }
  organizations {
    totalCount
  }
}
```

###  Feasibility Check: Works Chord Vizsulisation GraphQL call

```gpl
{
  publications {
    personConnectionCount
    organizationConnectionCount
  }
  datasets {
    personConnectionCount
    organizationConnectionCount
  }
  OutputManagementPlans {
    personConnectionCount
    organizationConnectionCount
  }
  preprints {
    personConnectionCount
    organizationConnectionCount
  }
  softwares {
    personConnectionCount
    organizationConnectionCount
  }
  people(query: "*") {
    totalCount
  }
  organizations {
    totalCount
  }
}

{
  publications {
    totalCount
    datasetConnectionCount
    softwareConnectionCount
    personConnectionCount
    organizationConnectionCount
    funderConnectionCount
  }
  datasets {
    totalCount
    softwareConnectionCount
    personConnectionCount
    organizationConnectionCount
    funderConnectionCount
  }
  softwares {
    totalCount
    personConnectionCount
    organizationConnectionCount
    funderConnectionCount
  }
  people(query: "*") {
    totalCount
    organizationConnectionCount
  }
  organizations {
    totalCount
    personConnectionCount
  }
  funders {
    totalCount
    datasetConnectionCount
  }
}
```

### Feasibility Check: Person Chord Vizsulisation GraphQL call

```gpl
{
  publications {
    personConnectionCount
  }
  datasets {
    personConnectionCount
  }
  OutputManagementPlans {
    personConnectionCount
  }
  preprints {
    personConnectionCount
  }
  softwares {
    personConnectionCount
  }
  people(query: "*") {
    totalCount
  }
}

```


###  Feasibility Check: Force-directed Vizsulisation GraphQL call

```ruby

dmp_ids = Event.query(dois: $RORID, citation_type: "OutputManagementPlan-Organisation" relation_type:"is-sponsored-by")
ids = Event.query(dois: dmp_ids.pluck(:ids))
p =  [ids, dmp_ids]
dois = DOI.query(p)

```

```gpl

 {
  OutputManagementPlans(organisation:"assddd1232"){
    nodes {
      doi
      titles {
        title
      }
      publicationYear
      publisher
      creators {
        familyName
        givenName
      }
			events{
        nodes{
          id
          titles{
            title
          }
          citationCount
        }
      }
    }
  }
}

```




### Feasibility Check: Sankey Vizsulisation GraphQL call

```ruby

dois = Event.query(dois: $DMPID, citation_type: "OutputManagementPlan-DOI",)
metadata = DOI.query(dois.pluck(:ids))



persons-events = Event.query(dois: dois.pluck(:ids), citation_type;"Person-ScholalrlyArticle, Person-Dataset")



```

```gpl

 {
  works(doi:"10.233/32s/assddd1232"){
    nodes {
      doi
      titles {
        title
      }
      publicationYear
      publisher
      creators {
        familyName
        givenName
      }
			events{
        nodes{
          id
          titles{
            title
          }
          citationCount
        }
      }
    }
  }
}

