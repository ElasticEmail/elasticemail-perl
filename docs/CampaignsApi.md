# ElasticEmail::CampaignsApi

## Load the API package
```perl
use ElasticEmail::Object::CampaignsApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**campaigns_by_name_delete**](CampaignsApi.md#campaigns_by_name_delete) | **DELETE** /campaigns/{name} | Delete Campaign
[**campaigns_by_name_get**](CampaignsApi.md#campaigns_by_name_get) | **GET** /campaigns/{name} | Load Campaign
[**campaigns_by_name_put**](CampaignsApi.md#campaigns_by_name_put) | **PUT** /campaigns/{name} | Update Campaign
[**campaigns_get**](CampaignsApi.md#campaigns_get) | **GET** /campaigns | Load Campaigns
[**campaigns_post**](CampaignsApi.md#campaigns_post) | **POST** /campaigns | Add Campaign


# **campaigns_by_name_delete**
> campaigns_by_name_delete(name => $name)

Delete Campaign

Delete the specific campaign.  This does not cancel in progress email, see Cancel In Progress. Required Access Level: ModifyCampaigns

### Example 
```perl
use Data::Dumper;
use ElasticEmail::CampaignsApi;
my $api_instance = ElasticEmail::CampaignsApi->new(

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

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of Campaign to delete | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **campaigns_by_name_get**
> Campaign campaigns_by_name_get(name => $name)

Load Campaign

Returns the specified campaign details. Required Access Level: ViewCampaigns

### Example 
```perl
use Data::Dumper;
use ElasticEmail::CampaignsApi;
my $api_instance = ElasticEmail::CampaignsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "name_example"; # string | Name of Campaign to get

eval { 
    my $result = $api_instance->campaigns_by_name_get(name => $name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling CampaignsApi->campaigns_by_name_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of Campaign to get | 

### Return type

[**Campaign**](Campaign.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **campaigns_by_name_put**
> Campaign campaigns_by_name_put(name => $name, campaign => $campaign)

Update Campaign

Updates a previously added campaign.  Only Active and Paused campaigns can be updated. Required Access Level: ModifyCampaigns

### Example 
```perl
use Data::Dumper;
use ElasticEmail::CampaignsApi;
my $api_instance = ElasticEmail::CampaignsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "name_example"; # string | Name of Campaign to update
my $campaign = ElasticEmail::Object::Campaign->new(); # Campaign | JSON representation of a campaign

eval { 
    my $result = $api_instance->campaigns_by_name_put(name => $name, campaign => $campaign);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling CampaignsApi->campaigns_by_name_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of Campaign to update | 
 **campaign** | [**Campaign**](Campaign.md)| JSON representation of a campaign | 

### Return type

[**Campaign**](Campaign.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **campaigns_get**
> ARRAY[Campaign] campaigns_get(search => $search, offset => $offset, limit => $limit)

Load Campaigns

Returns a list all of your campaigns. Limited to 1000 results. Required Access Level: ViewCampaigns

### Example 
```perl
use Data::Dumper;
use ElasticEmail::CampaignsApi;
my $api_instance = ElasticEmail::CampaignsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $search = "search_example"; # string | Text fragment used for searching in Campaign name (using the 'contains' rule)
my $offset = 20; # int | How many items should be returned ahead.
my $limit = 100; # int | Maximum number of returned items.

eval { 
    my $result = $api_instance->campaigns_get(search => $search, offset => $offset, limit => $limit);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling CampaignsApi->campaigns_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search** | **string**| Text fragment used for searching in Campaign name (using the &#39;contains&#39; rule) | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 
 **limit** | **int**| Maximum number of returned items. | [optional] 

### Return type

[**ARRAY[Campaign]**](Campaign.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **campaigns_post**
> Campaign campaigns_post(campaign => $campaign)

Add Campaign

Add a campaign for processing. Required Access Level: ModifyCampaigns

### Example 
```perl
use Data::Dumper;
use ElasticEmail::CampaignsApi;
my $api_instance = ElasticEmail::CampaignsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $campaign = ElasticEmail::Object::Campaign->new(); # Campaign | JSON representation of a campaign

eval { 
    my $result = $api_instance->campaigns_post(campaign => $campaign);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling CampaignsApi->campaigns_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **campaign** | [**Campaign**](Campaign.md)| JSON representation of a campaign | 

### Return type

[**Campaign**](Campaign.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

