# ElasticEmail::SegmentsApi

## Load the API package
```perl
use ElasticEmail::Object::SegmentsApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**segments_by_name_delete**](SegmentsApi.md#segments_by_name_delete) | **DELETE** /segments/{name} | Delete Segment
[**segments_by_name_get**](SegmentsApi.md#segments_by_name_get) | **GET** /segments/{name} | Load Segment
[**segments_by_name_put**](SegmentsApi.md#segments_by_name_put) | **PUT** /segments/{name} | Update Segment
[**segments_get**](SegmentsApi.md#segments_get) | **GET** /segments | Load Segments
[**segments_post**](SegmentsApi.md#segments_post) | **POST** /segments | Add Segment


# **segments_by_name_delete**
> segments_by_name_delete(name => $name)

Delete Segment

Delete an existing segment. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SegmentsApi;
my $api_instance = ElasticEmail::SegmentsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = My Segment 1; # string | Name of your segment.

eval {
    $api_instance->segments_by_name_delete(name => $name);
};
if ($@) {
    warn "Exception when calling SegmentsApi->segments_by_name_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of your segment. | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **segments_by_name_get**
> Segment segments_by_name_get(name => $name)

Load Segment

Returns details for the specified segment. Required Access Level: ViewContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SegmentsApi;
my $api_instance = ElasticEmail::SegmentsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "name_example"; # string | Name of the segment you want to load. Will load all contacts if the 'All Contacts' name has been provided

eval {
    my $result = $api_instance->segments_by_name_get(name => $name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SegmentsApi->segments_by_name_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of the segment you want to load. Will load all contacts if the &#39;All Contacts&#39; name has been provided | 

### Return type

[**Segment**](Segment.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **segments_by_name_put**
> Segment segments_by_name_put(name => $name, segment_payload => $segment_payload)

Update Segment

Rename or change RULE for your segment. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SegmentsApi;
my $api_instance = ElasticEmail::SegmentsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = My Segment 1; # string | Name of your segment.
my $segment_payload = ElasticEmail::Object::SegmentPayload->new(); # SegmentPayload | 

eval {
    my $result = $api_instance->segments_by_name_put(name => $name, segment_payload => $segment_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SegmentsApi->segments_by_name_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of your segment. | 
 **segment_payload** | [**SegmentPayload**](SegmentPayload.md)|  | 

### Return type

[**Segment**](Segment.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **segments_get**
> ARRAY[Segment] segments_get(limit => $limit, offset => $offset)

Load Segments

Returns a list of all your available Segments. Required Access Level: ViewContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SegmentsApi;
my $api_instance = ElasticEmail::SegmentsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->segments_get(limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SegmentsApi->segments_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[Segment]**](Segment.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **segments_post**
> Segment segments_post(segment_payload => $segment_payload)

Add Segment

Add a new segment, based on specified RULE. Required Access Level: ModifyContacts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SegmentsApi;
my $api_instance = ElasticEmail::SegmentsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $segment_payload = ElasticEmail::Object::SegmentPayload->new(); # SegmentPayload | 

eval {
    my $result = $api_instance->segments_post(segment_payload => $segment_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SegmentsApi->segments_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **segment_payload** | [**SegmentPayload**](SegmentPayload.md)|  | 

### Return type

[**Segment**](Segment.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

