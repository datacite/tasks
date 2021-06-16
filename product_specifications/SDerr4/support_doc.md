
# API Versioning at DataCite

API versioning allows Datacite to continuously evolve the platform while offering third-party developers a predictable path for feature upgrades and deprecations.

To ensure you always know about upcoming API changes, follow the Changelog and always keep your contact information up to date.

## Versioned vs. unversioned APIs

Versioned APIs	

- REST API

Unversioned APIs

- GraphQL API
- OAI
- MDS
- EZID

## Release schedule

Datacite releases a new API version only when is deemed strictly necessary.

Each stable version is supported for a minimum of 12 months. When a new stable version is introduced and contains changes that affect your app, you have 18 months to test and migrate your app to the new version before support for the previous version is set for deprecation. All deprecation introduction would be announced in the DataCite Newsletter and/or DataCite Open Hours.
We strongly recommend updating your apps to call the latest stable API version. 
If your request doesn't include a version, then the API also defaults to the oldest supported stable version. 

## Calling an API version

Datacite API versions are explicitly declared in the URL that your app calls:

REST DOIs API URLs: /{ version }/dois/{ id }

For example, the following URLs call version 3:

REST DOIs API URL: /v3/dois/10.2323/102
REST DOIs (collection) API URL: /v3/dois


There are several supported versions of the APIs available, and you specify the version that you want to use by substituting the version name in the URL. There are three types of API versions: `stable`, `release candidate`, and `unsupported`.


### Release candidates

Release candidates let you see what changes are scheduled for release in the next stable version so that you can begin updating your app as early as possible. All release candidates are to be used at it as it and at the user risk.

Both backwards-incompatible and backwards-compatible changes can be added to the `release candidate` so that they’re available to you ahead of the stable release. For this reason, we recommend that you don’t use release candidates in **production**.

Calls that include the release candidate behaviour return the response header `X-Datacite-API-Release-Candiate` and a link to get more information:


```json
"X-Datacite-API-Release-Candiate": "https://github.com/datacite/lupo/blob/main/CHANGELOG.md#New-schema"
```


## Deprecation practices

Part of a Datacite API can be deprecated if it becomes unnecessary, unsafe, or outdated. It's marked as deprecated when it's removed in a newer version of the API. The deprecation is then retroactively applied to previous stable versions of the API. When a deprecation is introduced, any further details and any relevant migration information is announced in the developer [changelog]("https://github.com/datacite/lupo/blob/main/CHANGELOG.md").


> Caution: If you use the Datacite API in a standalone app that requires updates, such as a desktop app or mobile app, then your users will need to update before the upgrade deadline to ensure their app continues working. This might mean you’ll have to update well ahead of the migration deadline, so that your merchants then have time to update their apps. Any calls to unsupported resources could result in your app being delisted or merchants being warned about or blocked from installing your app.

When Datacite starts the deprecation process a resource or a property of a resource in the REST API, the change is communicated in one or more of the following ways:

- There would be announcement in Open Hours and the Newsletter.
- The API reference documentation will mention the deprecated reason.
- Calls that include the deprecated behaviour return the response header `X-Datacite-API-Deprecated-Reason` and a link to get more information:

```json
"X-Datacite-API-Deprecated-Reason": "https://github.com/datacite/lupo/blob/main/CHANGELOG.md#New-schema"
```

- Note: If individual properties on a resource are deprecated, then GET requests to that resource don't return the deprecation header in the response.
- A notice about the deprecation is posted in the developer changelog.
- The REST API reference is updated to identify the affected resource and any action you need to take.