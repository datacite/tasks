# Batch Update

## Problem

DOI Administrators are struggling to make changes to many DOIs at the same time, specifically when they have to make a URL migration. They are currently relying on time consuming manual processes or reaching datacite staff to for help.


Problem validation: [We took information from open survey. The large majority of users only need this feature for url URL migrations](https://docs.google.com/document/d/17spNmeQUstzM13FrWfd4Ja18YzTKfB2v_8DSd51mJSM/edit#). 

## Solution 

Althought this feature initially encompassed functionality for updating any metadata field, based on the `product validation` feedback we have refocused the scope to only be used on url changes. 


WireFrames: [Figma File](https://www.figma.com/file/YYSb7xlL2TvV5MNaRZ8tXR/Batch-Update?node-id=0%3A1)

Solution Validation: [We run a feedback session with potentially interested user. These, were users that had reached Datacite in the past about processing usage using the code of practice but they found the processing heavy resource intensive for their organisations. The overall feedback is that the solution solved their needs](https://jamboard.google.com/d/1Ptt7IuIhZ4an81RON2pBrh92OnRtUbINe47icM8caSA/viewer?f=0). A few changes were made based o nthe feedback. however, amoung their comments we also discarded a number of features: CSV download (we do not have the capability to perform this for large repositories); more metadata values should be bulk updatable (no use cases were elicaitated); Link checking dois.



## User Stories

### CRITICAL

- [ ] As a repository admin, I would like to be able to migrate URLs of my DOIs from fabrica in BULK, so I don't have to rely on developers to perform this task.
- [ ] As a repository admin, I would like that the CSV upload were able to check the URLs values, so that I don't submit a CSV with wrong Urls

### NICE TO HAVE

- [ ] As a repository admin, I would like to be able to request URLs migration that include subdomians, domains, paths, document, parameters and http protocols.
- [ ] As a repository admin, I would like to be able to obtain a CSV file with the DOIs and their URLs, so that can ease my work when updating URLS


### Detailed User Stories

```cucumber

Feature: Trigger URL migration

        Scenario: Migrating URLs and updating multiples part of the URL
            Given that the user is logged as client_admin
            And the user inputs a CSV file
            And he has clicked Migrate URLs button 
            And he has uploaded a correctly formatted CSV formatted text file with doi and url 
            When the user clicks migrate
            Then a background job should be trigger to modify all the DOIs presented in the CSV file
            And the user should be redirected to the setting page
            And a message should be displaty saying: "n DOIs are being updated"

        Scenario: Migrating URLs of DOIs that do not belong to the client
            Given that the user is logged as client_admin
            And the user inputs a CSV file
            And the CSV file contains DOIs that do not belong to the client
            And the user clicks migrate
            When one of the DOIs in the list do not belong to the client OR the URL domain doesn't match the list of the repositories domain list
            Then the URL update should be discarded
            
Feature: Validate CSV file

        Scenario: Validate the CSV before sending it
            Given that the user is logged as client_admin
            When the user inputs a CSV file
            And the CSV has URLs which domains do not belong to the repository domian list
            Then the migrate button should be disabled
            And message saying the "You are trying to migrate to a URL with forbidden domains by your Repository adminitrators. Visit the setting page." shoul be displayed
            And the inut box should be highledgted with an error color.

        Scenario: Migrating URLs and with malformed CSV
            Given that the user is logged as client_admin
            And the CSV file is malformed
            When the user enters the CSV into the box or uploads it
            Then a warming message should appear in the screen: "CSV malformmed"
            And the migrate button should be disabled


Feature: CSV with DOIs and URLs download

        Scenario: A small repository want to download a CSV with basic metadata of the DOIs
            Given that the user is logged as client_admin
            And the repository has less than 1000 findable DOIs
            When the user click download CSV file
            Then a CSV file with the DOIS and their URLs should be downloaded


Feature: Trigger Macth and Replace URLs

        Scenario: Migrating URLs 
            Given that the user is logged as client_admin
            And he has clicked Migrate Macth and Replace URLs button 
            And he has entered a URL that he wants to migrate from
            And URL domain is a valid  from the repositories's domain list
            And there are DOIs which URLs `start with` the URL the user wants to migrate from
            And the user has entered the URL he wants to migrate to
            When the user clicks update
            Then a background job should be trigger to modify all the DOIs of the client whose URLs begin with the URL the user wanted to migrate to
            And the user should be redirected to the setting page
            And a message should be displaty saying: "n DOIs are being updated"

        Scenario: Display example of migration
            Given that the user is logged as client_admin
            And he has clicked Migrate Domain button 
            And he has entered a URL that he wants to migrate from
            And URL domain is a valid  from the repositories's domain list
            And there are DOIs which URLs `start with` the URL the user wants to migrate from
            When the user has entered the URL he wants to migrate to
            Then the example area would diplay a match and replace example of the migrations using the first DOI's URL that matches the URL to migrate from
            And a message with the number of DOIs to be affected should be displayed

Feature: Macth and Replace URLs

        Scenario: Executing a succesllful Macth and Replace URLs
            Given that there are DOIs with URLs that match the part the user wants to migrate
            And that part is not only the url scheme (e.g. "http" or "ftp")
            Then a background job should be trigger to modify all the DOIs of the client whose URLs match with the URL the user wanted to migrate from


```


## Non Functional Requirements

- As an repository admin, I would this feature to only be available to repository admins (client_admin), so that no other user can modify the urls.
- As a Datacite user, I would like that the CSV processing would reject any input values that start with: +, -, =, and @ so that we can avoid any CSV injection problems.
- As a product designer, I would that the button elements of both features had an ID, so that we can monitor its used in the analytics platform.



## Feature Flag

This feature is implemented behind the `url-migration` feature flag and disabled by default.
Once we've confirmed the feature is deemed stable, we remove the feature flag to publish the feature as GA.

## Technical Feasibility

Most the functionality is already implemented in the CLI client https://github.com/datacite/cirneco


## how to obtain CSV file with 


This fucntionality already exist in the metadata using MIME types.

```
> GET /clients/cdl.cdl/dois?page%5Bsize%5D=1000 HTTP/2
> Host: api.datacite.org
> accept: text/csv
```
