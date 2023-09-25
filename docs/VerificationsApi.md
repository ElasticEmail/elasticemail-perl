# ElasticEmail::VerificationsApi

## Load the API package
```perl
use ElasticEmail::Object::VerificationsApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**verifications_by_email_delete**](VerificationsApi.md#verifications_by_email_delete) | **DELETE** /verifications/{email} | Delete Email Verification Result
[**verifications_by_email_get**](VerificationsApi.md#verifications_by_email_get) | **GET** /verifications/{email} | Get Email Verification Result
[**verifications_by_email_post**](VerificationsApi.md#verifications_by_email_post) | **POST** /verifications/{email} | Verify Email
[**verifications_files_by_id_delete**](VerificationsApi.md#verifications_files_by_id_delete) | **DELETE** /verifications/files/{id} | Delete File Verification Result
[**verifications_files_by_id_result_download_get**](VerificationsApi.md#verifications_files_by_id_result_download_get) | **GET** /verifications/files/{id}/result/download | Download File Verification Result
[**verifications_files_by_id_result_get**](VerificationsApi.md#verifications_files_by_id_result_get) | **GET** /verifications/files/{id}/result | Get Detailed File Verification Result
[**verifications_files_by_id_verification_post**](VerificationsApi.md#verifications_files_by_id_verification_post) | **POST** /verifications/files/{id}/verification | Start verification
[**verifications_files_post**](VerificationsApi.md#verifications_files_post) | **POST** /verifications/files | Upload File with Emails
[**verifications_files_result_get**](VerificationsApi.md#verifications_files_result_get) | **GET** /verifications/files/result | Get Files Verification Results
[**verifications_get**](VerificationsApi.md#verifications_get) | **GET** /verifications | Get Emails Verification Results


# **verifications_by_email_delete**
> verifications_by_email_delete(email => $email)

Delete Email Verification Result

Delete a result with given email if exists. Required Access Level: VerifyEmails

### Example
```perl
use Data::Dumper;
use ElasticEmail::VerificationsApi;
my $api_instance = ElasticEmail::VerificationsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = "email_example"; # string | Email address to verification

eval {
    $api_instance->verifications_by_email_delete(email => $email);
};
if ($@) {
    warn "Exception when calling VerificationsApi->verifications_by_email_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string**| Email address to verification | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifications_by_email_get**
> EmailValidationResult verifications_by_email_get(email => $email)

Get Email Verification Result

Returns a result of verified email. Required Access Level: VerifyEmails

### Example
```perl
use Data::Dumper;
use ElasticEmail::VerificationsApi;
my $api_instance = ElasticEmail::VerificationsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = "email_example"; # string | Email address to view verification result of

eval {
    my $result = $api_instance->verifications_by_email_get(email => $email);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VerificationsApi->verifications_by_email_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string**| Email address to view verification result of | 

### Return type

[**EmailValidationResult**](EmailValidationResult.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifications_by_email_post**
> EmailValidationResult verifications_by_email_post(email => $email)

Verify Email

Verify single email address and returns result of verification. Required Access Level: VerifyEmails

### Example
```perl
use Data::Dumper;
use ElasticEmail::VerificationsApi;
my $api_instance = ElasticEmail::VerificationsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = "email_example"; # string | Email address to verify

eval {
    my $result = $api_instance->verifications_by_email_post(email => $email);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VerificationsApi->verifications_by_email_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string**| Email address to verify | 

### Return type

[**EmailValidationResult**](EmailValidationResult.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifications_files_by_id_delete**
> verifications_files_by_id_delete(id => $id)

Delete File Verification Result

Delete Verification Results if they exist. Required Access Level: VerifyEmails

### Example
```perl
use Data::Dumper;
use ElasticEmail::VerificationsApi;
my $api_instance = ElasticEmail::VerificationsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $id = E33EBA7A-C20D-4D3D-8F2F-5EEF42F58E6F; # string | ID of the exported file

eval {
    $api_instance->verifications_files_by_id_delete(id => $id);
};
if ($@) {
    warn "Exception when calling VerificationsApi->verifications_files_by_id_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**| ID of the exported file | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifications_files_by_id_result_download_get**
> string verifications_files_by_id_result_download_get(id => $id)

Download File Verification Result

Download verification results as a ZIP file. Required Access Level: VerifyEmails

### Example
```perl
use Data::Dumper;
use ElasticEmail::VerificationsApi;
my $api_instance = ElasticEmail::VerificationsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $id = "id_example"; # string | Verification ID to download

eval {
    my $result = $api_instance->verifications_files_by_id_result_download_get(id => $id);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VerificationsApi->verifications_files_by_id_result_download_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**| Verification ID to download | 

### Return type

**string**

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifications_files_by_id_result_get**
> VerificationFileResultDetails verifications_files_by_id_result_get(id => $id, limit => $limit, offset => $offset)

Get Detailed File Verification Result

Returns status and results (if verified) of file with given ID. Required Access Level: VerifyEmails

### Example
```perl
use Data::Dumper;
use ElasticEmail::VerificationsApi;
my $api_instance = ElasticEmail::VerificationsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $id = "id_example"; # string | ID of the Verification to display status of
my $limit = 56; # int | Maximum number of returned email verification results
my $offset = 56; # int | How many result items should be returned ahead

eval {
    my $result = $api_instance->verifications_files_by_id_result_get(id => $id, limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VerificationsApi->verifications_files_by_id_result_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**| ID of the Verification to display status of | 
 **limit** | **int**| Maximum number of returned email verification results | [optional] 
 **offset** | **int**| How many result items should be returned ahead | [optional] 

### Return type

[**VerificationFileResultDetails**](VerificationFileResultDetails.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifications_files_by_id_verification_post**
> verifications_files_by_id_verification_post(id => $id)

Start verification

Start a verification of the previously uploaded file with emails. Required Access Level: VerifyEmails

### Example
```perl
use Data::Dumper;
use ElasticEmail::VerificationsApi;
my $api_instance = ElasticEmail::VerificationsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $id = "id_example"; # string | File ID to start verification

eval {
    $api_instance->verifications_files_by_id_verification_post(id => $id);
};
if ($@) {
    warn "Exception when calling VerificationsApi->verifications_files_by_id_verification_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **string**| File ID to start verification | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifications_files_post**
> VerificationFileResult verifications_files_post(file => $file)

Upload File with Emails

Uploads a CSV file with list of emails that can then be triggered for verification. An 'email' column is required. Required Access Level: VerifyEmails

### Example
```perl
use Data::Dumper;
use ElasticEmail::VerificationsApi;
my $api_instance = ElasticEmail::VerificationsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $file = "/path/to/file"; # string | 

eval {
    my $result = $api_instance->verifications_files_post(file => $file);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VerificationsApi->verifications_files_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **string****string**|  | [optional] 

### Return type

[**VerificationFileResult**](VerificationFileResult.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifications_files_result_get**
> ARRAY[VerificationFileResult] verifications_files_result_get()

Get Files Verification Results

Returns a list of uploaded files, their statuses and results. Required Access Level: VerifyEmails

### Example
```perl
use Data::Dumper;
use ElasticEmail::VerificationsApi;
my $api_instance = ElasticEmail::VerificationsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);


eval {
    my $result = $api_instance->verifications_files_result_get();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VerificationsApi->verifications_files_result_get: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ARRAY[VerificationFileResult]**](VerificationFileResult.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **verifications_get**
> ARRAY[EmailValidationResult] verifications_get(limit => $limit, offset => $offset)

Get Emails Verification Results

Returns a results of all verified single emails. Required Access Level: VerifyEmails

### Example
```perl
use Data::Dumper;
use ElasticEmail::VerificationsApi;
my $api_instance = ElasticEmail::VerificationsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->verifications_get(limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling VerificationsApi->verifications_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[EmailValidationResult]**](EmailValidationResult.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

