# ElasticEmail::StatisticsApi

## Load the API package
```perl
use ElasticEmail::Object::StatisticsApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**statistics_campaigns_by_name_get**](StatisticsApi.md#statistics_campaigns_by_name_get) | **GET** /statistics/campaigns/{name} | Load Campaign Stats
[**statistics_campaigns_get**](StatisticsApi.md#statistics_campaigns_get) | **GET** /statistics/campaigns | Load Campaigns Stats
[**statistics_channels_by_name_get**](StatisticsApi.md#statistics_channels_by_name_get) | **GET** /statistics/channels/{name} | Load Channel Stats
[**statistics_channels_get**](StatisticsApi.md#statistics_channels_get) | **GET** /statistics/channels | Load Channels Stats
[**statistics_get**](StatisticsApi.md#statistics_get) | **GET** /statistics | Load Statistics


# **statistics_campaigns_by_name_get**
> ChannelLogStatusSummary statistics_campaigns_by_name_get(name => $name)

Load Campaign Stats

Retrieve stats of an existing campaign. Required Access Level: ViewChannels

### Example 
```perl
use Data::Dumper;
use ElasticEmail::StatisticsApi;
my $api_instance = ElasticEmail::StatisticsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "name_example"; # string | The name of the campaign to get.

eval { 
    my $result = $api_instance->statistics_campaigns_by_name_get(name => $name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling StatisticsApi->statistics_campaigns_by_name_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| The name of the campaign to get. | 

### Return type

[**ChannelLogStatusSummary**](ChannelLogStatusSummary.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **statistics_campaigns_get**
> ARRAY[ChannelLogStatusSummary] statistics_campaigns_get(limit => $limit, offset => $offset)

Load Campaigns Stats

Returns a list of your Campaigns' stats. Required Access Level: ViewChannels

### Example 
```perl
use Data::Dumper;
use ElasticEmail::StatisticsApi;
my $api_instance = ElasticEmail::StatisticsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval { 
    my $result = $api_instance->statistics_campaigns_get(limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling StatisticsApi->statistics_campaigns_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[ChannelLogStatusSummary]**](ChannelLogStatusSummary.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **statistics_channels_by_name_get**
> ChannelLogStatusSummary statistics_channels_by_name_get(name => $name)

Load Channel Stats

Retrieve an existing channel stats. Required Access Level: ViewChannels

### Example 
```perl
use Data::Dumper;
use ElasticEmail::StatisticsApi;
my $api_instance = ElasticEmail::StatisticsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "name_example"; # string | The name of the channel to get.

eval { 
    my $result = $api_instance->statistics_channels_by_name_get(name => $name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling StatisticsApi->statistics_channels_by_name_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| The name of the channel to get. | 

### Return type

[**ChannelLogStatusSummary**](ChannelLogStatusSummary.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **statistics_channels_get**
> ARRAY[ChannelLogStatusSummary] statistics_channels_get(limit => $limit, offset => $offset)

Load Channels Stats

Returns a list of your Channels' stats. Required Access Level: ViewChannels

### Example 
```perl
use Data::Dumper;
use ElasticEmail::StatisticsApi;
my $api_instance = ElasticEmail::StatisticsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval { 
    my $result = $api_instance->statistics_channels_get(limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling StatisticsApi->statistics_channels_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[ChannelLogStatusSummary]**](ChannelLogStatusSummary.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **statistics_get**
> LogStatusSummary statistics_get(from => $from, to => $to)

Load Statistics

Returns basic statistics. Required Access Level: ViewReports

### Example 
```perl
use Data::Dumper;
use ElasticEmail::StatisticsApi;
my $api_instance = ElasticEmail::StatisticsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $from = DateTime->from_epoch(epoch => str2time('null')); # DateTime | Starting date for search in YYYY-MM-DDThh:mm:ss format.
my $to = DateTime->from_epoch(epoch => str2time('null')); # DateTime | Ending date for search in YYYY-MM-DDThh:mm:ss format.

eval { 
    my $result = $api_instance->statistics_get(from => $from, to => $to);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling StatisticsApi->statistics_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **DateTime**| Starting date for search in YYYY-MM-DDThh:mm:ss format. | 
 **to** | **DateTime**| Ending date for search in YYYY-MM-DDThh:mm:ss format. | [optional] 

### Return type

[**LogStatusSummary**](LogStatusSummary.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

