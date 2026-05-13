# ElasticEmail::WebhookApi

## Load the API package
```perl
use ElasticEmail::Object::WebhookApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**webhook_by_publicid_delete**](WebhookApi.md#webhook_by_publicid_delete) | **DELETE** /webhook/{publicid} | Delete Webhook
[**webhook_by_publicid_get**](WebhookApi.md#webhook_by_publicid_get) | **GET** /webhook/{publicid} | Load Webhook
[**webhook_by_publicid_put**](WebhookApi.md#webhook_by_publicid_put) | **PUT** /webhook/{publicid} | Update Webhook
[**webhook_get**](WebhookApi.md#webhook_get) | **GET** /webhook | Load Webhooks
[**webhook_post**](WebhookApi.md#webhook_post) | **POST** /webhook | Add Webhook


# **webhook_by_publicid_delete**
> webhook_by_publicid_delete(publicid => $publicid)

Delete Webhook

Delete the specified notifications webhook. Required Access Level: ModifyWebNotifications

### Example
```perl
use Data::Dumper;
use ElasticEmail::WebhookApi;
my $api_instance = ElasticEmail::WebhookApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $publicid = "publicid_example"; # string | 

eval {
    $api_instance->webhook_by_publicid_delete(publicid => $publicid);
};
if ($@) {
    warn "Exception when calling WebhookApi->webhook_by_publicid_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **publicid** | **string**|  | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **webhook_by_publicid_get**
> Webhook webhook_by_publicid_get(publicid => $publicid)

Load Webhook

Load notifications webhook details. Required Access Level: ViewWebNotifications

### Example
```perl
use Data::Dumper;
use ElasticEmail::WebhookApi;
my $api_instance = ElasticEmail::WebhookApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $publicid = "publicid_example"; # string | 

eval {
    my $result = $api_instance->webhook_by_publicid_get(publicid => $publicid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling WebhookApi->webhook_by_publicid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **publicid** | **string**|  | 

### Return type

[**Webhook**](Webhook.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **webhook_by_publicid_put**
> Webhook webhook_by_publicid_put(publicid => $publicid, webhook_update_payload => $webhook_update_payload)

Update Webhook

Update notification webhook. Required Access Level: ModifyWebNotifications

### Example
```perl
use Data::Dumper;
use ElasticEmail::WebhookApi;
my $api_instance = ElasticEmail::WebhookApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $publicid = "publicid_example"; # string | 
my $webhook_update_payload = ElasticEmail::Object::WebhookUpdatePayload->new(); # WebhookUpdatePayload | 

eval {
    my $result = $api_instance->webhook_by_publicid_put(publicid => $publicid, webhook_update_payload => $webhook_update_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling WebhookApi->webhook_by_publicid_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **publicid** | **string**|  | 
 **webhook_update_payload** | [**WebhookUpdatePayload**](WebhookUpdatePayload.md)|  | 

### Return type

[**Webhook**](Webhook.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **webhook_get**
> ARRAY[Webhook] webhook_get(limit => $limit, offset => $offset)

Load Webhooks

Returns a list of notification webhooks. Required Access Level: ViewWebNotifications

### Example
```perl
use Data::Dumper;
use ElasticEmail::WebhookApi;
my $api_instance = ElasticEmail::WebhookApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->webhook_get(limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling WebhookApi->webhook_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[Webhook]**](Webhook.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **webhook_post**
> Webhook webhook_post(webhook_create_payload => $webhook_create_payload)

Add Webhook

Add a notification webhook. Required Access Level: ModifyWebNotifications

### Example
```perl
use Data::Dumper;
use ElasticEmail::WebhookApi;
my $api_instance = ElasticEmail::WebhookApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $webhook_create_payload = ElasticEmail::Object::WebhookCreatePayload->new(); # WebhookCreatePayload | 

eval {
    my $result = $api_instance->webhook_post(webhook_create_payload => $webhook_create_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling WebhookApi->webhook_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **webhook_create_payload** | [**WebhookCreatePayload**](WebhookCreatePayload.md)|  | 

### Return type

[**Webhook**](Webhook.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

