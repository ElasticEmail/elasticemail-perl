# ElasticEmail::SecurityApi

## Load the API package
```perl
use ElasticEmail::Object::SecurityApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**security_apikeys_by_name_delete**](SecurityApi.md#security_apikeys_by_name_delete) | **DELETE** /security/apikeys/{name} | Delete ApiKey
[**security_apikeys_by_name_get**](SecurityApi.md#security_apikeys_by_name_get) | **GET** /security/apikeys/{name} | Load ApiKey
[**security_apikeys_by_name_put**](SecurityApi.md#security_apikeys_by_name_put) | **PUT** /security/apikeys/{name} | Update ApiKey
[**security_apikeys_get**](SecurityApi.md#security_apikeys_get) | **GET** /security/apikeys | List ApiKeys
[**security_apikeys_post**](SecurityApi.md#security_apikeys_post) | **POST** /security/apikeys | Add ApiKey
[**security_smtp_by_name_delete**](SecurityApi.md#security_smtp_by_name_delete) | **DELETE** /security/smtp/{name} | Delete SMTP Credential
[**security_smtp_by_name_get**](SecurityApi.md#security_smtp_by_name_get) | **GET** /security/smtp/{name} | Load SMTP Credential
[**security_smtp_by_name_put**](SecurityApi.md#security_smtp_by_name_put) | **PUT** /security/smtp/{name} | Update SMTP Credential
[**security_smtp_get**](SecurityApi.md#security_smtp_get) | **GET** /security/smtp | List SMTP Credentials
[**security_smtp_post**](SecurityApi.md#security_smtp_post) | **POST** /security/smtp | Add SMTP Credential


# **security_apikeys_by_name_delete**
> security_apikeys_by_name_delete(name => $name, subaccount => $subaccount)

Delete ApiKey

Delete your existing ApiKey. Required Access Level: Security

### Example 
```perl
use Data::Dumper;
use ElasticEmail::SecurityApi;
my $api_instance = ElasticEmail::SecurityApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "name_example"; # string | Name of the ApiKey
my $subaccount = "subaccount_example"; # string | Email of the subaccount of which ApiKey should be deleted

eval { 
    $api_instance->security_apikeys_by_name_delete(name => $name, subaccount => $subaccount);
};
if ($@) {
    warn "Exception when calling SecurityApi->security_apikeys_by_name_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of the ApiKey | 
 **subaccount** | **string**| Email of the subaccount of which ApiKey should be deleted | [optional] 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **security_apikeys_by_name_get**
> ApiKey security_apikeys_by_name_get(name => $name, subaccount => $subaccount)

Load ApiKey

Load your existing ApiKey info. Required Access Level: Security

### Example 
```perl
use Data::Dumper;
use ElasticEmail::SecurityApi;
my $api_instance = ElasticEmail::SecurityApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "name_example"; # string | Name of the ApiKey
my $subaccount = "subaccount_example"; # string | Email of the subaccount of which ApiKey should be loaded

eval { 
    my $result = $api_instance->security_apikeys_by_name_get(name => $name, subaccount => $subaccount);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SecurityApi->security_apikeys_by_name_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of the ApiKey | 
 **subaccount** | **string**| Email of the subaccount of which ApiKey should be loaded | [optional] 

### Return type

[**ApiKey**](ApiKey.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **security_apikeys_by_name_put**
> ApiKey security_apikeys_by_name_put(name => $name, api_key_payload => $api_key_payload)

Update ApiKey

Update your existing ApiKey. Required Access Level: Security

### Example 
```perl
use Data::Dumper;
use ElasticEmail::SecurityApi;
my $api_instance = ElasticEmail::SecurityApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "name_example"; # string | Name of the ApiKey
my $api_key_payload = ElasticEmail::Object::ApiKeyPayload->new(); # ApiKeyPayload | 

eval { 
    my $result = $api_instance->security_apikeys_by_name_put(name => $name, api_key_payload => $api_key_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SecurityApi->security_apikeys_by_name_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of the ApiKey | 
 **api_key_payload** | [**ApiKeyPayload**](ApiKeyPayload.md)|  | 

### Return type

[**ApiKey**](ApiKey.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **security_apikeys_get**
> ARRAY[ApiKey] security_apikeys_get(subaccount => $subaccount)

List ApiKeys

List all your existing ApiKeys. Required Access Level: Security

### Example 
```perl
use Data::Dumper;
use ElasticEmail::SecurityApi;
my $api_instance = ElasticEmail::SecurityApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $subaccount = "subaccount_example"; # string | Email of the subaccount of which ApiKeys should be loaded

eval { 
    my $result = $api_instance->security_apikeys_get(subaccount => $subaccount);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SecurityApi->security_apikeys_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subaccount** | **string**| Email of the subaccount of which ApiKeys should be loaded | [optional] 

### Return type

[**ARRAY[ApiKey]**](ApiKey.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **security_apikeys_post**
> NewApiKey security_apikeys_post(api_key_payload => $api_key_payload)

Add ApiKey

Add a new ApiKey. Required Access Level: Security

### Example 
```perl
use Data::Dumper;
use ElasticEmail::SecurityApi;
my $api_instance = ElasticEmail::SecurityApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $api_key_payload = ElasticEmail::Object::ApiKeyPayload->new(); # ApiKeyPayload | 

eval { 
    my $result = $api_instance->security_apikeys_post(api_key_payload => $api_key_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SecurityApi->security_apikeys_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **api_key_payload** | [**ApiKeyPayload**](ApiKeyPayload.md)|  | 

### Return type

[**NewApiKey**](NewApiKey.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **security_smtp_by_name_delete**
> security_smtp_by_name_delete(name => $name, subaccount => $subaccount)

Delete SMTP Credential

Delete your existing SMTP Credentials. Required Access Level: Security

### Example 
```perl
use Data::Dumper;
use ElasticEmail::SecurityApi;
my $api_instance = ElasticEmail::SecurityApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "name_example"; # string | Name of the SMTP Credential
my $subaccount = "subaccount_example"; # string | Email of the subaccount of which credential should be deleted

eval { 
    $api_instance->security_smtp_by_name_delete(name => $name, subaccount => $subaccount);
};
if ($@) {
    warn "Exception when calling SecurityApi->security_smtp_by_name_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of the SMTP Credential | 
 **subaccount** | **string**| Email of the subaccount of which credential should be deleted | [optional] 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **security_smtp_by_name_get**
> SmtpCredentials security_smtp_by_name_get(name => $name, subaccount => $subaccount)

Load SMTP Credential

Load your existing SMTP Credential info. Required Access Level: Security

### Example 
```perl
use Data::Dumper;
use ElasticEmail::SecurityApi;
my $api_instance = ElasticEmail::SecurityApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "name_example"; # string | Name of the SMTP Credential
my $subaccount = "subaccount_example"; # string | Email of the subaccount of which credential should be loaded

eval { 
    my $result = $api_instance->security_smtp_by_name_get(name => $name, subaccount => $subaccount);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SecurityApi->security_smtp_by_name_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of the SMTP Credential | 
 **subaccount** | **string**| Email of the subaccount of which credential should be loaded | [optional] 

### Return type

[**SmtpCredentials**](SmtpCredentials.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **security_smtp_by_name_put**
> SmtpCredentials security_smtp_by_name_put(name => $name, smtp_credentials_payload => $smtp_credentials_payload)

Update SMTP Credential

Update your existing SMTP Credentials. Required Access Level: Security

### Example 
```perl
use Data::Dumper;
use ElasticEmail::SecurityApi;
my $api_instance = ElasticEmail::SecurityApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "name_example"; # string | Name of the SMTP Credential
my $smtp_credentials_payload = ElasticEmail::Object::SmtpCredentialsPayload->new(); # SmtpCredentialsPayload | 

eval { 
    my $result = $api_instance->security_smtp_by_name_put(name => $name, smtp_credentials_payload => $smtp_credentials_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SecurityApi->security_smtp_by_name_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of the SMTP Credential | 
 **smtp_credentials_payload** | [**SmtpCredentialsPayload**](SmtpCredentialsPayload.md)|  | 

### Return type

[**SmtpCredentials**](SmtpCredentials.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **security_smtp_get**
> ARRAY[SmtpCredentials] security_smtp_get(subaccount => $subaccount)

List SMTP Credentials

List all your existing SMTP Credentials. Required Access Level: Security

### Example 
```perl
use Data::Dumper;
use ElasticEmail::SecurityApi;
my $api_instance = ElasticEmail::SecurityApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $subaccount = "subaccount_example"; # string | Email of the subaccount of which credentials should be listed

eval { 
    my $result = $api_instance->security_smtp_get(subaccount => $subaccount);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SecurityApi->security_smtp_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subaccount** | **string**| Email of the subaccount of which credentials should be listed | [optional] 

### Return type

[**ARRAY[SmtpCredentials]**](SmtpCredentials.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **security_smtp_post**
> NewSmtpCredentials security_smtp_post(smtp_credentials_payload => $smtp_credentials_payload)

Add SMTP Credential

Add new SMTP Credential. Required Access Level: Security

### Example 
```perl
use Data::Dumper;
use ElasticEmail::SecurityApi;
my $api_instance = ElasticEmail::SecurityApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $smtp_credentials_payload = ElasticEmail::Object::SmtpCredentialsPayload->new(); # SmtpCredentialsPayload | 

eval { 
    my $result = $api_instance->security_smtp_post(smtp_credentials_payload => $smtp_credentials_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling SecurityApi->security_smtp_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **smtp_credentials_payload** | [**SmtpCredentialsPayload**](SmtpCredentialsPayload.md)|  | 

### Return type

[**NewSmtpCredentials**](NewSmtpCredentials.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

