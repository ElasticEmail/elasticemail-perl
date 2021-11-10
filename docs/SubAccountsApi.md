# ElasticEmail::SubAccountsApi

## Load the API package
```perl
use ElasticEmail::Object::SubAccountsApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**subaccounts_by_email_credits_patch**](SubAccountsApi.md#subaccounts_by_email_credits_patch) | **PATCH** /subaccounts/{email}/credits | Add, Subtract Email Credits
[**subaccounts_by_email_delete**](SubAccountsApi.md#subaccounts_by_email_delete) | **DELETE** /subaccounts/{email} | Delete SubAccount
[**subaccounts_by_email_get**](SubAccountsApi.md#subaccounts_by_email_get) | **GET** /subaccounts/{email} | Load SubAccount
[**subaccounts_by_email_settings_email_put**](SubAccountsApi.md#subaccounts_by_email_settings_email_put) | **PUT** /subaccounts/{email}/settings/email | Update SubAccount Email Settings
[**subaccounts_get**](SubAccountsApi.md#subaccounts_get) | **GET** /subaccounts | Load SubAccounts
[**subaccounts_post**](SubAccountsApi.md#subaccounts_post) | **POST** /subaccounts | Add SubAccount


# **subaccounts_by_email_credits_patch**
> subaccounts_by_email_credits_patch(email => $email, subaccount_email_credits_payload => $subaccount_email_credits_payload)

Add, Subtract Email Credits

Update email credits of a subaccount by the given amount. Required Access Level: ModifySubAccounts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SubAccountsApi;
my $api_instance = ElasticEmail::SubAccountsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = mail@example.com; # string | Email address of Sub-Account
my $subaccount_email_credits_payload = ElasticEmail::Object::SubaccountEmailCreditsPayload->new(); # SubaccountEmailCreditsPayload | Amount of email credits to add or subtract from the current SubAccount email credits pool (positive or negative value)

eval {
    $api_instance->subaccounts_by_email_credits_patch(email => $email, subaccount_email_credits_payload => $subaccount_email_credits_payload);
};
if ($@) {
    warn "Exception when calling SubAccountsApi->subaccounts_by_email_credits_patch: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string**| Email address of Sub-Account | 
 **subaccount_email_credits_payload** | [**SubaccountEmailCreditsPayload**](SubaccountEmailCreditsPayload.md)| Amount of email credits to add or subtract from the current SubAccount email credits pool (positive or negative value) | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **subaccounts_by_email_delete**
> subaccounts_by_email_delete(email => $email)

Delete SubAccount

Deletes specified SubAccount. An email will be sent to confirm this change. Required Access Level: ModifySubAccounts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SubAccountsApi;
my $api_instance = ElasticEmail::SubAccountsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = mail@example.com; # string | Email address of Sub-Account

eval {
    $api_instance->subaccounts_by_email_delete(email => $email);
};
if ($@) {
    warn "Exception when calling SubAccountsApi->subaccounts_by_email_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string**| Email address of Sub-Account | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **subaccounts_by_email_get**
> SubAccountInfo subaccounts_by_email_get(email => $email)

Load SubAccount

Returns details for the specified SubAccount. Required Access Level: ViewSubAccounts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SubAccountsApi;
my $api_instance = ElasticEmail::SubAccountsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = mail@example.com; # string | Email address of Sub-Account

eval {
    my $result = $api_instance->subaccounts_by_email_get(email => $email);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SubAccountsApi->subaccounts_by_email_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string**| Email address of Sub-Account | 

### Return type

[**SubAccountInfo**](SubAccountInfo.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **subaccounts_by_email_settings_email_put**
> SubaccountEmailSettings subaccounts_by_email_settings_email_put(email => $email, subaccount_email_settings => $subaccount_email_settings)

Update SubAccount Email Settings

Update SubAccount email settings. Required Access Level: ModifySubAccounts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SubAccountsApi;
my $api_instance = ElasticEmail::SubAccountsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = "email_example"; # string | 
my $subaccount_email_settings = ElasticEmail::Object::SubaccountEmailSettings->new(); # SubaccountEmailSettings | Updated Email Settings

eval {
    my $result = $api_instance->subaccounts_by_email_settings_email_put(email => $email, subaccount_email_settings => $subaccount_email_settings);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SubAccountsApi->subaccounts_by_email_settings_email_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string**|  | 
 **subaccount_email_settings** | [**SubaccountEmailSettings**](SubaccountEmailSettings.md)| Updated Email Settings | 

### Return type

[**SubaccountEmailSettings**](SubaccountEmailSettings.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **subaccounts_get**
> ARRAY[SubAccountInfo] subaccounts_get(limit => $limit, offset => $offset)

Load SubAccounts

Returns a list of all your SubAccounts. Required Access Level: ViewSubAccounts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SubAccountsApi;
my $api_instance = ElasticEmail::SubAccountsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->subaccounts_get(limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SubAccountsApi->subaccounts_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[SubAccountInfo]**](SubAccountInfo.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **subaccounts_post**
> SubAccountInfo subaccounts_post(subaccount_payload => $subaccount_payload)

Add SubAccount

Add a new SubAccount to your Account. To receive an access token for this SubAccount, make a POST security/apikeys request using the 'subaccount' parameter. Required Access Level: ModifySubAccounts

### Example
```perl
use Data::Dumper;
use ElasticEmail::SubAccountsApi;
my $api_instance = ElasticEmail::SubAccountsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $subaccount_payload = ElasticEmail::Object::SubaccountPayload->new(); # SubaccountPayload | 

eval {
    my $result = $api_instance->subaccounts_post(subaccount_payload => $subaccount_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SubAccountsApi->subaccounts_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subaccount_payload** | [**SubaccountPayload**](SubaccountPayload.md)|  | 

### Return type

[**SubAccountInfo**](SubAccountInfo.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

