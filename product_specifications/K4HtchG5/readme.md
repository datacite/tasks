# Bibliometrics Dashboard

## Problem


There has not been a strong acceleration of both researcher and bibliometrics interest in assessing data sharing and data metrics. 

Problem validation: [There is been moderated interest from our members but defientely there is a need of providing something simpler to access metrics.](https://portal.productboard.com/datacite/1-roadmap-2021/c/68-bibliometrics-dashboard?utm_medium=social&utm_source=portal_share). A [survey](https://zenodo.org/record/3476545#.YVrRHUZBxjx) from 2019 shown that Institutional repositories receive more requests for metrics but they cannot expose them due to lack of resourcing.

## Solution 

To catalyze researcher and bibliometrics interest and work in assessing data sharing and data metrics, DataCite will build a bibliometrics dashboard that visualizes key basic bibliometrics indicators. The dashboard will be publicly accessible, and the underlying data will be available via an open API. This accessibility should allow  any interested bibliometrician or open science researcher to utilize this corpus for their own studies.


Solution Validation: We had two different [validation session](https://jamboard.google.com/d/1570Iyedc2KCawhfvEPninaxQm3NwOL6j3AlZCWG6YGk/viewer) with successulf results. Comments about two additiona lfeatures were collected. First, display of aggregated counts with missing metadata; this has been included in the initial spec. And second, [display metrics as ratios](https://jamboard.google.com/d/1DGVljRNH9WGbxX7TIBqjAEpeK54GdTpwlPh3ms4oGbk/viewer). This seconds feature is to be considerer in other releases.


WireFrames: [Figma File](https://www.figma.com/proto/lvxXKfiyVVvoe3nGvfk9yq/MDC-Dashboard?page-id=762%3A7953&node-id=783%3A9515&scaling=min-zoom)


## User Stories

- As a repository admin, I would like to access bibliometrics `distributed` by ranges of counts, so that I can make sense of the `composition` of repository/organisation/member/prefix have 0, a few ,dozens, hundrers bibliometric counts.
- As a repository admin, I would like to access bibliometrics `distributed` by entities (e.g. repository/organisation/member/prefix) so that I see the `composition` of  bibliometric counts to entity.
- As a repository admin, I would like to access bibliometric counts brokendown by FOS, Language, Resource Type, and license, so that I can `compare` which among the given catorgies.
- As a repository admin, I would like a way to select predefined time periods for the visualisations, so I don't have to make complex queries to filter for a specific period.
- As a repository admin, I would like a way to select the entities to be presented in the visualisations, so I can see only the information that is important to me.
- As a repository admin, I would like to be able to export/display data from charts in a tabular form, so I can reuse it to make other analysis or vizulisations.
- As a dashboard user, I would like the dashboard to present tooltips on hovering, so I can get acces to data that might not be clear for the visuzliation itself.
- As a bibliometrician, I would like the dashboard to present aggregations of missing values for categories, so I can get a transparent view of the ratios of full metadata.


### Detailed User Stories

```cucumber

Feature: Export data 

       Scenario: Click Export Data
            Given that user is a dashboard page
            When the user clicks export data
            Then a CSV file must be generated with the data currently filterred by the Dashboard
            And the CSV file must contain
            And the CSV file must contain a column for metric/Document count
            And the CSV file must contain a column for series label
            And the CSV file must contain a column for category label 

Feature: Chart/Table widget 

        Scenario: Display tables only
            Given that user is a dashboard page
            When the user clicks tables pill
            Then all the data should be displaye in a tabular form rather than a chart form
            And the Tables pill should be active    
            And each table must show a column for metric/document count
            And each table must show a column for series label
            And each table must show a column for category label 

        Scenario: Display charts only / Default
            Given that user is a dashboard page
            When the user clicks chart pill
            Then all the data should be displaye in a chart form rather than a tabular form
            And the Chart pill should be active   

Feature: Time interval widget

        Scenario: Filtering time span for DOI Counts
            Given that user is a dashboard page
            When the user clicks in the time filter {3Y}
            Then the a {3 year} filter term should be added to the current filter query
            And Commons should trigger a Call to Update the dashboard
            And the dashboard should be updated with the reponse
            And the dashboard views that shows DOI counts should include only DOIs registered in the last {1 year}     

        Scenario: Filtering time span for Metrics Counts
            Given that user is a dashboard page
            When the user clicks in the time filter {3Y}
            Then the a {3 year} filter term should be added to the current filter query
            And Commons should trigger a Call to Update the dashboard
            And the dashboard should be updated with the reponse
            And the dashboard views that shows Metrics (vies/downloads/citations) should include only counts from DOIs registered last {3 year}  

        Scenario: Default Selection
            Given that user is a dashboard page
            When the has not clicked any time filter
            Then the the 1 year filter term should be added to the current filter query
            And the dashboard views that shows Metrics (vies/downloads/citations) should include only counts from DOIs registered last {1 year}  
            And the dashboard views that shows DOI counts should include only DOIs registered in the last {1 year}     

Feature: Series Widget

        Scenario: Adding an extra series to the dashboard
            Given that user is a dashboard page
            When the user found a Hit in is search 
            And the user clicks Add
            Then the ID of the hit found should be added to the current query as a filtered item
            And Commons should trigger a Call to Update the dashboard
            And the facet should include the hit added by the user

        Scenario: Removing a series from the dashboard 
            Given that user is a dashboard page
            When the user found a Hit in is search 
            And the user clicks Exclude or uncheck the face box
            Then the ID of the hit found should be removed to the current query as a filtered item
            And Commons should trigger a Call to Update the dashboard
            And the facet should exclude the hit excluded by the user

        Scenario: Selecting only one series
            Given that user is a dashboard page
            When the user clicks in the numering value of the facet
            Then the ID of the selected quantity is added to query filter
            And all others IDs are removed fro mthe query filter
            And Commons should trigger a Call to Update the dashboard
            And the facet should include the ID selected by the user

        Scenario: Selecting all Series
            Given that user is a dashboard page
            And only a few IDs are in the current query as a filtered items
            When the user clicks in the All button
            Then all the IDs from the current query filter should be removed
            And Commons should trigger a Call to Update the dashboard
            And the facet should include the top 10 IDs with more resources all selected

        Scenario: Selecting none of the Series
            Not possible; it will default to All series

Feature: Metrics Qty. distribution stacked chart bar

        Scenario: Display metrics and a few series is selected
            Given that user is a dashboard page
            When selects a few items in the series
            Then the chart should display metrics counts distributed by quantity (0,1,10,100,1000)
            And the chart should display the series stacked in the chart
            And the chart should display the data in vertical bar chart fashion
            And on hover the chart display a tooltip with the Series label
            And on hover the chart display a tooltip with the Category label (0,1,10,100,1000)
            And on hover the chart display a tooltip with the Metric Count

        Scenario: Display metrics and all series is selected
            Given that user is a dashboard page
            When selects all series
            Then the chart should display metrics counts distributed by quantity (0,1,10,100,1000)
            And the chart should display the data in vertical bar chart fashion
            And on hover the chart display a tooltip with the Category label (0,1,10,100,1000)
            And on hover the chart display a tooltip with the Metric Count


Feature: DOI Qty. historical distribution stacked chart bar

        Scenario: Display DOI Counts and a few series is selected
            Given that user is a dashboard page
            When selects a few items in the series
            Then the chart should display DOI Counts counts distributed by year
            And the chart should display the series stacked in the chart
            And the chart should display the data in vertical bar chart fashion
            And on hover the chart display a tooltip with the Series label
            And on hover the chart display a tooltip with the Category label (year)
            And on hover the chart display a tooltip with the DOI qty Count

        Scenario: Display DOI Counts and all series is selected
            Given that user is a dashboard page
            When selects all series
            Then the chart should display DOI Counts counts distributed by year
            And the chart should display the data in vertical bar chart fashion
            And on hover the chart display a tooltip with the Category label (year)
            And on hover the chart display a tooltip with the DOI qty Count

Feature: DOI Qty. categorisation Horizontal stacked chart bar

        Scenario: Display DOI Counts and a few series is selected
            Given that user is a dashboard page
            When selects a few items in the series
            Then the chart should display DOI Counts counts distributed by Category (FOS, License, language, Resource Type, Organisation, repositories)
            And the chart should display the series stacked in the chart
            And the chart should display the data in Horizontal bar chart fashion
            And on hover the chart display a tooltip with the Series label
            And on hover the chart display a tooltip with the Category label (FOS, License, language, Resource Type, Organisation, repositories)
            And on hover the chart display a tooltip with the DOI qty Count
            And the chart display should display ten categories on the Y-axis

        Scenario: Display DOI Counts and all series is selected
            Given that user is a dashboard page
            When selects all series
            Then the chart should display DOI Counts counts distributed by Category
            And the chart should display the data in Horizontal bar chart fashion
            And on hover the chart display a tooltip with the Category label (FOS, License, language, Resource Type, Organisation, repositories)
            And on hover the chart display a tooltip with the DOI qty Count
            And the chart display should display ten categories on the Y-axis

        Scenario: Display aggregated counts even for missing values
            Given that user is a dashboard page
            When the user select a filtering that provides results/hits in the chart
            And some of the aggregated results do not include metadata for the chart category
            Then the chart should display display a bar to aggregate all the aggregated results that are missing
            And the bar should be labeled as "Missing"
            And the bar should be colored in gray

        Scenario: Display aggregated counts for categories that are not in the top 10
            Given that user is a dashboard page
            When the user select a filtering that provides results/hits in the chart
            And some of the aggregated results include more than 10 categories
            Then the chart should display display a bar to aggregate all "other" categories that are not in the top 10 into the same bar
            And the bar should be labeled as "Other"
            And the bar should be colored in gray


Feature: Metrics Qty. categorisation Horizontal stacked chart bar

        Scenario: Display Metrics Counts and a few series is selected
            Given that user is a dashboard page
            When selects a few items in the series
            Then the chart should display Metrics counts distributed by Category (FOS, License, language, Resource Type, Organisation, repositories)
            And the chart should display the series stacked in the chart
            And the chart should display the data in Horizontal bar chart fashion
            And on hover the chart display a tooltip with the Series label
            And on hover the chart display a tooltip with the Category label (FOS, License, language, Resource Type, Organisation, repositories)
            And on hover the chart display a tooltip with the Metrics qty Count
            And the chart display should display ten categories on the Y-axis

        Scenario: Display Metrics Counts and all series is selected
            Given that user is a dashboard page
            When selects all series
            Then the chart should display Metrics counts distributed by Category
            And the chart should display the data in Horizontal bar chart fashion
            And on hover the chart display a tooltip with the Category label (FOS, License, language, Resource Type, Organisation, repositories)
            And on hover the chart display a tooltip with the Metrics qty Count
            And the chart display should display ten categories on the Y-axis

        Scenario: Display aggregated Metrics Counts even for missing values
            Given that user is a dashboard page
            When the user select a filtering that provides results/hits in the chart
            And some of the aggregated results do not include metadata for the chart category
            Then the chart should display display a bar to aggregate all the aggregated results that are missing
            And the bar should be labeled as "Missing"
            And the bar should be colored in gray

        Scenario: Display aggregated Metrics Counts for categories that are not in the top 10
            Given that user is a dashboard page
            When the user select a filtering that provides results/hits in the chart
            And some of the aggregated results include more than 10 categories
            Then the chart should display display a bar to aggregate all "other" categories that are not in the top 10 into the same bar
            And the bar should be labeled as "Other"
            And the bar should be colored in gray

Feature: Sources Section

        Scenario: Display Citations/Views/Downloads dashboard
            Given that user is a dashboard page
            And the current filter query returns at least 1 works with at least 1 citation/view/download
            And the "citations/views/downloads" pill is not disabled
            When selects clicks the "citations/views/downloads" pill
            Then the dashboard should render the citations/views/downloads Qty. categorisation Horizontal bar chart for languages
            And the dashboard should render the citations/views/downloads Qty. categorisation Horizontal bar chart for FOS
            And the dashboard should render the citations/views/downloads Qty. categorisation Horizontal bar chart for Resource Types
            And the dashboard should render the citations/views/downloads Qty. categorisation Horizontal bar chart for licenses
            And the dashboard should render the citations/views/downloads Qty. categorisation Horizontal bar chart for repositories
            And the dashboard should render the citations/views/downloads Qty. categorisation Horizontal bar chart for organisations
            And the dashboard should render the citations/views/downloads Qty. distribution bar chart
            And the dashboard should render the citations/views/downloads historical distribution bar chart
            And the dashboard should render the total works counter


        Scenario: Display Works dashboard
            Given that user is a dashboard page
            And the current filter query returns at least 1 works with at least 1 citation/view/download
            And the "Works" pill is not disabled
            When selects clicks the "Works" pill
            Then the dashboard should render the DOI Qty. categorisation Horizontal bar chart for languages
            And the dashboard should render the DOI Qty. categorisation Horizontal bar chart for FOS
            And the dashboard should render the DOI Qty. categorisation Horizontal bar chart for Resource Types
            And the dashboard should render the DOI Qty. categorisation Horizontal bar chart for licenses
            And the dashboard should render the DOI Qty. categorisation Horizontal bar chart for repositories
            And the dashboard should render the DOI Qty. categorisation Horizontal bar chart for organisations
            And the dashboard should render the DOI historical distribution bar chart
            And the dashboard should render the total works counter


Feature: Link to works

       Scenario: Click on Link to work when the citations pill is selected
            Given that user is a dashboard page
            When the user clicks the link to work at the bottom of the dashboard
            Then the user is redirected to a Works result list page
            And the list must be filtered by all the works that have at least 1 citation count
            And the list must be filtered by the query period selected in the Time interval widget
            And the list must be filtered by the query entities selected in the Series Widget

       Scenario: Click on Link to work when the views pill is selected
            Given that user is a dashboard page
            When the user clicks the link to work at the bottom of the dashboard
            Then the user is redirected to a Works result list page
            And the list must be filtered by all the works that have at least 1 view count
            And the list must be filtered by the query period selected in the Time interval widget
            And the list must be filtered by the query entities selected in the Series Widget

       Scenario: Click on Link to work when the downloads pill is selected
            Given that user is a dashboard page
            When the user clicks the link to work at the bottom of the dashboard
            Then the user is redirected to a Works result list page
            And the list must be filtered by all the works that have at least 1 download count
            And the list must be filtered by the query period selected in the Time interval widget
            And the list must be filtered by the query entities selected in the Series Widget

       Scenario: Click on Link to work when the works pill is selected
            Given that user is a dashboard page
            When the user clicks the link to work at the bottom of the dashboard
            Then the user is redirected to a Works result list page
            And the list must be filtered by the query period selected in the Time interval widget
            And the list must be filtered by the query entities selected in the Series Widget

```

## Non Functional Requirements

- As a repository admin, I would like the data to fresh with the previous month of access to the dashboard, so that I can use the data to make reports up to the previous month.
  - In other words data in the dashboard can be upt-to on 30 days old.
- As a dashboard user, I expect the dashboard page response time to be under 5 seconds (LCP < 5 for desktop at P90).
- As a product designer, I would like the following html element to have a ID so that we can track selection in our analytics platform.
  - toggle element for format widget
  - selecting elements in the series widget
  - Export data  button element
  - Time interval widget toogle element
  - Sources selection toggle element
  - link to works

## Feature Flag

This feature is implemented behind the `bilbiometrics-dashboard` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

## Technical Feasibility



### How to make the citation histogram ?


Basically is a [histogram aggregation](https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket-histogram-aggregation.html)  over the `citation_count` field (or other metric). The interval has to be under 3.

Example in [kibana](https://localhost:9200/_plugin/kibana/app/kibana#/visualize/edit/93f5d5d0-f06f-11eb-b320-d379a7cc07d3?_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now%2FM,to:now%2FM))&_a=(filters:!(('$state':(store:appState),meta:(alias:!n,disabled:!f,index:'59e2c2a0-3df0-11ea-8723-3fe92b3553ce',key:citation_count,negate:!f,params:(gte:1,lt:100),type:range,value:'1%20to%20100'),range:(citation_count:(gte:1,lt:100)))),linked:!f,query:(language:kuery,query:''),uiState:(),vis:(aggs:!((enabled:!t,id:'1',params:(),schema:metric,type:count),(enabled:!t,id:'2',params:(extended_bounds:(),field:citation_count,interval:3),schema:segment,type:histogram),(enabled:!t,id:'3',params:(field:client.id,missingBucket:!f,missingBucketLabel:Missing,order:desc,orderBy:'1',otherBucket:!f,otherBucketLabel:Other,size:20),schema:group,type:terms)),params:(addLegend:!t,addTimeMarker:!f,addTooltip:!t,categoryAxes:!((id:CategoryAxis-1,labels:(show:!t,truncate:100),position:bottom,scale:(type:linear),show:!t,style:(),title:(),type:category)),grid:(categoryLines:!f),legendPosition:right,seriesParams:!((data:(id:'1',label:Count),drawLinesBetweenPoints:!t,mode:stacked,show:true,showCircles:!t,type:histogram,valueAxis:ValueAxis-1)),times:!(),type:histogram,valueAxes:!((id:ValueAxis-1,labels:(filter:!f,rotate:0,show:!t,truncate:100),name:LeftAxis-1,position:left,scale:(mode:normal,type:'square%20root'),show:!t,style:(),title:(text:Count),type:value))),title:new_citations_dis,type:histogram)))


### How to create a faceted filter ?


https://medium.com/hepsiburadatech/how-to-create-faceted-filtered-search-with-elasticsearch-75e2fc9a1ae3



### How to show missing and others bucket?

```json



{
  "aggs": {
    "other-filter": {
      "filters": {
        "filters": {
          "": {
            "bool": {
              "must": [
                {
                  "exists": {
                    "field": "contributors.nameIdentifiers.nameIdentifier"
                  }
                }
              ],
              "filter": [],
              "should": [],
              "must_not": [
                {
                  "match_phrase": {
                    "contributors.nameIdentifiers.nameIdentifier": {
                      "query": "http://www.viaf.org130344669"
                    }
                  }
                },
                {
                  "match_phrase": {
                    "contributors.nameIdentifiers.nameIdentifier": {
                      "query": "https://orcid.org/0000-0002-8635-8390"
                    }
                  }
                }
              ]
            }
          }
        }
      }
    }
  },
  
  
  missing
  
  {
  "aggs": {
    "2": {
      "terms": {
        "field": "contributors.nameIdentifiers.nameIdentifier",
        "size": 3,
        "order": {
          "_count": "desc"
        },
        "missing": "__missing__"
      }
    }
  },


```

### How to plot a data for the stacked bar chart?

One could use a nested aggergation.


```json
{
  "query": {
    "bool": {
      "must": [],
      "must_not": [],
      "should": [
        {
          "terms": {
            "subjects.subjectScheme": [
              "Fields of Science and Technology (FOS)"
            ]
          }
        }
      ]
    }
  },
  "from": 0,
  "size": 10,
  "sort": [],
  "aggs": {
    "science": {
      "terms": {
        "field": "subjects.subject"
      },
      "aggs": {
        "sum_cit": {
          "sum": {
            "field": "citation_count"
          },
          "aggs": {
            "didddst": {
              "terms": {
                "field": "client.id"
              }
            }
          }
        }
      }
    }
  }
}

```

Example:

```json
{
  "query": {
    "bool": {
      "must": [],
      "must_not": [],
      "should": [
        {
          "terms": {
            "subjects.subjectScheme": [
              "Fields of Science and Technology (FOS)"
            ]
          }
        }
      ]
    }
  },
  "from": 0,
  "size": 10,
  "sort": [],
  "aggs": {
    "science": {
      "terms": {
        "field": "subjects.subject"
      },
      "aggs": {
        "sum_cit": {
          "terms": {
            "field": "client.id"
          },
          "aggs": {
            "didddst": {
              "sum": {
                "field": "citation_count"
              }
            }
          }
        }
      }
    }
  }
}

```