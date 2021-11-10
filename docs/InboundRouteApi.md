# ElasticEmail::InboundRouteApi

## Load the API package
```perl
use ElasticEmail::Object::InboundRouteApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**inboundroute_by_id_delete**](InboundRouteApi.md#inboundroute_by_id_delete) | **DELETE** /inboundroute/{id} | Delete Route
[**inboundroute_by_id_get**](InboundRouteApi.md#inboundroute_by_id_get) | **GET** /inboundroute/{id} | Get Route
[**inboundroute_by_id_put**](InboundRouteApi.md#inboundroute_by_id_put) | **PUT** /inboundroute/{id} | Update Route
[**inboundroute_get**](InboundRouteApi.md#inboundroute_get) | **GET** /inboundroute | Get Routes
[**inboundroute_order_put**](InboundRouteApi.md#inboundroute_order_put) | **PUT** /inboundroute/order | Update Sorting
[**inboundroute_post**](InboundRouteApi.md#inboundroute_post) | **POST** /inboundroute | Create Route


# **inboundroute_by_id_delete**
> inboundroute_by_id_delete(id => $id)

Delete Route

Deletes the Inbound Route. Required Access Level: ModifySettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::InboundRouteApi;
my $api_instance = ElasticEmail::InboundRouteApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $id = "id_example"; # string | 

eval {
    $api_instance->inboundroute_by_id_delete(id => $id);
};
if ($@) {
    warn "Exception when calling InboundRouteApi->inboundroute_by_id_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**|  | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inboundroute_by_id_get**
> InboundRoute inboundroute_by_id_get(id => $id)

Get Route

Load an Inbound Route. Required Access Level: ViewSettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::InboundRouteApi;
my $api_instance = ElasticEmail::InboundRouteApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $id = 123456; # string | ID number of your attachment

eval {
    my $result = $api_instance->inboundroute_by_id_get(id => $id);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling InboundRouteApi->inboundroute_by_id_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**| ID number of your attachment | 

### Return type

[**InboundRoute**](InboundRoute.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inboundroute_by_id_put**
> InboundRoute inboundroute_by_id_put(id => $id, inbound_payload => $inbound_payload)

Update Route

Update the Inbound Route. Required Access Level: ModifySettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::InboundRouteApi;
my $api_instance = ElasticEmail::InboundRouteApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $id = "id_example"; # string | 
my $inbound_payload = ElasticEmail::Object::InboundPayload->new(); # InboundPayload | 

eval {
    my $result = $api_instance->inboundroute_by_id_put(id => $id, inbound_payload => $inbound_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling InboundRouteApi->inboundroute_by_id_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**|  | 
 **inbound_payload** | [**InboundPayload**](InboundPayload.md)|  | 

### Return type

[**InboundRoute**](InboundRoute.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inboundroute_get**
> ARRAY[InboundRoute] inboundroute_get()

Get Routes

Get all your Inbound Routes. Required Access Level: ViewSettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::InboundRouteApi;
my $api_instance = ElasticEmail::InboundRouteApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);


eval {
    my $result = $api_instance->inboundroute_get();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling InboundRouteApi->inboundroute_get: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ARRAY[InboundRoute]**](InboundRoute.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inboundroute_order_put**
> ARRAY[InboundRoute] inboundroute_order_put(sort_order_item => $sort_order_item)

Update Sorting

Required Access Level: ViewSettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::InboundRouteApi;
my $api_instance = ElasticEmail::InboundRouteApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $sort_order_item = [ElasticEmail::Object::ARRAY[SortOrderItem]->new()]; # ARRAY[SortOrderItem] | Change the ordering of inbound routes for when matching the inbound

eval {
    my $result = $api_instance->inboundroute_order_put(sort_order_item => $sort_order_item);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling InboundRouteApi->inboundroute_order_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sort_order_item** | [**ARRAY[SortOrderItem]**](SortOrderItem.md)| Change the ordering of inbound routes for when matching the inbound | 

### Return type

[**ARRAY[InboundRoute]**](InboundRoute.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **inboundroute_post**
> InboundRoute inboundroute_post(inbound_payload => $inbound_payload)

Create Route

Create new Inbound Route. Required Access Level: ModifySettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::InboundRouteApi;
my $api_instance = ElasticEmail::InboundRouteApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $inbound_payload = ElasticEmail::Object::InboundPayload->new(); # InboundPayload | 

eval {
    my $result = $api_instance->inboundroute_post(inbound_payload => $inbound_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling InboundRouteApi->inboundroute_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **inbound_payload** | [**InboundPayload**](InboundPayload.md)|  | 

### Return type

[**InboundRoute**](InboundRoute.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

