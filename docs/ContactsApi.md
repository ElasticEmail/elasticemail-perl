# ElasticEmail::ContactsApi

## Load the API package
```perl
use ElasticEmail::Object::ContactsApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**contacts_by_email_delete**](ContactsApi.md#contacts_by_email_delete) | **DELETE** /contacts/{email} | Delete Contact
[**contacts_by_email_get**](ContactsApi.md#contacts_by_email_get) | **GET** /contacts/{email} | Load Contact
[**contacts_by_email_put**](ContactsApi.md#contacts_by_email_put) | **PUT** /contacts/{email} | Update Contact
[**contacts_delete_post**](ContactsApi.md#contacts_delete_post) | **POST** /contacts/delete | Delete Contacts Bulk
[**contacts_export_by_id_status_get**](ContactsApi.md#contacts_export_by_id_status_get) | **GET** /contacts/export/{id}/status | Check Export Status
[**contacts_export_post**](ContactsApi.md#contacts_export_post) | **POST** /contacts/export | Export Contacts
[**contacts_get**](ContactsApi.md#contacts_get) | **GET** /contacts | Load Contacts
[**contacts_import_post**](ContactsApi.md#contacts_import_post) | **POST** /contacts/import | Upload Contacts
[**contacts_post**](ContactsApi.md#contacts_post) | **POST** /contacts | Add Contact


# **contacts_by_email_delete**
> contacts_by_email_delete(email => $email)

Delete Contact

Deletes the provided contact. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ContactsApi;
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = mail@example.com; # string | Proper email address.

eval {
    $api_instance->contacts_by_email_delete(email => $email);
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_by_email_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string**| Proper email address. | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contacts_by_email_get**
> Contact contacts_by_email_get(email => $email)

Load Contact

Load detailed contact information for specified email. Required Access Level: ViewContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ContactsApi;
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = mail@example.com; # string | Proper email address.

eval {
    my $result = $api_instance->contacts_by_email_get(email => $email);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_by_email_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string**| Proper email address. | 

### Return type

[**Contact**](Contact.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contacts_by_email_put**
> Contact contacts_by_email_put(email => $email, contact_update_payload => $contact_update_payload)

Update Contact

Update selected contact. Omitted contact's fields will not be changed. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ContactsApi;
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = mail@example.com; # string | Proper email address.
my $contact_update_payload = ElasticEmail::Object::ContactUpdatePayload->new(); # ContactUpdatePayload | 

eval {
    my $result = $api_instance->contacts_by_email_put(email => $email, contact_update_payload => $contact_update_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_by_email_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string**| Proper email address. | 
 **contact_update_payload** | [**ContactUpdatePayload**](ContactUpdatePayload.md)|  | 

### Return type

[**Contact**](Contact.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contacts_delete_post**
> contacts_delete_post(emails_payload => $emails_payload)

Delete Contacts Bulk

Deletes provided contacts in bulk. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ContactsApi;
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $emails_payload = ElasticEmail::Object::EmailsPayload->new(); # EmailsPayload | Provide either rule or a list of emails, not both.

eval {
    $api_instance->contacts_delete_post(emails_payload => $emails_payload);
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_delete_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **emails_payload** | [**EmailsPayload**](EmailsPayload.md)| Provide either rule or a list of emails, not both. | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contacts_export_by_id_status_get**
> ExportStatus contacts_export_by_id_status_get(id => $id)

Check Export Status

Check the current status of the export. Required Access Level: Export

### Example
```perl
use Data::Dumper;
use ElasticEmail::ContactsApi;
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $id = E33EBA7A-C20D-4D3D-8F2F-5EEF42F58E6F; # string | ID of the exported file

eval {
    my $result = $api_instance->contacts_export_by_id_status_get(id => $id);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_export_by_id_status_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**| ID of the exported file | 

### Return type

[**ExportStatus**](ExportStatus.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contacts_export_post**
> ExportLink contacts_export_post(file_format => $file_format, rule => $rule, emails => $emails, compression_format => $compression_format, file_name => $file_name)

Export Contacts

Request an Export of specified Contacts. Required Access Level: Export

### Example
```perl
use Data::Dumper;
use ElasticEmail::ContactsApi;
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $file_format = new ElasticEmail.ExportFileFormats(); # ExportFileFormats | Format of the exported file
my $rule = Status%20=%20Engaged; # string | Query used for filtering.
my $emails = [["mail@contact.com,mail1@contact.com,mail2@contact.com"]]; # ARRAY[string] | Comma delimited list of contact emails
my $compression_format = new ElasticEmail.CompressionFormat(); # CompressionFormat | FileResponse compression format. None or Zip.
my $file_name = filename.txt; # string | Name of your file including extension.

eval {
    my $result = $api_instance->contacts_export_post(file_format => $file_format, rule => $rule, emails => $emails, compression_format => $compression_format, file_name => $file_name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_export_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file_format** | [**ExportFileFormats**](.md)| Format of the exported file | [optional] 
 **rule** | **string**| Query used for filtering. | [optional] 
 **emails** | [**ARRAY[string]**](string.md)| Comma delimited list of contact emails | [optional] 
 **compression_format** | [**CompressionFormat**](.md)| FileResponse compression format. None or Zip. | [optional] 
 **file_name** | **string**| Name of your file including extension. | [optional] 

### Return type

[**ExportLink**](ExportLink.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contacts_get**
> ARRAY[Contact] contacts_get(limit => $limit, offset => $offset)

Load Contacts

Returns a list of contacts. Required Access Level: ViewContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ContactsApi;
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->contacts_get(limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[Contact]**](Contact.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contacts_import_post**
> contacts_import_post(list_name => $list_name, encoding_name => $encoding_name, file_url => $file_url, file => $file)

Upload Contacts

Upload contacts from a file. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ContactsApi;
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $list_name = "list_name_example"; # string | Name of an existing list to add these contacts to
my $encoding_name = "encoding_name_example"; # string | In what encoding the file is uploaded
my $file_url = "file_url_example"; # string | Optional url of csv to import
my $file = "/path/to/file"; # string | 

eval {
    $api_instance->contacts_import_post(list_name => $list_name, encoding_name => $encoding_name, file_url => $file_url, file => $file);
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_import_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_name** | **string**| Name of an existing list to add these contacts to | [optional] 
 **encoding_name** | **string**| In what encoding the file is uploaded | [optional] 
 **file_url** | **string**| Optional url of csv to import | [optional] 
 **file** | **string****string**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **contacts_post**
> ARRAY[Contact] contacts_post(contact_payload => $contact_payload, listnames => $listnames)

Add Contact

Add new Contacts to your Lists. Up to 1000 can be added (for more please refer to the import request). Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ContactsApi;
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $contact_payload = [ElasticEmail::Object::ARRAY[ContactPayload]->new()]; # ARRAY[ContactPayload] | 
my $listnames = [("null")]; # ARRAY[string] | Names of lists to which the uploaded contacts should be added to

eval {
    my $result = $api_instance->contacts_post(contact_payload => $contact_payload, listnames => $listnames);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **contact_payload** | [**ARRAY[ContactPayload]**](ContactPayload.md)|  | 
 **listnames** | [**ARRAY[string]**](string.md)| Names of lists to which the uploaded contacts should be added to | [optional] 

### Return type

[**ARRAY[Contact]**](Contact.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

