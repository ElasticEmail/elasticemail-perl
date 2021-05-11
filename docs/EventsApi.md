# ElasticEmail::EventsApi

## Load the API package
```perl
use ElasticEmail::Object::EventsApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**events_by_transactionid_get**](EventsApi.md#events_by_transactionid_get) | **GET** /events/{transactionid} | Load Email Events
[**events_channels_by_name_export_post**](EventsApi.md#events_channels_by_name_export_post) | **POST** /events/channels/{name}/export | Export Channel Events
[**events_channels_by_name_get**](EventsApi.md#events_channels_by_name_get) | **GET** /events/channels/{name} | Load Channel Events
[**events_channels_export_by_id_status_get**](EventsApi.md#events_channels_export_by_id_status_get) | **GET** /events/channels/export/{id}/status | Check Channel Export Status
[**events_export_by_id_status_get**](EventsApi.md#events_export_by_id_status_get) | **GET** /events/export/{id}/status | Check Export Status
[**events_export_post**](EventsApi.md#events_export_post) | **POST** /events/export | Export Events
[**events_get**](EventsApi.md#events_get) | **GET** /events | Load Events


# **events_by_transactionid_get**
> ARRAY[RecipientEvent] events_by_transactionid_get(transactionid => $transactionid, from => $from, to => $to, order_by => $order_by, limit => $limit, offset => $offset)

Load Email Events

Returns a log of delivery events for the specific transaction ID. Required Access Level: ViewReports

### Example 
```perl
use Data::Dumper;
use ElasticEmail::EventsApi;
my $api_instance = ElasticEmail::EventsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $transactionid = TransactionID; # string | ID number of transaction
my $from = DateTime->from_epoch(epoch => str2time('null')); # DateTime | Starting date for search in YYYY-MM-DDThh:mm:ss format.
my $to = DateTime->from_epoch(epoch => str2time('null')); # DateTime | Ending date for search in YYYY-MM-DDThh:mm:ss format.
my $order_by = new ElasticEmail.EventsOrderBy(); # EventsOrderBy | 
my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval { 
    my $result = $api_instance->events_by_transactionid_get(transactionid => $transactionid, from => $from, to => $to, order_by => $order_by, limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EventsApi->events_by_transactionid_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **transactionid** | **string**| ID number of transaction | 
 **from** | **DateTime**| Starting date for search in YYYY-MM-DDThh:mm:ss format. | [optional] 
 **to** | **DateTime**| Ending date for search in YYYY-MM-DDThh:mm:ss format. | [optional] 
 **order_by** | [**EventsOrderBy**](.md)|  | [optional] 
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[RecipientEvent]**](RecipientEvent.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **events_channels_by_name_export_post**
> ExportLink events_channels_by_name_export_post(name => $name, event_types => $event_types, from => $from, to => $to, file_format => $file_format, compression_format => $compression_format, file_name => $file_name)

Export Channel Events

Export delivery events log information to the specified file format. Required Access Level: Export

### Example 
```perl
use Data::Dumper;
use ElasticEmail::EventsApi;
my $api_instance = ElasticEmail::EventsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = Channel01; # string | Name of selected channel.
my $event_types = [(new ElasticEmail.EventType())]; # ARRAY[EventType] | Types of Events to return
my $from = DateTime->from_epoch(epoch => str2time('null')); # DateTime | Starting date for search in YYYY-MM-DDThh:mm:ss format.
my $to = DateTime->from_epoch(epoch => str2time('null')); # DateTime | Ending date for search in YYYY-MM-DDThh:mm:ss format.
my $file_format = new ElasticEmail.ExportFileFormats(); # ExportFileFormats | Format of the exported file
my $compression_format = new ElasticEmail.CompressionFormat(); # CompressionFormat | FileResponse compression format. None or Zip.
my $file_name = filename.txt; # string | Name of your file including extension.

eval { 
    my $result = $api_instance->events_channels_by_name_export_post(name => $name, event_types => $event_types, from => $from, to => $to, file_format => $file_format, compression_format => $compression_format, file_name => $file_name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EventsApi->events_channels_by_name_export_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of selected channel. | 
 **event_types** | [**ARRAY[EventType]**](EventType.md)| Types of Events to return | [optional] 
 **from** | **DateTime**| Starting date for search in YYYY-MM-DDThh:mm:ss format. | [optional] 
 **to** | **DateTime**| Ending date for search in YYYY-MM-DDThh:mm:ss format. | [optional] 
 **file_format** | [**ExportFileFormats**](.md)| Format of the exported file | [optional] 
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

# **events_channels_by_name_get**
> ARRAY[RecipientEvent] events_channels_by_name_get(name => $name, event_types => $event_types, from => $from, to => $to, order_by => $order_by, limit => $limit, offset => $offset)

Load Channel Events

Returns a log of delivery events filtered by specified parameters. Required Access Level: ViewReports

### Example 
```perl
use Data::Dumper;
use ElasticEmail::EventsApi;
my $api_instance = ElasticEmail::EventsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = Channel01; # string | Name of selected channel.
my $event_types = [(new ElasticEmail.EventType())]; # ARRAY[EventType] | Types of Events to return
my $from = DateTime->from_epoch(epoch => str2time('null')); # DateTime | Starting date for search in YYYY-MM-DDThh:mm:ss format.
my $to = DateTime->from_epoch(epoch => str2time('null')); # DateTime | Ending date for search in YYYY-MM-DDThh:mm:ss format.
my $order_by = new ElasticEmail.EventsOrderBy(); # EventsOrderBy | 
my $limit = 56; # int | How many items to load. Maximum for this request is 1000 items
my $offset = 20; # int | How many items should be returned ahead.

eval { 
    my $result = $api_instance->events_channels_by_name_get(name => $name, event_types => $event_types, from => $from, to => $to, order_by => $order_by, limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EventsApi->events_channels_by_name_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of selected channel. | 
 **event_types** | [**ARRAY[EventType]**](EventType.md)| Types of Events to return | [optional] 
 **from** | **DateTime**| Starting date for search in YYYY-MM-DDThh:mm:ss format. | [optional] 
 **to** | **DateTime**| Ending date for search in YYYY-MM-DDThh:mm:ss format. | [optional] 
 **order_by** | [**EventsOrderBy**](.md)|  | [optional] 
 **limit** | **int**| How many items to load. Maximum for this request is 1000 items | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[RecipientEvent]**](RecipientEvent.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **events_channels_export_by_id_status_get**
> ExportStatus events_channels_export_by_id_status_get(id => $id)

Check Channel Export Status

Check the current status of the channel export. Required Access Level: Export

### Example 
```perl
use Data::Dumper;
use ElasticEmail::EventsApi;
my $api_instance = ElasticEmail::EventsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $id = E33EBA7A-C20D-4D3D-8F2F-5EEF42F58E6F; # string | ID of the exported file

eval { 
    my $result = $api_instance->events_channels_export_by_id_status_get(id => $id);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EventsApi->events_channels_export_by_id_status_get: $@\n";
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

# **events_export_by_id_status_get**
> ExportStatus events_export_by_id_status_get(id => $id)

Check Export Status

Check the current status of the export. Required Access Level: Export

### Example 
```perl
use Data::Dumper;
use ElasticEmail::EventsApi;
my $api_instance = ElasticEmail::EventsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $id = E33EBA7A-C20D-4D3D-8F2F-5EEF42F58E6F; # string | ID of the exported file

eval { 
    my $result = $api_instance->events_export_by_id_status_get(id => $id);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EventsApi->events_export_by_id_status_get: $@\n";
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

# **events_export_post**
> ExportLink events_export_post(event_types => $event_types, from => $from, to => $to, file_format => $file_format, compression_format => $compression_format, file_name => $file_name)

Export Events

Export delivery events log information to the specified file format. Required Access Level: Export

### Example 
```perl
use Data::Dumper;
use ElasticEmail::EventsApi;
my $api_instance = ElasticEmail::EventsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $event_types = [(new ElasticEmail.EventType())]; # ARRAY[EventType] | Types of Events to return
my $from = DateTime->from_epoch(epoch => str2time('null')); # DateTime | Starting date for search in YYYY-MM-DDThh:mm:ss format.
my $to = DateTime->from_epoch(epoch => str2time('null')); # DateTime | Ending date for search in YYYY-MM-DDThh:mm:ss format.
my $file_format = new ElasticEmail.ExportFileFormats(); # ExportFileFormats | Format of the exported file
my $compression_format = new ElasticEmail.CompressionFormat(); # CompressionFormat | FileResponse compression format. None or Zip.
my $file_name = filename.txt; # string | Name of your file including extension.

eval { 
    my $result = $api_instance->events_export_post(event_types => $event_types, from => $from, to => $to, file_format => $file_format, compression_format => $compression_format, file_name => $file_name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EventsApi->events_export_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **event_types** | [**ARRAY[EventType]**](EventType.md)| Types of Events to return | [optional] 
 **from** | **DateTime**| Starting date for search in YYYY-MM-DDThh:mm:ss format. | [optional] 
 **to** | **DateTime**| Ending date for search in YYYY-MM-DDThh:mm:ss format. | [optional] 
 **file_format** | [**ExportFileFormats**](.md)| Format of the exported file | [optional] 
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

# **events_get**
> ARRAY[RecipientEvent] events_get(event_types => $event_types, from => $from, to => $to, order_by => $order_by, limit => $limit, offset => $offset)

Load Events

Returns a log of delivery events filtered by specified parameters. Required Access Level: ViewReports

### Example 
```perl
use Data::Dumper;
use ElasticEmail::EventsApi;
my $api_instance = ElasticEmail::EventsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $event_types = [(new ElasticEmail.EventType())]; # ARRAY[EventType] | Types of Events to return
my $from = DateTime->from_epoch(epoch => str2time('null')); # DateTime | Starting date for search in YYYY-MM-DDThh:mm:ss format.
my $to = DateTime->from_epoch(epoch => str2time('null')); # DateTime | Ending date for search in YYYY-MM-DDThh:mm:ss format.
my $order_by = new ElasticEmail.EventsOrderBy(); # EventsOrderBy | 
my $limit = 56; # int | How many items to load. Maximum for this request is 1000 items
my $offset = 20; # int | How many items should be returned ahead.

eval { 
    my $result = $api_instance->events_get(event_types => $event_types, from => $from, to => $to, order_by => $order_by, limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EventsApi->events_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **event_types** | [**ARRAY[EventType]**](EventType.md)| Types of Events to return | [optional] 
 **from** | **DateTime**| Starting date for search in YYYY-MM-DDThh:mm:ss format. | [optional] 
 **to** | **DateTime**| Ending date for search in YYYY-MM-DDThh:mm:ss format. | [optional] 
 **order_by** | [**EventsOrderBy**](.md)|  | [optional] 
 **limit** | **int**| How many items to load. Maximum for this request is 1000 items | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[RecipientEvent]**](RecipientEvent.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

