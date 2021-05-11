# NAME

ElasticEmail::Role - a Moose role for the Elastic Email REST API

This API is based on the REST API architecture, allowing the user to easily manage their data with this resource-based approach.

Every API call is established on which specific request type (GET, POST, PUT, DELETE) will be used.

To start using this API, you will need your Access Token (available <a href=\"https://elasticemail.com/account#/settings/new/manage-api\">here</a>). Remember to keep it safe. Required access levels are listed in the given request’s description.

This is the documentation for REST API. If you’d like to read our legacy documentation regarding Web API v2 click <a href=\"https://api.elasticemail.com/public/help\">here</a>.

# VERSION

Automatically generated by the [OpenAPI Generator](https://openapi-generator.tech) project:

- API version: 4.0.0
- Package version: 4.0.0
- Build package: org.openapitools.codegen.languages.PerlClientCodegen

## A note on Moose

This role is the only component of the library that uses Moose. See
ElasticEmail::ApiFactory for non-Moosey usage.

# SYNOPSIS

The Perl Generator in the OpenAPI Generator project builds a library of Perl modules to interact with
a web service defined by a OpenAPI Specification. See below for how to build the
library.

This module provides an interface to the generated library. All the classes,
objects, and methods (well, not quite \*all\*, see below) are flattened into this
role.

        package MyApp;
        use Moose;
        with 'ElasticEmail::Role';

        package main;

        my $api = MyApp->new({ tokens => $tokens });

        my $pet = $api->get_pet_by_id(pet_id => $pet_id);


## Structure of the library

The library consists of a set of API classes, one for each endpoint. These APIs
implement the method calls available on each endpoint.

Additionally, there is a set of "object" classes, which represent the objects
returned by and sent to the methods on the endpoints.

An API factory class is provided, which builds instances of each endpoint API.

This Moose role flattens all the methods from the endpoint APIs onto the consuming
class. It also provides methods to retrieve the endpoint API objects, and the API
factory object, should you need it.

For documentation of all these methods, see AUTOMATIC DOCUMENTATION below.

## Configuring authentication

In the normal case, the OpenAPI Spec will describe what parameters are
required and where to put them. You just need to supply the tokens.

    my $tokens = {
        # basic
        username => $username,
        password => $password,

        # oauth
        access_token => $oauth_token,

        # keys
        $some_key => { token => $token,
                       prefix => $prefix,
                       in => $in,             # 'head||query',
                       },

        $another => { token => $token,
                      prefix => $prefix,
                      in => $in,              # 'head||query',
                      },
        ...,

        };

        my $api = MyApp->new({ tokens => $tokens });

Note these are all optional, as are `prefix` and `in`, and depend on the API
you are accessing. Usually `prefix` and `in` will be determined by the code generator from
the spec and you will not need to set them at run time. If not, `in` will
default to 'head' and `prefix` to the empty string.

The tokens will be placed in a L<ElasticEmail::Configuration> instance
as follows, but you don't need to know about this.

- `$cfg->{username}`

    String. The username for basic auth.

- `$cfg->{password}`

    String. The password for basic auth.

- `$cfg->{api_key}`

    Hashref. Keyed on the name of each key (there can be multiple tokens).

            $cfg->{api_key} = {
                    secretKey => 'aaaabbbbccccdddd',
                    anotherKey => '1111222233334444',
                    };

- `$cfg->{api_key_prefix}`

    Hashref. Keyed on the name of each key (there can be multiple tokens). Note not
    all api keys require a prefix.

            $cfg->{api_key_prefix} = {
                    secretKey => 'string',
                    anotherKey => 'same or some other string',
                    };

- `$cfg->{access_token}`

    String. The OAuth access token.

# METHODS

## `base_url`

The generated code has the `base_url` already set as a default value. This method
returns the current value of `base_url`.

## `api_factory`

Returns an API factory object. You probably won't need to call this directly.

        $self->api_factory('Pet'); # returns a ElasticEmail::PetApi instance

        $self->pet_api;            # the same

# MISSING METHODS

Most of the methods on the API are delegated to individual endpoint API objects
(e.g. Pet API, Store API, User API etc). Where different endpoint APIs use the
same method name (e.g. `new()`), these methods can't be delegated. So you need
to call `$api->pet_api->new()`.

In principle, every API is susceptible to the presence of a few, random, undelegatable
method names. In practice, because of the way method names are constructed, it's
unlikely in general that any methods will be undelegatable, except for:

        new()
        class_documentation()
        method_documentation()

To call these methods, you need to get a handle on the relevant object, either
by calling `$api->foo_api` or by retrieving an object, e.g.
`$api->get_pet_by_id(pet_id => $pet_id)`. They are class methods, so
you could also call them on class names.

# BUILDING YOUR LIBRARY

See the homepage `https://openapi-generator.tech` for full details.
But briefly, clone the git repository, build the codegen codebase, set up your build
config file, then run the API build script. You will need git, Java 7 or 8 and Apache
maven 3.0.3 or better already installed.

The config file should specify the project name for the generated library:

        {"moduleName":"WWW::MyProjectName"}

Your library files will be built under `WWW::MyProjectName`.

          $ git clone https://github.com/openapitools/openapi-generator
          $ cd openapi-generator
          $ mvn package
          $ java -jar modules/openapi-generator-cli/target/openapi-generator-cli.jar generate \
    -i [URL or file path to JSON OpenAPI API spec] \
    -g perl \
    -c /path/to/config/file.json \
    -o /path/to/output/folder

Bang, all done. Run the `autodoc` script in the `bin` directory to see the API
you just built.

# AUTOMATIC DOCUMENTATION

You can print out a summary of the generated API by running the included
`autodoc` script in the `bin` directory of your generated library. A few
output formats are supported:

          Usage: autodoc [OPTION]

    -w           wide format (default)
    -n           narrow format
    -p           POD format
    -H           HTML format
    -m           Markdown format
    -h           print this help message
    -c           your application class


The `-c` option allows you to load and inspect your own application. A dummy
namespace is used if you don't supply your own class.

# DOCUMENTATION FROM THE OpenAPI Spec

Additional documentation for each class and method may be provided by the OpenAPI
spec. If so, this is available via the `class_documentation()` and
`method_documentation()` methods on each generated object class, and the
`method_documentation()` method on the endpoint API classes:

        my $cmdoc = $api->pet_api->method_documentation->{$method_name};

        my $odoc = $api->get_pet_by_id->(pet_id => $pet_id)->class_documentation;
        my $omdoc = $api->get_pet_by_id->(pet_id => $pet_id)->method_documentation->{method_name};


Each of these calls returns a hashref with various useful pieces of information.

# LOAD THE MODULES

To load the API packages:
```perl
use ElasticEmail::CampaignsApi;
use ElasticEmail::ContactsApi;
use ElasticEmail::EmailsApi;
use ElasticEmail::EventsApi;
use ElasticEmail::FilesApi;
use ElasticEmail::InboundRouteApi;
use ElasticEmail::ListsApi;
use ElasticEmail::SecurityApi;
use ElasticEmail::SegmentsApi;
use ElasticEmail::StatisticsApi;
use ElasticEmail::SubAccountsApi;
use ElasticEmail::SuppressionsApi;
use ElasticEmail::TemplatesApi;
use ElasticEmail::VerificationsApi;

```

To load the models:
```perl
use ElasticEmail::Object::AccessLevel;
use ElasticEmail::Object::AccountStatusEnum;
use ElasticEmail::Object::ApiKey;
use ElasticEmail::Object::ApiKeyPayload;
use ElasticEmail::Object::BodyContentType;
use ElasticEmail::Object::BodyPart;
use ElasticEmail::Object::Campaign;
use ElasticEmail::Object::CampaignOptions;
use ElasticEmail::Object::CampaignRecipient;
use ElasticEmail::Object::CampaignStatus;
use ElasticEmail::Object::CampaignTemplate;
use ElasticEmail::Object::ChannelLogStatusSummary;
use ElasticEmail::Object::CompressionFormat;
use ElasticEmail::Object::ConsentData;
use ElasticEmail::Object::ConsentTracking;
use ElasticEmail::Object::Contact;
use ElasticEmail::Object::ContactActivity;
use ElasticEmail::Object::ContactHistEventType;
use ElasticEmail::Object::ContactHistory;
use ElasticEmail::Object::ContactPayload;
use ElasticEmail::Object::ContactSource;
use ElasticEmail::Object::ContactStatus;
use ElasticEmail::Object::ContactUpdatePayload;
use ElasticEmail::Object::ContactsList;
use ElasticEmail::Object::DeliveryOptimizationType;
use ElasticEmail::Object::EmailContent;
use ElasticEmail::Object::EmailData;
use ElasticEmail::Object::EmailMessageData;
use ElasticEmail::Object::EmailRecipient;
use ElasticEmail::Object::EmailSend;
use ElasticEmail::Object::EmailStatus;
use ElasticEmail::Object::EmailTransactionalMessageData;
use ElasticEmail::Object::EmailValidationResult;
use ElasticEmail::Object::EmailValidationStatus;
use ElasticEmail::Object::EmailView;
use ElasticEmail::Object::EmailsPayload;
use ElasticEmail::Object::EncodingType;
use ElasticEmail::Object::EventType;
use ElasticEmail::Object::EventsOrderBy;
use ElasticEmail::Object::ExportFileFormats;
use ElasticEmail::Object::ExportLink;
use ElasticEmail::Object::ExportStatus;
use ElasticEmail::Object::FileInfo;
use ElasticEmail::Object::FilePayload;
use ElasticEmail::Object::FileUploadResult;
use ElasticEmail::Object::InboundPayload;
use ElasticEmail::Object::InboundRoute;
use ElasticEmail::Object::InboundRouteActionType;
use ElasticEmail::Object::InboundRouteFilterType;
use ElasticEmail::Object::ListPayload;
use ElasticEmail::Object::ListUpdatePayload;
use ElasticEmail::Object::LogJobStatus;
use ElasticEmail::Object::LogStatusSummary;
use ElasticEmail::Object::MergeEmailPayload;
use ElasticEmail::Object::MessageAttachment;
use ElasticEmail::Object::MessageCategory;
use ElasticEmail::Object::NewApiKey;
use ElasticEmail::Object::NewSmtpCredentials;
use ElasticEmail::Object::Options;
use ElasticEmail::Object::RecipientEvent;
use ElasticEmail::Object::Segment;
use ElasticEmail::Object::SegmentPayload;
use ElasticEmail::Object::SmtpCredentials;
use ElasticEmail::Object::SmtpCredentialsPayload;
use ElasticEmail::Object::SortOrderItem;
use ElasticEmail::Object::SplitOptimizationType;
use ElasticEmail::Object::SplitOptions;
use ElasticEmail::Object::SubAccountInfo;
use ElasticEmail::Object::SubaccountEmailCreditsPayload;
use ElasticEmail::Object::SubaccountEmailSettings;
use ElasticEmail::Object::SubaccountEmailSettingsPayload;
use ElasticEmail::Object::SubaccountPayload;
use ElasticEmail::Object::SubaccountSettingsInfo;
use ElasticEmail::Object::SubaccountSettingsInfoPayload;
use ElasticEmail::Object::Suppression;
use ElasticEmail::Object::Template;
use ElasticEmail::Object::TemplatePayload;
use ElasticEmail::Object::TemplateScopeType;
use ElasticEmail::Object::TemplateType;
use ElasticEmail::Object::TransactionalRecipient;
use ElasticEmail::Object::Utm;
use ElasticEmail::Object::VerificationFileResult;
use ElasticEmail::Object::VerificationFileResultDetails;
use ElasticEmail::Object::VerificationStatus;

````

# GETTING STARTED
Put the Perl SDK under the 'lib' folder in your project directory, then run the following
```perl
#!/usr/bin/perl
use lib 'lib';
use strict;
use warnings;
# load the API package
use ElasticEmail::CampaignsApi;
use ElasticEmail::ContactsApi;
use ElasticEmail::EmailsApi;
use ElasticEmail::EventsApi;
use ElasticEmail::FilesApi;
use ElasticEmail::InboundRouteApi;
use ElasticEmail::ListsApi;
use ElasticEmail::SecurityApi;
use ElasticEmail::SegmentsApi;
use ElasticEmail::StatisticsApi;
use ElasticEmail::SubAccountsApi;
use ElasticEmail::SuppressionsApi;
use ElasticEmail::TemplatesApi;
use ElasticEmail::VerificationsApi;

# load the models
use ElasticEmail::Object::AccessLevel;
use ElasticEmail::Object::AccountStatusEnum;
use ElasticEmail::Object::ApiKey;
use ElasticEmail::Object::ApiKeyPayload;
use ElasticEmail::Object::BodyContentType;
use ElasticEmail::Object::BodyPart;
use ElasticEmail::Object::Campaign;
use ElasticEmail::Object::CampaignOptions;
use ElasticEmail::Object::CampaignRecipient;
use ElasticEmail::Object::CampaignStatus;
use ElasticEmail::Object::CampaignTemplate;
use ElasticEmail::Object::ChannelLogStatusSummary;
use ElasticEmail::Object::CompressionFormat;
use ElasticEmail::Object::ConsentData;
use ElasticEmail::Object::ConsentTracking;
use ElasticEmail::Object::Contact;
use ElasticEmail::Object::ContactActivity;
use ElasticEmail::Object::ContactHistEventType;
use ElasticEmail::Object::ContactHistory;
use ElasticEmail::Object::ContactPayload;
use ElasticEmail::Object::ContactSource;
use ElasticEmail::Object::ContactStatus;
use ElasticEmail::Object::ContactUpdatePayload;
use ElasticEmail::Object::ContactsList;
use ElasticEmail::Object::DeliveryOptimizationType;
use ElasticEmail::Object::EmailContent;
use ElasticEmail::Object::EmailData;
use ElasticEmail::Object::EmailMessageData;
use ElasticEmail::Object::EmailRecipient;
use ElasticEmail::Object::EmailSend;
use ElasticEmail::Object::EmailStatus;
use ElasticEmail::Object::EmailTransactionalMessageData;
use ElasticEmail::Object::EmailValidationResult;
use ElasticEmail::Object::EmailValidationStatus;
use ElasticEmail::Object::EmailView;
use ElasticEmail::Object::EmailsPayload;
use ElasticEmail::Object::EncodingType;
use ElasticEmail::Object::EventType;
use ElasticEmail::Object::EventsOrderBy;
use ElasticEmail::Object::ExportFileFormats;
use ElasticEmail::Object::ExportLink;
use ElasticEmail::Object::ExportStatus;
use ElasticEmail::Object::FileInfo;
use ElasticEmail::Object::FilePayload;
use ElasticEmail::Object::FileUploadResult;
use ElasticEmail::Object::InboundPayload;
use ElasticEmail::Object::InboundRoute;
use ElasticEmail::Object::InboundRouteActionType;
use ElasticEmail::Object::InboundRouteFilterType;
use ElasticEmail::Object::ListPayload;
use ElasticEmail::Object::ListUpdatePayload;
use ElasticEmail::Object::LogJobStatus;
use ElasticEmail::Object::LogStatusSummary;
use ElasticEmail::Object::MergeEmailPayload;
use ElasticEmail::Object::MessageAttachment;
use ElasticEmail::Object::MessageCategory;
use ElasticEmail::Object::NewApiKey;
use ElasticEmail::Object::NewSmtpCredentials;
use ElasticEmail::Object::Options;
use ElasticEmail::Object::RecipientEvent;
use ElasticEmail::Object::Segment;
use ElasticEmail::Object::SegmentPayload;
use ElasticEmail::Object::SmtpCredentials;
use ElasticEmail::Object::SmtpCredentialsPayload;
use ElasticEmail::Object::SortOrderItem;
use ElasticEmail::Object::SplitOptimizationType;
use ElasticEmail::Object::SplitOptions;
use ElasticEmail::Object::SubAccountInfo;
use ElasticEmail::Object::SubaccountEmailCreditsPayload;
use ElasticEmail::Object::SubaccountEmailSettings;
use ElasticEmail::Object::SubaccountEmailSettingsPayload;
use ElasticEmail::Object::SubaccountPayload;
use ElasticEmail::Object::SubaccountSettingsInfo;
use ElasticEmail::Object::SubaccountSettingsInfoPayload;
use ElasticEmail::Object::Suppression;
use ElasticEmail::Object::Template;
use ElasticEmail::Object::TemplatePayload;
use ElasticEmail::Object::TemplateScopeType;
use ElasticEmail::Object::TemplateType;
use ElasticEmail::Object::TransactionalRecipient;
use ElasticEmail::Object::Utm;
use ElasticEmail::Object::VerificationFileResult;
use ElasticEmail::Object::VerificationFileResultDetails;
use ElasticEmail::Object::VerificationStatus;

# for displaying the API response data
use Data::Dumper;
use ElasticEmail::;

my $api_instance = ElasticEmail::->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "name_example"; # string | Name of Campaign to delete

eval {
    $api_instance->campaigns_by_name_delete(name => $name);
};
if ($@) {
    warn "Exception when calling CampaignsApi->campaigns_by_name_delete: $@\n";
}

```

# DOCUMENTATION FOR API ENDPOINTS

All URIs are relative to *https://api.elasticemail.com/v4*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*CampaignsApi* | [**campaigns_by_name_delete**](docs/CampaignsApi.md#campaigns_by_name_delete) | **DELETE** /campaigns/{name} | Delete Campaign
*CampaignsApi* | [**campaigns_by_name_get**](docs/CampaignsApi.md#campaigns_by_name_get) | **GET** /campaigns/{name} | Load Campaign
*CampaignsApi* | [**campaigns_by_name_put**](docs/CampaignsApi.md#campaigns_by_name_put) | **PUT** /campaigns/{name} | Update Campaign
*CampaignsApi* | [**campaigns_get**](docs/CampaignsApi.md#campaigns_get) | **GET** /campaigns | Load Campaigns
*CampaignsApi* | [**campaigns_post**](docs/CampaignsApi.md#campaigns_post) | **POST** /campaigns | Add Campaign
*ContactsApi* | [**contacts_by_email_delete**](docs/ContactsApi.md#contacts_by_email_delete) | **DELETE** /contacts/{email} | Delete Contact
*ContactsApi* | [**contacts_by_email_get**](docs/ContactsApi.md#contacts_by_email_get) | **GET** /contacts/{email} | Load Contact
*ContactsApi* | [**contacts_by_email_history_get**](docs/ContactsApi.md#contacts_by_email_history_get) | **GET** /contacts/{email}/history | Load History
*ContactsApi* | [**contacts_by_email_put**](docs/ContactsApi.md#contacts_by_email_put) | **PUT** /contacts/{email} | Update Contact
*ContactsApi* | [**contacts_delete_post**](docs/ContactsApi.md#contacts_delete_post) | **POST** /contacts/delete | Delete Contacts Bulk
*ContactsApi* | [**contacts_export_by_id_status_get**](docs/ContactsApi.md#contacts_export_by_id_status_get) | **GET** /contacts/export/{id}/status | Check Export Status
*ContactsApi* | [**contacts_export_post**](docs/ContactsApi.md#contacts_export_post) | **POST** /contacts/export | Export Contacts
*ContactsApi* | [**contacts_get**](docs/ContactsApi.md#contacts_get) | **GET** /contacts | Load Contacts
*ContactsApi* | [**contacts_import_post**](docs/ContactsApi.md#contacts_import_post) | **POST** /contacts/import | Upload Contacts
*ContactsApi* | [**contacts_post**](docs/ContactsApi.md#contacts_post) | **POST** /contacts | Add Contact
*EmailsApi* | [**emails_by_msgid_view_get**](docs/EmailsApi.md#emails_by_msgid_view_get) | **GET** /emails/{msgid}/view | View Email
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
*VerificationsApi* | [**verifications_files_post**](docs/VerificationsApi.md#verifications_files_post) | **POST** /verifications/files | Verify From File
*VerificationsApi* | [**verifications_files_result_get**](docs/VerificationsApi.md#verifications_files_result_get) | **GET** /verifications/files/result | Get Simple Files Verification Results
*VerificationsApi* | [**verifications_get**](docs/VerificationsApi.md#verifications_get) | **GET** /verifications | Get Emails Verification Results


# DOCUMENTATION FOR MODELS
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
 - [ElasticEmail::Object::ChannelLogStatusSummary](docs/ChannelLogStatusSummary.md)
 - [ElasticEmail::Object::CompressionFormat](docs/CompressionFormat.md)
 - [ElasticEmail::Object::ConsentData](docs/ConsentData.md)
 - [ElasticEmail::Object::ConsentTracking](docs/ConsentTracking.md)
 - [ElasticEmail::Object::Contact](docs/Contact.md)
 - [ElasticEmail::Object::ContactActivity](docs/ContactActivity.md)
 - [ElasticEmail::Object::ContactHistEventType](docs/ContactHistEventType.md)
 - [ElasticEmail::Object::ContactHistory](docs/ContactHistory.md)
 - [ElasticEmail::Object::ContactPayload](docs/ContactPayload.md)
 - [ElasticEmail::Object::ContactSource](docs/ContactSource.md)
 - [ElasticEmail::Object::ContactStatus](docs/ContactStatus.md)
 - [ElasticEmail::Object::ContactUpdatePayload](docs/ContactUpdatePayload.md)
 - [ElasticEmail::Object::ContactsList](docs/ContactsList.md)
 - [ElasticEmail::Object::DeliveryOptimizationType](docs/DeliveryOptimizationType.md)
 - [ElasticEmail::Object::EmailContent](docs/EmailContent.md)
 - [ElasticEmail::Object::EmailData](docs/EmailData.md)
 - [ElasticEmail::Object::EmailMessageData](docs/EmailMessageData.md)
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
 - [ElasticEmail::Object::TemplateScopeType](docs/TemplateScopeType.md)
 - [ElasticEmail::Object::TemplateType](docs/TemplateType.md)
 - [ElasticEmail::Object::TransactionalRecipient](docs/TransactionalRecipient.md)
 - [ElasticEmail::Object::Utm](docs/Utm.md)
 - [ElasticEmail::Object::VerificationFileResult](docs/VerificationFileResult.md)
 - [ElasticEmail::Object::VerificationFileResultDetails](docs/VerificationFileResultDetails.md)
 - [ElasticEmail::Object::VerificationStatus](docs/VerificationStatus.md)


# DOCUMENTATION FOR AUTHORIZATION

## apikey

- **Type**: API key
- **API key parameter name**: X-ElasticEmail-ApiKey
- **Location**: HTTP header
