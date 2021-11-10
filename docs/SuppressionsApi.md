# ElasticEmail::SuppressionsApi

## Load the API package
```perl
use ElasticEmail::Object::SuppressionsApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**suppressions_bounces_get**](SuppressionsApi.md#suppressions_bounces_get) | **GET** /suppressions/bounces | Get Bounce List
[**suppressions_bounces_import_post**](SuppressionsApi.md#suppressions_bounces_import_post) | **POST** /suppressions/bounces/import | Add Bounces Async
[**suppressions_bounces_post**](SuppressionsApi.md#suppressions_bounces_post) | **POST** /suppressions/bounces | Add Bounces
[**suppressions_by_email_delete**](SuppressionsApi.md#suppressions_by_email_delete) | **DELETE** /suppressions/{email} | Delete Suppression
[**suppressions_by_email_get**](SuppressionsApi.md#suppressions_by_email_get) | **GET** /suppressions/{email} | Get Suppression
[**suppressions_complaints_get**](SuppressionsApi.md#suppressions_complaints_get) | **GET** /suppressions/complaints | Get Complaints List
[**suppressions_complaints_import_post**](SuppressionsApi.md#suppressions_complaints_import_post) | **POST** /suppressions/complaints/import | Add Complaints Async
[**suppressions_complaints_post**](SuppressionsApi.md#suppressions_complaints_post) | **POST** /suppressions/complaints | Add Complaints
[**suppressions_get**](SuppressionsApi.md#suppressions_get) | **GET** /suppressions | Get Suppressions
[**suppressions_unsubscribes_get**](SuppressionsApi.md#suppressions_unsubscribes_get) | **GET** /suppressions/unsubscribes | Get Unsubscribes List
[**suppressions_unsubscribes_import_post**](SuppressionsApi.md#suppressions_unsubscribes_import_post) | **POST** /suppressions/unsubscribes/import | Add Unsubscribes Async
[**suppressions_unsubscribes_post**](SuppressionsApi.md#suppressions_unsubscribes_post) | **POST** /suppressions/unsubscribes | Add Unsubscribes


# **suppressions_bounces_get**
> ARRAY[Suppression] suppressions_bounces_get(search => $search, limit => $limit, offset => $offset)

Get Bounce List

Retrieve your list of bounced emails. Required Access Level: ViewContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SuppressionsApi;
my $api_instance = ElasticEmail::SuppressionsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $search = text; # string | Text fragment used for searching.
my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->suppressions_bounces_get(search => $search, limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SuppressionsApi->suppressions_bounces_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **string**| Text fragment used for searching. | [optional] 
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **suppressions_bounces_import_post**
> suppressions_bounces_import_post(file => $file)

Add Bounces Async

Add Bounced. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SuppressionsApi;
my $api_instance = ElasticEmail::SuppressionsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $file = "/path/to/file"; # string | 

eval {
    $api_instance->suppressions_bounces_import_post(file => $file);
};
if ($@) {
    warn "Exception when calling SuppressionsApi->suppressions_bounces_import_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **string****string**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **suppressions_bounces_post**
> ARRAY[Suppression] suppressions_bounces_post(request_body => $request_body)

Add Bounces

Add Bounced. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SuppressionsApi;
my $api_instance = ElasticEmail::SuppressionsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $request_body = [ElasticEmail::Object::ARRAY[string]->new()]; # ARRAY[string] | Emails to add as bounces. Limited to 1000 per request

eval {
    my $result = $api_instance->suppressions_bounces_post(request_body => $request_body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SuppressionsApi->suppressions_bounces_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request_body** | [**ARRAY[string]**](string.md)| Emails to add as bounces. Limited to 1000 per request | 

### Return type

[**ARRAY[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **suppressions_by_email_delete**
> suppressions_by_email_delete(email => $email)

Delete Suppression

Delete Suppression. Required Access Level: ViewContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SuppressionsApi;
my $api_instance = ElasticEmail::SuppressionsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = mail@example.com; # string | Proper email address.

eval {
    $api_instance->suppressions_by_email_delete(email => $email);
};
if ($@) {
    warn "Exception when calling SuppressionsApi->suppressions_by_email_delete: $@\n";
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

# **suppressions_by_email_get**
> Suppression suppressions_by_email_get(email => $email)

Get Suppression

Retrieve your suppression. Required Access Level: ViewContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SuppressionsApi;
my $api_instance = ElasticEmail::SuppressionsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = mail@example.com; # string | Proper email address.

eval {
    my $result = $api_instance->suppressions_by_email_get(email => $email);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SuppressionsApi->suppressions_by_email_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string**| Proper email address. | 

### Return type

[**Suppression**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **suppressions_complaints_get**
> ARRAY[Suppression] suppressions_complaints_get(search => $search, limit => $limit, offset => $offset)

Get Complaints List

Retrieve your list of complaints. Required Access Level: ViewContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SuppressionsApi;
my $api_instance = ElasticEmail::SuppressionsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $search = text; # string | Text fragment used for searching.
my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->suppressions_complaints_get(search => $search, limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SuppressionsApi->suppressions_complaints_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **string**| Text fragment used for searching. | [optional] 
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **suppressions_complaints_import_post**
> suppressions_complaints_import_post(file => $file)

Add Complaints Async

Add Complaints. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SuppressionsApi;
my $api_instance = ElasticEmail::SuppressionsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $file = "/path/to/file"; # string | 

eval {
    $api_instance->suppressions_complaints_import_post(file => $file);
};
if ($@) {
    warn "Exception when calling SuppressionsApi->suppressions_complaints_import_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **string****string**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **suppressions_complaints_post**
> ARRAY[Suppression] suppressions_complaints_post(request_body => $request_body)

Add Complaints

Add Complaints. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SuppressionsApi;
my $api_instance = ElasticEmail::SuppressionsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $request_body = [ElasticEmail::Object::ARRAY[string]->new()]; # ARRAY[string] | Emails to add as complaints. Limited to 1000 per request

eval {
    my $result = $api_instance->suppressions_complaints_post(request_body => $request_body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SuppressionsApi->suppressions_complaints_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request_body** | [**ARRAY[string]**](string.md)| Emails to add as complaints. Limited to 1000 per request | 

### Return type

[**ARRAY[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **suppressions_get**
> ARRAY[Suppression] suppressions_get(limit => $limit, offset => $offset)

Get Suppressions

Retrieve your suppressions. Required Access Level: ViewContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SuppressionsApi;
my $api_instance = ElasticEmail::SuppressionsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->suppressions_get(limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SuppressionsApi->suppressions_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **suppressions_unsubscribes_get**
> ARRAY[Suppression] suppressions_unsubscribes_get(search => $search, limit => $limit, offset => $offset)

Get Unsubscribes List

Retrieve your list of unsubscribes. Required Access Level: ViewContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SuppressionsApi;
my $api_instance = ElasticEmail::SuppressionsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $search = text; # string | Text fragment used for searching.
my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->suppressions_unsubscribes_get(search => $search, limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SuppressionsApi->suppressions_unsubscribes_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **string**| Text fragment used for searching. | [optional] 
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **suppressions_unsubscribes_import_post**
> suppressions_unsubscribes_import_post(file => $file)

Add Unsubscribes Async

Add Unsubscribes. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SuppressionsApi;
my $api_instance = ElasticEmail::SuppressionsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $file = "/path/to/file"; # string | 

eval {
    $api_instance->suppressions_unsubscribes_import_post(file => $file);
};
if ($@) {
    warn "Exception when calling SuppressionsApi->suppressions_unsubscribes_import_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **string****string**|  | [optional] 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **suppressions_unsubscribes_post**
> ARRAY[Suppression] suppressions_unsubscribes_post(request_body => $request_body)

Add Unsubscribes

Add Unsubscribes. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SuppressionsApi;
my $api_instance = ElasticEmail::SuppressionsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $request_body = [ElasticEmail::Object::ARRAY[string]->new()]; # ARRAY[string] | Emails to add as unsubscribes. Limited to 1000 per request

eval {
    my $result = $api_instance->suppressions_unsubscribes_post(request_body => $request_body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SuppressionsApi->suppressions_unsubscribes_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request_body** | [**ARRAY[string]**](string.md)| Emails to add as unsubscribes. Limited to 1000 per request | 

### Return type

[**ARRAY[Suppression]**](Suppression.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

