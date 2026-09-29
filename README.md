<div align="center">

<img src=".github/ee-logo.png" alt="Elastic Email" width="96" />

# Elastic Email Perl SDK

The official Perl client library for the [Elastic Email](https://elasticemail.com) REST API v4.

[![Perl](https://img.shields.io/badge/Perl-5.10%2B-39457E?logo=perl&logoColor=white)](https://www.perl.org/get.html)
[![API](https://img.shields.io/badge/API-v4-0A7BBB)](https://elasticemail.com/developers/api-documentation/rest-api)
[![OpenAPI Generator](https://img.shields.io/badge/generated%20by-OpenAPI%20Generator-6BA539?logo=openapiinitiative&logoColor=white)](https://openapi-generator.tech)
[![License: MIT](https://img.shields.io/github/license/ElasticEmail/elasticemail-perl?color=yellow)](LICENSE)

[![Latest release](https://img.shields.io/github/v/release/ElasticEmail/elasticemail-perl?logo=github&label=release)](https://github.com/ElasticEmail/elasticemail-perl/releases)
[![Last commit](https://img.shields.io/github/last-commit/ElasticEmail/elasticemail-perl?logo=github)](https://github.com/ElasticEmail/elasticemail-perl/commits/master)
[![Open issues](https://img.shields.io/github/issues/ElasticEmail/elasticemail-perl?logo=github)](https://github.com/ElasticEmail/elasticemail-perl/issues)
[![GitHub stars](https://img.shields.io/github/stars/ElasticEmail/elasticemail-perl?style=flat&logo=github)](https://github.com/ElasticEmail/elasticemail-perl/stargazers)

[Installation](#installation) •
[Quick start](#quick-start) •
[Examples](#more-examples) •
[API reference](#api-reference) •
[Models](#models) •
[Contributing](#contributing)

</div>

---

## Features

- **Transactional and bulk email.** Send single messages, bulk campaigns or CSV merge-file sends.
- **Contacts, lists and segments.** Add, update, import, export and bulk-delete contacts.
- **Campaigns and automations.** Create, update, pause and trigger automations for a contact.
- **Templates, files and attachments.** Manage templates and uploaded files.
- **Domains.** Verify sending domains and check SPF, DKIM, tracking and certificate status.
- **Webhooks and inbound routes.** Receive delivery events and route incoming mail.
- **Statistics, events and suppressions.** Track delivery, bounces, complaints and unsubscribes.
- **Subaccounts and security.** Manage subaccounts and API keys.
- **Plain Perl or Moose.** Use the API classes directly, through `ElasticEmail::ApiFactory`, or as a Moose role with `ElasticEmail::Role`.

## Requirements

| Component | Version |
| --- | --- |
| Perl | 5.10 or later (CI runs 5.28) |
| Dependencies | Listed in [`cpanfile`](cpanfile): `LWP::UserAgent`, `JSON` (>= 2.00, < 2.80), `Class::Accessor`, `DateTime`, `Log::Any`, `URI::Query`, `Module::Runtime`, `Module::Find`, `Moose::Role` |

You'll also need an Elastic Email **API key**. You can create one in your [API settings](https://app.elasticemail.com/marketing/settings/new/manage-api). Each endpoint's documentation lists the access level it needs.

## Installation

The SDK is distributed from this GitHub repository. Clone it and install the dependencies from the `cpanfile` with [cpanminus](https://metacpan.org/pod/App::cpanminus):

```bash
git clone https://github.com/ElasticEmail/elasticemail-perl.git
cd elasticemail-perl
cpanm --installdeps .
```

Then add the `lib` directory to your include path, either in your script:

```perl
use lib '/path/to/elasticemail-perl/lib';
```

or with an environment variable:

```bash
export PERL5LIB=/path/to/elasticemail-perl/lib:$PERL5LIB
```

> [!NOTE]
> The `ElasticEmail` distribution on CPAN is an older, unrelated client for the legacy API. Use this repository for API v4.

## Quick start

> [!IMPORTANT]
> Elastic Email only sends from verified domains. Before your first send, [verify your sending domain](https://help.elasticemail.com/en/articles/4934400-how-to-verify-your-domain) and use an address on that domain as the sender.

### Configure the client

```perl
use strict;
use warnings;

use ElasticEmail::EmailsApi;

my $emails = ElasticEmail::EmailsApi->new(
    api_key => { 'X-ElasticEmail-ApiKey' => $ENV{ELASTICEMAIL_API_KEY} },
);
```

> [!TIP]
> Keep your API key out of source code. Load it from an environment variable or a secrets manager.

Every API class (`ElasticEmail::ContactsApi`, `ElasticEmail::CampaignsApi`, …) takes the same options. To share one configured client between them, create an `ElasticEmail::ApiClient` and pass it to each constructor, or use `ElasticEmail::ApiFactory`:

```perl
use ElasticEmail::ApiFactory;

my $api_factory = ElasticEmail::ApiFactory->new(
    api_key => { 'X-ElasticEmail-ApiKey' => $ENV{ELASTICEMAIL_API_KEY} },
);
my $contacts = $api_factory->get_api('Contacts');
```

### Send a transactional email

```perl
use ElasticEmail::Object::EmailTransactionalMessageData;
use ElasticEmail::Object::TransactionalRecipient;
use ElasticEmail::Object::EmailContent;
use ElasticEmail::Object::BodyPart;

my $message = ElasticEmail::Object::EmailTransactionalMessageData->new(
    Recipients => ElasticEmail::Object::TransactionalRecipient->new(
        To => ['john.doe@example.com'],
    ),
    Content => ElasticEmail::Object::EmailContent->new(
        From    => 'My App <no-reply@yourdomain.com>',
        Subject => 'Welcome aboard!',
        Body    => [
            ElasticEmail::Object::BodyPart->new(
                ContentType => 'HTML',
                Content     => '<h1>Hello!</h1><p>Thanks for signing up.</p>',
            ),
            ElasticEmail::Object::BodyPart->new(
                ContentType => 'PlainText',
                Content     => 'Hello! Thanks for signing up.',
            ),
        ],
    ),
);

my $result = eval {
    $emails->emails_transactional_post(email_transactional_message_data => $message);
};
if ($@) {
    # e.g. "API Exception(401): Unauthorized" followed by the response body
    warn "Elastic Email API error: $@";
} else {
    printf "Sent. TransactionID: %s, MessageID: %s\n",
        $result->transaction_id, $result->message_id;
}
```

Model constructors take the API's field names (`To`, `From`, `ContentType`). After construction, use the snake_case accessors (`$result->transaction_id`, `$content->template_name('…')`).

The `From` address must use a domain you've [verified in your Elastic Email account](https://help.elasticemail.com/en/articles/4934400-how-to-verify-your-domain).

### Send from a template with merge fields

```perl
my $message = ElasticEmail::Object::EmailTransactionalMessageData->new(
    Recipients => ElasticEmail::Object::TransactionalRecipient->new(
        To => ['john.doe@example.com'],
    ),
    Content => ElasticEmail::Object::EmailContent->new(
        From         => 'My App <no-reply@yourdomain.com>',
        TemplateName => 'welcome-template',
        Merge        => { firstname => 'John' },
    ),
);

$emails->emails_transactional_post(email_transactional_message_data => $message);
```

### Timeouts and proxies

The client uses [`LWP::UserAgent`](https://metacpan.org/pod/LWP::UserAgent). Set the request timeout (in seconds, default 180) through the configuration, and configure a proxy on the user agent:

```perl
my $emails = ElasticEmail::EmailsApi->new(
    api_key      => { 'X-ElasticEmail-ApiKey' => $ENV{ELASTICEMAIL_API_KEY} },
    http_timeout => 60,
);

$emails->{api_client}{ua}->proxy(['http', 'https'], 'http://myProxyUrl:80/');
```

## More examples

More complete, runnable samples are in the **[Elastic Email examples repository](https://github.com/ElasticEmail/elasticemail-examples)**. It covers transactional email, SMTP, webhooks, inbound email, contacts and serverless platforms across 20+ languages and frameworks.

- 📂 [All examples](https://github.com/ElasticEmail/elasticemail-examples)

This repository also includes Perl snippets in [`examples/functions`](examples/functions). See [`examples/README.md`](examples/README.md) for how to run them.

<details>
<summary><strong>Show the Perl snippets</strong></summary>

| Snippet | Readme |
| --- | --- |
| [addCampaign](examples/functions/addCampaign.pl) | [readme](examples/functions/addCampaign.md) |
| [addBulkContacts](examples/functions/addBulkContacts.pl) | [readme](examples/functions/addBulkContacts.md) |
| [addList](examples/functions/addList.pl) | [readme](examples/functions/addList.md) |
| [addSingleContact](examples/functions/addSingleContact.pl) | [readme](examples/functions/addSingleContact.md) |
| [addTemplate](examples/functions/addTemplate.pl) | [readme](examples/functions/addTemplate.md) |
| [deleteCampaign](examples/functions/deleteCampaign.pl) | [readme](examples/functions/deleteCampaign.md) |
| [deleteContacts](examples/functions/deleteContacts.pl) | [readme](examples/functions/deleteContacts.md) |
| [deleteList](examples/functions/deleteList.pl) | [readme](examples/functions/deleteList.md) |
| [deleteTemplate](examples/functions/deleteTemplate.pl) | [readme](examples/functions/deleteTemplate.md) |
| [exportContacts](examples/functions/exportContacts.pl) | [readme](examples/functions/exportContacts.md) |
| [loadCampaigns](examples/functions/loadCampaigns.pl) | [readme](examples/functions/loadCampaigns.md) |
| [loadCampaignsStats](examples/functions/loadCampaignsStats.pl) | [readme](examples/functions/loadCampaignsStats.md) |
| [loadChannelsStats](examples/functions/loadChannelsStats.pl) | [readme](examples/functions/loadChannelsStats.md) |
| [loadList](examples/functions/loadList.pl) | [readme](examples/functions/loadList.md) |
| [loadStatistics](examples/functions/loadStatistics.pl) | [readme](examples/functions/loadStatistics.md) |
| [loadTemplate](examples/functions/loadTemplate.pl) | [readme](examples/functions/loadTemplate.md) |
| [sendBulkEmails](examples/functions/sendBulkEmails.pl) | [readme](examples/functions/sendBulkEmails.md) |
| [sendTransactionalEmails](examples/functions/sendTransactionalEmails.pl) | [readme](examples/functions/sendTransactionalEmails.md) |
| [updateCampaign](examples/functions/updateCampaign.pl) | [readme](examples/functions/updateCampaign.md) |

</details>

## Authentication

| Scheme | Header | Used for |
| --- | --- | --- |
| `apikey` | `X-ElasticEmail-ApiKey` | All standard API calls |
| `ApiKeyAuthCustomBranding` | `X-Auth-Token` | Custom-branding (white-label) accounts |

## API limits

- Up to **20 concurrent connections** per account
- A hard timeout of **600 seconds** per request

## API reference

All URIs are relative to `https://api.elasticemail.com/v4`. The SDK covers **114 endpoints** across 16 API classes: `CampaignsApi`, `ContactsApi`, `DomainsApi`, `EmailsApi`, `EventsApi`, `FilesApi`, `InboundRouteApi`, `ListsApi`, `SecurityApi`, `SegmentsApi`, `StatisticsApi`, `SubAccountsApi`, `SuppressionsApi`, `TemplatesApi`, `VerificationsApi` and `WebhookApi`. Each class lives in the `ElasticEmail::` namespace (e.g. `ElasticEmail::EmailsApi`).

<details>
<summary><strong>Show all endpoints</strong></summary>

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*CampaignsApi* | [**campaigns_automation_by_name_trigger_post**](docs/CampaignsApi.md#campaigns_automation_by_name_trigger_post) | **POST** /campaigns/automation/{name}/trigger | Trigger Automation for Contact
*CampaignsApi* | [**campaigns_by_name_delete**](docs/CampaignsApi.md#campaigns_by_name_delete) | **DELETE** /campaigns/{name} | Delete Campaign
*CampaignsApi* | [**campaigns_by_name_get**](docs/CampaignsApi.md#campaigns_by_name_get) | **GET** /campaigns/{name} | Load Campaign
*CampaignsApi* | [**campaigns_by_name_pause_put**](docs/CampaignsApi.md#campaigns_by_name_pause_put) | **PUT** /campaigns/{name}/pause | Pause Campaign
*CampaignsApi* | [**campaigns_by_name_put**](docs/CampaignsApi.md#campaigns_by_name_put) | **PUT** /campaigns/{name} | Update Campaign
*CampaignsApi* | [**campaigns_get**](docs/CampaignsApi.md#campaigns_get) | **GET** /campaigns | Load Campaigns
*CampaignsApi* | [**campaigns_post**](docs/CampaignsApi.md#campaigns_post) | **POST** /campaigns | Add Campaign
*ContactsApi* | [**contacts_by_email_delete**](docs/ContactsApi.md#contacts_by_email_delete) | **DELETE** /contacts/{email} | Delete Contact
*ContactsApi* | [**contacts_by_email_get**](docs/ContactsApi.md#contacts_by_email_get) | **GET** /contacts/{email} | Load Contact
*ContactsApi* | [**contacts_by_email_put**](docs/ContactsApi.md#contacts_by_email_put) | **PUT** /contacts/{email} | Update Contact
*ContactsApi* | [**contacts_delete_post**](docs/ContactsApi.md#contacts_delete_post) | **POST** /contacts/delete | Delete Contacts Bulk
*ContactsApi* | [**contacts_export_by_id_status_get**](docs/ContactsApi.md#contacts_export_by_id_status_get) | **GET** /contacts/export/{id}/status | Check Export Status
*ContactsApi* | [**contacts_export_post**](docs/ContactsApi.md#contacts_export_post) | **POST** /contacts/export | Export Contacts
*ContactsApi* | [**contacts_get**](docs/ContactsApi.md#contacts_get) | **GET** /contacts | Load Contacts
*ContactsApi* | [**contacts_import_post**](docs/ContactsApi.md#contacts_import_post) | **POST** /contacts/import | Upload Contacts
*ContactsApi* | [**contacts_post**](docs/ContactsApi.md#contacts_post) | **POST** /contacts | Add Contact
*DomainsApi* | [**domains_by_domain_delete**](docs/DomainsApi.md#domains_by_domain_delete) | **DELETE** /domains/{domain} | Delete Domain
*DomainsApi* | [**domains_by_domain_get**](docs/DomainsApi.md#domains_by_domain_get) | **GET** /domains/{domain} | Load Domain
*DomainsApi* | [**domains_by_domain_put**](docs/DomainsApi.md#domains_by_domain_put) | **PUT** /domains/{domain} | Update Domain
*DomainsApi* | [**domains_by_domain_restricted_get**](docs/DomainsApi.md#domains_by_domain_restricted_get) | **GET** /domains/{domain}/restricted | Check for domain restriction
*DomainsApi* | [**domains_by_domain_verification_put**](docs/DomainsApi.md#domains_by_domain_verification_put) | **PUT** /domains/{domain}/verification | Verify Domain
*DomainsApi* | [**domains_by_email_default_patch**](docs/DomainsApi.md#domains_by_email_default_patch) | **PATCH** /domains/{email}/default | Set Default
*DomainsApi* | [**domains_get**](docs/DomainsApi.md#domains_get) | **GET** /domains | Load Domains
*DomainsApi* | [**domains_post**](docs/DomainsApi.md#domains_post) | **POST** /domains | Add Domain
*EmailsApi* | [**emails_by_msgid_view_get**](docs/EmailsApi.md#emails_by_msgid_view_get) | **GET** /emails/{msgid}/view | View Email
*EmailsApi* | [**emails_by_transactionid_status_get**](docs/EmailsApi.md#emails_by_transactionid_status_get) | **GET** /emails/{transactionid}/status | Get Status
*EmailsApi* | [**emails_mergefile_post**](docs/EmailsApi.md#emails_mergefile_post) | **POST** /emails/mergefile | Send Bulk Emails CSV
*EmailsApi* | [**emails_post**](docs/EmailsApi.md#emails_post) | **POST** /emails | Send Bulk Emails
*EmailsApi* | [**emails_transactional_post**](docs/EmailsApi.md#emails_transactional_post) | **POST** /emails/transactional | Send Transactional Email
*EventsApi* | [**events_by_transactionid_get**](docs/EventsApi.md#events_by_transactionid_get) | **GET** /events/{transactionid} | Load Email Events
*EventsApi* | [**events_channels_by_name_export_post**](docs/EventsApi.md#events_channels_by_name_export_post) | **POST** /events/channels/{name}/export | Export Channel Events
*EventsApi* | [**events_channels_by_name_get**](docs/EventsApi.md#events_channels_by_name_get) | **GET** /events/channels/{name} | Load Channel Events
*EventsApi* | [**events_channels_export_by_id_status_get**](docs/EventsApi.md#events_channels_export_by_id_status_get) | **GET** /events/channels/export/{id}/status | Check Channel Export Status
*EventsApi* | [**events_export_by_id_status_get**](docs/EventsApi.md#events_export_by_id_status_get) | **GET** /events/export/{id}/status | Check Export Status
*EventsApi* | [**events_export_post**](docs/EventsApi.md#events_export_post) | **POST** /events/export | Export Events
*EventsApi* | [**events_get**](docs/EventsApi.md#events_get) | **GET** /events | Load Events
*FilesApi* | [**files_by_name_delete**](docs/FilesApi.md#files_by_name_delete) | **DELETE** /files/{name} | Delete File
*FilesApi* | [**files_by_name_get**](docs/FilesApi.md#files_by_name_get) | **GET** /files/{name} | Download File
*FilesApi* | [**files_by_name_info_get**](docs/FilesApi.md#files_by_name_info_get) | **GET** /files/{name}/info | Load File Details
*FilesApi* | [**files_get**](docs/FilesApi.md#files_get) | **GET** /files | List Files
*FilesApi* | [**files_post**](docs/FilesApi.md#files_post) | **POST** /files | Upload File
*InboundRouteApi* | [**inboundroute_by_id_delete**](docs/InboundRouteApi.md#inboundroute_by_id_delete) | **DELETE** /inboundroute/{id} | Delete Route
*InboundRouteApi* | [**inboundroute_by_id_get**](docs/InboundRouteApi.md#inboundroute_by_id_get) | **GET** /inboundroute/{id} | Get Route
*InboundRouteApi* | [**inboundroute_by_id_put**](docs/InboundRouteApi.md#inboundroute_by_id_put) | **PUT** /inboundroute/{id} | Update Route
*InboundRouteApi* | [**inboundroute_get**](docs/InboundRouteApi.md#inboundroute_get) | **GET** /inboundroute | Get Routes
*InboundRouteApi* | [**inboundroute_order_put**](docs/InboundRouteApi.md#inboundroute_order_put) | **PUT** /inboundroute/order | Update Sorting
*InboundRouteApi* | [**inboundroute_post**](docs/InboundRouteApi.md#inboundroute_post) | **POST** /inboundroute | Create Route
*ListsApi* | [**lists_by_listname_contacts_get**](docs/ListsApi.md#lists_by_listname_contacts_get) | **GET** /lists/{listname}/contacts | Load Contacts in List
*ListsApi* | [**lists_by_name_contacts_post**](docs/ListsApi.md#lists_by_name_contacts_post) | **POST** /lists/{name}/contacts | Add Contacts to List
*ListsApi* | [**lists_by_name_contacts_remove_post**](docs/ListsApi.md#lists_by_name_contacts_remove_post) | **POST** /lists/{name}/contacts/remove | Remove Contacts from List
*ListsApi* | [**lists_by_name_delete**](docs/ListsApi.md#lists_by_name_delete) | **DELETE** /lists/{name} | Delete List
*ListsApi* | [**lists_by_name_get**](docs/ListsApi.md#lists_by_name_get) | **GET** /lists/{name} | Load List
*ListsApi* | [**lists_by_name_put**](docs/ListsApi.md#lists_by_name_put) | **PUT** /lists/{name} | Update List
*ListsApi* | [**lists_get**](docs/ListsApi.md#lists_get) | **GET** /lists | Load Lists
*ListsApi* | [**lists_post**](docs/ListsApi.md#lists_post) | **POST** /lists | Add List
*SecurityApi* | [**security_apikeys_by_name_delete**](docs/SecurityApi.md#security_apikeys_by_name_delete) | **DELETE** /security/apikeys/{name} | Delete ApiKey
*SecurityApi* | [**security_apikeys_by_name_get**](docs/SecurityApi.md#security_apikeys_by_name_get) | **GET** /security/apikeys/{name} | Load ApiKey
*SecurityApi* | [**security_apikeys_by_name_put**](docs/SecurityApi.md#security_apikeys_by_name_put) | **PUT** /security/apikeys/{name} | Update ApiKey
*SecurityApi* | [**security_apikeys_get**](docs/SecurityApi.md#security_apikeys_get) | **GET** /security/apikeys | List ApiKeys
*SecurityApi* | [**security_apikeys_post**](docs/SecurityApi.md#security_apikeys_post) | **POST** /security/apikeys | Add ApiKey
*SecurityApi* | [**security_smtp_by_name_delete**](docs/SecurityApi.md#security_smtp_by_name_delete) | **DELETE** /security/smtp/{name} | Delete SMTP Credential
*SecurityApi* | [**security_smtp_by_name_get**](docs/SecurityApi.md#security_smtp_by_name_get) | **GET** /security/smtp/{name} | Load SMTP Credential
*SecurityApi* | [**security_smtp_by_name_put**](docs/SecurityApi.md#security_smtp_by_name_put) | **PUT** /security/smtp/{name} | Update SMTP Credential
*SecurityApi* | [**security_smtp_get**](docs/SecurityApi.md#security_smtp_get) | **GET** /security/smtp | List SMTP Credentials
*SecurityApi* | [**security_smtp_post**](docs/SecurityApi.md#security_smtp_post) | **POST** /security/smtp | Add SMTP Credential
*SegmentsApi* | [**segments_by_name_delete**](docs/SegmentsApi.md#segments_by_name_delete) | **DELETE** /segments/{name} | Delete Segment
*SegmentsApi* | [**segments_by_name_get**](docs/SegmentsApi.md#segments_by_name_get) | **GET** /segments/{name} | Load Segment
*SegmentsApi* | [**segments_by_name_put**](docs/SegmentsApi.md#segments_by_name_put) | **PUT** /segments/{name} | Update Segment
*SegmentsApi* | [**segments_get**](docs/SegmentsApi.md#segments_get) | **GET** /segments | Load Segments
*SegmentsApi* | [**segments_post**](docs/SegmentsApi.md#segments_post) | **POST** /segments | Add Segment
*StatisticsApi* | [**statistics_campaigns_by_name_get**](docs/StatisticsApi.md#statistics_campaigns_by_name_get) | **GET** /statistics/campaigns/{name} | Load Campaign Stats
*StatisticsApi* | [**statistics_campaigns_get**](docs/StatisticsApi.md#statistics_campaigns_get) | **GET** /statistics/campaigns | Load Campaigns Stats
*StatisticsApi* | [**statistics_channels_by_name_get**](docs/StatisticsApi.md#statistics_channels_by_name_get) | **GET** /statistics/channels/{name} | Load Channel Stats
*StatisticsApi* | [**statistics_channels_get**](docs/StatisticsApi.md#statistics_channels_get) | **GET** /statistics/channels | Load Channels Stats
*StatisticsApi* | [**statistics_get**](docs/StatisticsApi.md#statistics_get) | **GET** /statistics | Load Statistics
*SubAccountsApi* | [**subaccounts_by_email_apikey_get**](docs/SubAccountsApi.md#subaccounts_by_email_apikey_get) | **GET** /subaccounts/{email}/apikey | Get SubAccount ApiKey
*SubAccountsApi* | [**subaccounts_by_email_credits_patch**](docs/SubAccountsApi.md#subaccounts_by_email_credits_patch) | **PATCH** /subaccounts/{email}/credits | Add, Subtract Email Credits
*SubAccountsApi* | [**subaccounts_by_email_delete**](docs/SubAccountsApi.md#subaccounts_by_email_delete) | **DELETE** /subaccounts/{email} | Delete SubAccount
*SubAccountsApi* | [**subaccounts_by_email_get**](docs/SubAccountsApi.md#subaccounts_by_email_get) | **GET** /subaccounts/{email} | Load SubAccount
*SubAccountsApi* | [**subaccounts_by_email_settings_email_put**](docs/SubAccountsApi.md#subaccounts_by_email_settings_email_put) | **PUT** /subaccounts/{email}/settings/email | Update SubAccount Email Settings
*SubAccountsApi* | [**subaccounts_get**](docs/SubAccountsApi.md#subaccounts_get) | **GET** /subaccounts | Load SubAccounts
*SubAccountsApi* | [**subaccounts_post**](docs/SubAccountsApi.md#subaccounts_post) | **POST** /subaccounts | Add SubAccount
*SuppressionsApi* | [**suppressions_bounces_get**](docs/SuppressionsApi.md#suppressions_bounces_get) | **GET** /suppressions/bounces | Get Bounce List
*SuppressionsApi* | [**suppressions_bounces_import_post**](docs/SuppressionsApi.md#suppressions_bounces_import_post) | **POST** /suppressions/bounces/import | Add Bounces Async
*SuppressionsApi* | [**suppressions_bounces_post**](docs/SuppressionsApi.md#suppressions_bounces_post) | **POST** /suppressions/bounces | Add Bounces
*SuppressionsApi* | [**suppressions_by_email_delete**](docs/SuppressionsApi.md#suppressions_by_email_delete) | **DELETE** /suppressions/{email} | Delete Suppression
*SuppressionsApi* | [**suppressions_by_email_get**](docs/SuppressionsApi.md#suppressions_by_email_get) | **GET** /suppressions/{email} | Get Suppression
*SuppressionsApi* | [**suppressions_complaints_get**](docs/SuppressionsApi.md#suppressions_complaints_get) | **GET** /suppressions/complaints | Get Complaints List
*SuppressionsApi* | [**suppressions_complaints_import_post**](docs/SuppressionsApi.md#suppressions_complaints_import_post) | **POST** /suppressions/complaints/import | Add Complaints Async
*SuppressionsApi* | [**suppressions_complaints_post**](docs/SuppressionsApi.md#suppressions_complaints_post) | **POST** /suppressions/complaints | Add Complaints
*SuppressionsApi* | [**suppressions_get**](docs/SuppressionsApi.md#suppressions_get) | **GET** /suppressions | Get Suppressions
*SuppressionsApi* | [**suppressions_unsubscribes_get**](docs/SuppressionsApi.md#suppressions_unsubscribes_get) | **GET** /suppressions/unsubscribes | Get Unsubscribes List
*SuppressionsApi* | [**suppressions_unsubscribes_import_post**](docs/SuppressionsApi.md#suppressions_unsubscribes_import_post) | **POST** /suppressions/unsubscribes/import | Add Unsubscribes Async
*SuppressionsApi* | [**suppressions_unsubscribes_post**](docs/SuppressionsApi.md#suppressions_unsubscribes_post) | **POST** /suppressions/unsubscribes | Add Unsubscribes
*TemplatesApi* | [**templates_by_name_delete**](docs/TemplatesApi.md#templates_by_name_delete) | **DELETE** /templates/{name} | Delete Template
*TemplatesApi* | [**templates_by_name_get**](docs/TemplatesApi.md#templates_by_name_get) | **GET** /templates/{name} | Load Template
*TemplatesApi* | [**templates_by_name_put**](docs/TemplatesApi.md#templates_by_name_put) | **PUT** /templates/{name} | Update Template
*TemplatesApi* | [**templates_get**](docs/TemplatesApi.md#templates_get) | **GET** /templates | Load Templates
*TemplatesApi* | [**templates_post**](docs/TemplatesApi.md#templates_post) | **POST** /templates | Add Template
*VerificationsApi* | [**verifications_by_email_delete**](docs/VerificationsApi.md#verifications_by_email_delete) | **DELETE** /verifications/{email} | Delete Email Verification Result
*VerificationsApi* | [**verifications_by_email_get**](docs/VerificationsApi.md#verifications_by_email_get) | **GET** /verifications/{email} | Get Email Verification Result
*VerificationsApi* | [**verifications_by_email_post**](docs/VerificationsApi.md#verifications_by_email_post) | **POST** /verifications/{email} | Verify Email
*VerificationsApi* | [**verifications_files_by_id_delete**](docs/VerificationsApi.md#verifications_files_by_id_delete) | **DELETE** /verifications/files/{id} | Delete File Verification Result
*VerificationsApi* | [**verifications_files_by_id_result_download_get**](docs/VerificationsApi.md#verifications_files_by_id_result_download_get) | **GET** /verifications/files/{id}/result/download | Download File Verification Result
*VerificationsApi* | [**verifications_files_by_id_result_get**](docs/VerificationsApi.md#verifications_files_by_id_result_get) | **GET** /verifications/files/{id}/result | Get Detailed File Verification Result
*VerificationsApi* | [**verifications_files_by_id_verification_post**](docs/VerificationsApi.md#verifications_files_by_id_verification_post) | **POST** /verifications/files/{id}/verification | Start verification
*VerificationsApi* | [**verifications_files_post**](docs/VerificationsApi.md#verifications_files_post) | **POST** /verifications/files | Upload File with Emails
*VerificationsApi* | [**verifications_files_result_get**](docs/VerificationsApi.md#verifications_files_result_get) | **GET** /verifications/files/result | Get Files Verification Results
*VerificationsApi* | [**verifications_get**](docs/VerificationsApi.md#verifications_get) | **GET** /verifications | Get Emails Verification Results
*WebhookApi* | [**webhook_by_publicid_delete**](docs/WebhookApi.md#webhook_by_publicid_delete) | **DELETE** /webhook/{publicid} | Delete Webhook
*WebhookApi* | [**webhook_by_publicid_get**](docs/WebhookApi.md#webhook_by_publicid_get) | **GET** /webhook/{publicid} | Load Webhook
*WebhookApi* | [**webhook_by_publicid_put**](docs/WebhookApi.md#webhook_by_publicid_put) | **PUT** /webhook/{publicid} | Update Webhook
*WebhookApi* | [**webhook_get**](docs/WebhookApi.md#webhook_get) | **GET** /webhook | Load Webhooks
*WebhookApi* | [**webhook_post**](docs/WebhookApi.md#webhook_post) | **POST** /webhook | Add Webhook

</details>

## Models

<details>
<summary><strong>Show all 98 models</strong></summary>

- [ElasticEmail::Object::AccessLevel](docs/AccessLevel.md)
- [ElasticEmail::Object::AccountStatusEnum](docs/AccountStatusEnum.md)
- [ElasticEmail::Object::ApiKey](docs/ApiKey.md)
- [ElasticEmail::Object::ApiKeyPayload](docs/ApiKeyPayload.md)
- [ElasticEmail::Object::BodyContentType](docs/BodyContentType.md)
- [ElasticEmail::Object::BodyPart](docs/BodyPart.md)
- [ElasticEmail::Object::Campaign](docs/Campaign.md)
- [ElasticEmail::Object::CampaignOptions](docs/CampaignOptions.md)
- [ElasticEmail::Object::CampaignRecipient](docs/CampaignRecipient.md)
- [ElasticEmail::Object::CampaignStatus](docs/CampaignStatus.md)
- [ElasticEmail::Object::CampaignTemplate](docs/CampaignTemplate.md)
- [ElasticEmail::Object::CertificateValidationStatus](docs/CertificateValidationStatus.md)
- [ElasticEmail::Object::ChannelLogStatusSummary](docs/ChannelLogStatusSummary.md)
- [ElasticEmail::Object::CompressionFormat](docs/CompressionFormat.md)
- [ElasticEmail::Object::ConsentData](docs/ConsentData.md)
- [ElasticEmail::Object::ConsentTracking](docs/ConsentTracking.md)
- [ElasticEmail::Object::Contact](docs/Contact.md)
- [ElasticEmail::Object::ContactActivity](docs/ContactActivity.md)
- [ElasticEmail::Object::ContactPayload](docs/ContactPayload.md)
- [ElasticEmail::Object::ContactSource](docs/ContactSource.md)
- [ElasticEmail::Object::ContactStatus](docs/ContactStatus.md)
- [ElasticEmail::Object::ContactUpdatePayload](docs/ContactUpdatePayload.md)
- [ElasticEmail::Object::ContactsList](docs/ContactsList.md)
- [ElasticEmail::Object::DKIMRecord](docs/DKIMRecord.md)
- [ElasticEmail::Object::DeliveryOptimizationType](docs/DeliveryOptimizationType.md)
- [ElasticEmail::Object::DomainData](docs/DomainData.md)
- [ElasticEmail::Object::DomainDetail](docs/DomainDetail.md)
- [ElasticEmail::Object::DomainOwner](docs/DomainOwner.md)
- [ElasticEmail::Object::DomainPayload](docs/DomainPayload.md)
- [ElasticEmail::Object::DomainUpdatePayload](docs/DomainUpdatePayload.md)
- [ElasticEmail::Object::EmailContent](docs/EmailContent.md)
- [ElasticEmail::Object::EmailData](docs/EmailData.md)
- [ElasticEmail::Object::EmailJobFailedStatus](docs/EmailJobFailedStatus.md)
- [ElasticEmail::Object::EmailJobStatus](docs/EmailJobStatus.md)
- [ElasticEmail::Object::EmailMessageData](docs/EmailMessageData.md)
- [ElasticEmail::Object::EmailPredictedValidationStatus](docs/EmailPredictedValidationStatus.md)
- [ElasticEmail::Object::EmailRecipient](docs/EmailRecipient.md)
- [ElasticEmail::Object::EmailSend](docs/EmailSend.md)
- [ElasticEmail::Object::EmailStatus](docs/EmailStatus.md)
- [ElasticEmail::Object::EmailTransactionalMessageData](docs/EmailTransactionalMessageData.md)
- [ElasticEmail::Object::EmailValidationResult](docs/EmailValidationResult.md)
- [ElasticEmail::Object::EmailValidationStatus](docs/EmailValidationStatus.md)
- [ElasticEmail::Object::EmailView](docs/EmailView.md)
- [ElasticEmail::Object::EmailsPayload](docs/EmailsPayload.md)
- [ElasticEmail::Object::EncodingType](docs/EncodingType.md)
- [ElasticEmail::Object::EventType](docs/EventType.md)
- [ElasticEmail::Object::EventsOrderBy](docs/EventsOrderBy.md)
- [ElasticEmail::Object::ExportFileFormats](docs/ExportFileFormats.md)
- [ElasticEmail::Object::ExportLink](docs/ExportLink.md)
- [ElasticEmail::Object::ExportStatus](docs/ExportStatus.md)
- [ElasticEmail::Object::FileInfo](docs/FileInfo.md)
- [ElasticEmail::Object::FilePayload](docs/FilePayload.md)
- [ElasticEmail::Object::FileUploadResult](docs/FileUploadResult.md)
- [ElasticEmail::Object::InboundPayload](docs/InboundPayload.md)
- [ElasticEmail::Object::InboundRoute](docs/InboundRoute.md)
- [ElasticEmail::Object::InboundRouteActionType](docs/InboundRouteActionType.md)
- [ElasticEmail::Object::InboundRouteFilterType](docs/InboundRouteFilterType.md)
- [ElasticEmail::Object::ListPayload](docs/ListPayload.md)
- [ElasticEmail::Object::ListUpdatePayload](docs/ListUpdatePayload.md)
- [ElasticEmail::Object::LogJobStatus](docs/LogJobStatus.md)
- [ElasticEmail::Object::LogStatusSummary](docs/LogStatusSummary.md)
- [ElasticEmail::Object::MergeEmailPayload](docs/MergeEmailPayload.md)
- [ElasticEmail::Object::MessageAttachment](docs/MessageAttachment.md)
- [ElasticEmail::Object::MessageCategory](docs/MessageCategory.md)
- [ElasticEmail::Object::MessageCategoryEnum](docs/MessageCategoryEnum.md)
- [ElasticEmail::Object::NewApiKey](docs/NewApiKey.md)
- [ElasticEmail::Object::NewSmtpCredentials](docs/NewSmtpCredentials.md)
- [ElasticEmail::Object::Options](docs/Options.md)
- [ElasticEmail::Object::RecipientEvent](docs/RecipientEvent.md)
- [ElasticEmail::Object::Segment](docs/Segment.md)
- [ElasticEmail::Object::SegmentPayload](docs/SegmentPayload.md)
- [ElasticEmail::Object::SmtpCredentials](docs/SmtpCredentials.md)
- [ElasticEmail::Object::SmtpCredentialsPayload](docs/SmtpCredentialsPayload.md)
- [ElasticEmail::Object::SortOrderItem](docs/SortOrderItem.md)
- [ElasticEmail::Object::SplitOptimizationType](docs/SplitOptimizationType.md)
- [ElasticEmail::Object::SplitOptions](docs/SplitOptions.md)
- [ElasticEmail::Object::SubAccountInfo](docs/SubAccountInfo.md)
- [ElasticEmail::Object::SubaccountEmailCreditsPayload](docs/SubaccountEmailCreditsPayload.md)
- [ElasticEmail::Object::SubaccountEmailSettings](docs/SubaccountEmailSettings.md)
- [ElasticEmail::Object::SubaccountEmailSettingsPayload](docs/SubaccountEmailSettingsPayload.md)
- [ElasticEmail::Object::SubaccountPayload](docs/SubaccountPayload.md)
- [ElasticEmail::Object::SubaccountSettingsInfo](docs/SubaccountSettingsInfo.md)
- [ElasticEmail::Object::SubaccountSettingsInfoPayload](docs/SubaccountSettingsInfoPayload.md)
- [ElasticEmail::Object::Suppression](docs/Suppression.md)
- [ElasticEmail::Object::Template](docs/Template.md)
- [ElasticEmail::Object::TemplatePayload](docs/TemplatePayload.md)
- [ElasticEmail::Object::TemplateScope](docs/TemplateScope.md)
- [ElasticEmail::Object::TemplateType](docs/TemplateType.md)
- [ElasticEmail::Object::TrackingType](docs/TrackingType.md)
- [ElasticEmail::Object::TrackingValidationStatus](docs/TrackingValidationStatus.md)
- [ElasticEmail::Object::TransactionalRecipient](docs/TransactionalRecipient.md)
- [ElasticEmail::Object::Utm](docs/Utm.md)
- [ElasticEmail::Object::VerificationFileResult](docs/VerificationFileResult.md)
- [ElasticEmail::Object::VerificationFileResultDetails](docs/VerificationFileResultDetails.md)
- [ElasticEmail::Object::VerificationStatus](docs/VerificationStatus.md)
- [ElasticEmail::Object::Webhook](docs/Webhook.md)
- [ElasticEmail::Object::WebhookCreatePayload](docs/WebhookCreatePayload.md)
- [ElasticEmail::Object::WebhookUpdatePayload](docs/WebhookUpdatePayload.md)

</details>

## Tests

The `t/` directory has a test file for every API class and model. With the dependencies installed, run:

```bash
prove -Ilib t
```

## Versioning

The SDK follows the Elastic Email API v4. Versions and release notes are listed in [GitHub Releases](https://github.com/ElasticEmail/elasticemail-perl/releases).

<details>
<summary>Build details</summary>

- API version: 4.0.0
- SDK version: 4.2.0
- Generator version: 7.11.0
- Build package: `org.openapitools.codegen.languages.PerlClientCodegen`

</details>

## Contributing

Contributions are welcome! Most of this SDK is generated from the Elastic Email OpenAPI specification, so please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a pull request.

- 🐛 [Report a bug](https://github.com/ElasticEmail/elasticemail-perl/issues/new?template=bug_report.md)
- 💡 [Request a feature](https://github.com/ElasticEmail/elasticemail-perl/issues/new?template=feature_request.md)
- 🔒 [Report a security issue](SECURITY.md)

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md).

## Support

> [!IMPORTANT]
> The fastest way to get help is the **chat widget on [elasticemail.com](https://elasticemail.com)**. Our support team can help with your account, sending, deliverability and API questions.

- 💬 [Chat with support on elasticemail.com](https://elasticemail.com) (preferred)
- 📚 [API documentation](https://elasticemail.com/developers/api-documentation/rest-api)
- 🧪 [Examples repository](https://github.com/ElasticEmail/elasticemail-examples)
- 🐛 [GitHub issues](https://github.com/ElasticEmail/elasticemail-perl/issues), for bugs in this SDK only

## License

Released under the [MIT License](LICENSE). Copyright © 2021–2026 Elastic Email.
