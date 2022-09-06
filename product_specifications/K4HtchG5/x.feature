
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
