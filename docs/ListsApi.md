# ElasticEmail::ListsApi

## Load the API package
```perl
use ElasticEmail::Object::ListsApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**lists_by_listname_contacts_get**](ListsApi.md#lists_by_listname_contacts_get) | **GET** /lists/{listname}/contacts | Load Contacts in List
[**lists_by_name_contacts_post**](ListsApi.md#lists_by_name_contacts_post) | **POST** /lists/{name}/contacts | Add Contacts to List
[**lists_by_name_contacts_remove_post**](ListsApi.md#lists_by_name_contacts_remove_post) | **POST** /lists/{name}/contacts/remove | Remove Contacts from List
[**lists_by_name_delete**](ListsApi.md#lists_by_name_delete) | **DELETE** /lists/{name} | Delete List
[**lists_by_name_get**](ListsApi.md#lists_by_name_get) | **GET** /lists/{name} | Load List
[**lists_by_name_put**](ListsApi.md#lists_by_name_put) | **PUT** /lists/{name} | Update List
[**lists_get**](ListsApi.md#lists_get) | **GET** /lists | Load Lists
[**lists_post**](ListsApi.md#lists_post) | **POST** /lists | Add List


# **lists_by_listname_contacts_get**
> ARRAY[Contact] lists_by_listname_contacts_get(listname => $listname, limit => $limit, offset => $offset)

Load Contacts in List

Returns a list of contacts. Required Access Level: ViewContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ListsApi;
my $api_instance = ElasticEmail::ListsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $listname = My List 1; # string | Name of your list.
my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->lists_by_listname_contacts_get(listname => $listname, limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ListsApi->lists_by_listname_contacts_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **listname** | **string**| Name of your list. | 
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

# **lists_by_name_contacts_post**
> ContactsList lists_by_name_contacts_post(name => $name, emails_payload => $emails_payload)

Add Contacts to List

Add existing Contacts to specified list. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ListsApi;
my $api_instance = ElasticEmail::ListsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = My List 1; # string | Name of your list.
my $emails_payload = ElasticEmail::Object::EmailsPayload->new(); # EmailsPayload | Provide either rule or a list of emails, not both.

eval {
    my $result = $api_instance->lists_by_name_contacts_post(name => $name, emails_payload => $emails_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ListsApi->lists_by_name_contacts_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of your list. | 
 **emails_payload** | [**EmailsPayload**](EmailsPayload.md)| Provide either rule or a list of emails, not both. | 

### Return type

[**ContactsList**](ContactsList.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lists_by_name_contacts_remove_post**
> lists_by_name_contacts_remove_post(name => $name, emails_payload => $emails_payload)

Remove Contacts from List

Remove specified Contacts from your list. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ListsApi;
my $api_instance = ElasticEmail::ListsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = My List 1; # string | Name of your list.
my $emails_payload = ElasticEmail::Object::EmailsPayload->new(); # EmailsPayload | Provide either rule or a list of emails, not both.

eval {
    $api_instance->lists_by_name_contacts_remove_post(name => $name, emails_payload => $emails_payload);
};
if ($@) {
    warn "Exception when calling ListsApi->lists_by_name_contacts_remove_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of your list. | 
 **emails_payload** | [**EmailsPayload**](EmailsPayload.md)| Provide either rule or a list of emails, not both. | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lists_by_name_delete**
> lists_by_name_delete(name => $name)

Delete List

Deletes List and removes all the Contacts from it (does not delete Contacts). Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ListsApi;
my $api_instance = ElasticEmail::ListsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = My List 1; # string | Name of your list.

eval {
    $api_instance->lists_by_name_delete(name => $name);
};
if ($@) {
    warn "Exception when calling ListsApi->lists_by_name_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of your list. | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lists_by_name_get**
> ContactsList lists_by_name_get(name => $name)

Load List

Returns detailed information about specified list. Required Access Level: ViewContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ListsApi;
my $api_instance = ElasticEmail::ListsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = My List 1; # string | Name of your list.

eval {
    my $result = $api_instance->lists_by_name_get(name => $name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ListsApi->lists_by_name_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of your list. | 

### Return type

[**ContactsList**](ContactsList.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lists_by_name_put**
> ContactsList lists_by_name_put(name => $name, list_update_payload => $list_update_payload)

Update List

Update existing list. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ListsApi;
my $api_instance = ElasticEmail::ListsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = My List 1; # string | Name of your list.
my $list_update_payload = ElasticEmail::Object::ListUpdatePayload->new(); # ListUpdatePayload | 

eval {
    my $result = $api_instance->lists_by_name_put(name => $name, list_update_payload => $list_update_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ListsApi->lists_by_name_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of your list. | 
 **list_update_payload** | [**ListUpdatePayload**](ListUpdatePayload.md)|  | 

### Return type

[**ContactsList**](ContactsList.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lists_get**
> ARRAY[ContactsList] lists_get(limit => $limit, offset => $offset)

Load Lists

Returns all your existing lists. Required Access Level: ViewContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ListsApi;
my $api_instance = ElasticEmail::ListsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->lists_get(limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ListsApi->lists_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[ContactsList]**](ContactsList.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **lists_post**
> ContactsList lists_post(list_payload => $list_payload)

Add List

Add a new list. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::ListsApi;
my $api_instance = ElasticEmail::ListsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $list_payload = ElasticEmail::Object::ListPayload->new(); # ListPayload | 

eval {
    my $result = $api_instance->lists_post(list_payload => $list_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ListsApi->lists_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **list_payload** | [**ListPayload**](ListPayload.md)|  | 

### Return type

[**ContactsList**](ContactsList.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

