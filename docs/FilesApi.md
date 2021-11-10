# ElasticEmail::FilesApi

## Load the API package
```perl
use ElasticEmail::Object::FilesApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**files_by_name_delete**](FilesApi.md#files_by_name_delete) | **DELETE** /files/{name} | Delete File
[**files_by_name_get**](FilesApi.md#files_by_name_get) | **GET** /files/{name} | Download File
[**files_by_name_info_get**](FilesApi.md#files_by_name_info_get) | **GET** /files/{name}/info | Load File Details
[**files_get**](FilesApi.md#files_get) | **GET** /files | List Files
[**files_post**](FilesApi.md#files_post) | **POST** /files | Upload File


# **files_by_name_delete**
> files_by_name_delete(name => $name)

Delete File

Permanently deletes the file from your Account. Required Access Level: ModifyFiles

### Example
```perl
use Data::Dumper;
use ElasticEmail::FilesApi;
my $api_instance = ElasticEmail::FilesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = filename.txt; # string | Name of your file including extension.

eval {
    $api_instance->files_by_name_delete(name => $name);
};
if ($@) {
    warn "Exception when calling FilesApi->files_by_name_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of your file including extension. | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **files_by_name_get**
> string files_by_name_get(name => $name)

Download File

Gets content of the specified File. Required Access Level: ViewFiles

### Example
```perl
use Data::Dumper;
use ElasticEmail::FilesApi;
my $api_instance = ElasticEmail::FilesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = filename.txt; # string | Name of your file including extension.

eval {
    my $result = $api_instance->files_by_name_get(name => $name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling FilesApi->files_by_name_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of your file including extension. | 

### Return type

**string**

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **files_by_name_info_get**
> FileInfo files_by_name_info_get(name => $name)

Load File Details

Returns the specified File's details. Required Access Level: ViewFiles

### Example
```perl
use Data::Dumper;
use ElasticEmail::FilesApi;
my $api_instance = ElasticEmail::FilesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = filename.txt; # string | Name of your file including extension.

eval {
    my $result = $api_instance->files_by_name_info_get(name => $name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling FilesApi->files_by_name_info_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of your file including extension. | 

### Return type

[**FileInfo**](FileInfo.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **files_get**
> ARRAY[FileInfo] files_get(limit => $limit, offset => $offset)

List Files

Returns a list of all your available files. Required Access Level: ViewFiles

### Example
```perl
use Data::Dumper;
use ElasticEmail::FilesApi;
my $api_instance = ElasticEmail::FilesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->files_get(limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling FilesApi->files_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[FileInfo]**](FileInfo.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **files_post**
> FileInfo files_post(file_payload => $file_payload, expires_after_days => $expires_after_days)

Upload File

Uploads selected file to the server. Required Access Level: ModifyFiles

### Example
```perl
use Data::Dumper;
use ElasticEmail::FilesApi;
my $api_instance = ElasticEmail::FilesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $file_payload = ElasticEmail::Object::FilePayload->new(); # FilePayload | 
my $expires_after_days = 56; # int | After how many days should the file be deleted.

eval {
    my $result = $api_instance->files_post(file_payload => $file_payload, expires_after_days => $expires_after_days);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling FilesApi->files_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file_payload** | [**FilePayload**](FilePayload.md)|  | 
 **expires_after_days** | **int**| After how many days should the file be deleted. | [optional] 

### Return type

[**FileInfo**](FileInfo.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

