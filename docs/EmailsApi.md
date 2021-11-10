# ElasticEmail::EmailsApi

## Load the API package
```perl
use ElasticEmail::Object::EmailsApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**emails_by_msgid_view_get**](EmailsApi.md#emails_by_msgid_view_get) | **GET** /emails/{msgid}/view | View Email
[**emails_mergefile_post**](EmailsApi.md#emails_mergefile_post) | **POST** /emails/mergefile | Send Bulk Emails CSV
[**emails_post**](EmailsApi.md#emails_post) | **POST** /emails | Send Bulk Emails
[**emails_transactional_post**](EmailsApi.md#emails_transactional_post) | **POST** /emails/transactional | Send Transactional Email


# **emails_by_msgid_view_get**
> EmailData emails_by_msgid_view_get(msgid => $msgid)

View Email

Returns email details for viewing or rendering. Required Access Level: None

### Example
```perl
use Data::Dumper;
use ElasticEmail::EmailsApi;
my $api_instance = ElasticEmail::EmailsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $msgid = "msgid_example"; # string | Message identifier

eval {
    my $result = $api_instance->emails_by_msgid_view_get(msgid => $msgid);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EmailsApi->emails_by_msgid_view_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **msgid** | **string**| Message identifier | 

### Return type

[**EmailData**](EmailData.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **emails_mergefile_post**
> EmailSend emails_mergefile_post(merge_email_payload => $merge_email_payload)

Send Bulk Emails CSV

Send bulk merge email. Required Access Level: SendHttp

### Example
```perl
use Data::Dumper;
use ElasticEmail::EmailsApi;
my $api_instance = ElasticEmail::EmailsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $merge_email_payload = ElasticEmail::Object::MergeEmailPayload->new(); # MergeEmailPayload | Email data

eval {
    my $result = $api_instance->emails_mergefile_post(merge_email_payload => $merge_email_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EmailsApi->emails_mergefile_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merge_email_payload** | [**MergeEmailPayload**](MergeEmailPayload.md)| Email data | 

### Return type

[**EmailSend**](EmailSend.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **emails_post**
> EmailSend emails_post(email_message_data => $email_message_data)

Send Bulk Emails

Send bulk merge email. Required Access Level: SendHttp

### Example
```perl
use Data::Dumper;
use ElasticEmail::EmailsApi;
my $api_instance = ElasticEmail::EmailsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email_message_data = ElasticEmail::Object::EmailMessageData->new(); # EmailMessageData | Email data

eval {
    my $result = $api_instance->emails_post(email_message_data => $email_message_data);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EmailsApi->emails_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email_message_data** | [**EmailMessageData**](EmailMessageData.md)| Email data | 

### Return type

[**EmailSend**](EmailSend.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **emails_transactional_post**
> EmailSend emails_transactional_post(email_transactional_message_data => $email_transactional_message_data)

Send Transactional Email

Send transactional emails (recipients will be known to each other). Required Access Level: SendHttp

### Example
```perl
use Data::Dumper;
use ElasticEmail::EmailsApi;
my $api_instance = ElasticEmail::EmailsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email_transactional_message_data = ElasticEmail::Object::EmailTransactionalMessageData->new(); # EmailTransactionalMessageData | Email data

eval {
    my $result = $api_instance->emails_transactional_post(email_transactional_message_data => $email_transactional_message_data);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EmailsApi->emails_transactional_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email_transactional_message_data** | [**EmailTransactionalMessageData**](EmailTransactionalMessageData.md)| Email data | 

### Return type

[**EmailSend**](EmailSend.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

