# ElasticEmail::DomainsApi

## Load the API package
```perl
use ElasticEmail::Object::DomainsApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**domains_by_domain_delete**](DomainsApi.md#domains_by_domain_delete) | **DELETE** /domains/{domain} | Delete Domain
[**domains_by_domain_get**](DomainsApi.md#domains_by_domain_get) | **GET** /domains/{domain} | Load Domain
[**domains_by_domain_put**](DomainsApi.md#domains_by_domain_put) | **PUT** /domains/{domain} | Update Domain
[**domains_by_domain_restricted_get**](DomainsApi.md#domains_by_domain_restricted_get) | **GET** /domains/{domain}/restricted | Check for domain restriction
[**domains_by_domain_verification_put**](DomainsApi.md#domains_by_domain_verification_put) | **PUT** /domains/{domain}/verification | Verify Domain
[**domains_by_email_default_patch**](DomainsApi.md#domains_by_email_default_patch) | **PATCH** /domains/{email}/default | Set Default
[**domains_get**](DomainsApi.md#domains_get) | **GET** /domains | Load Domains
[**domains_post**](DomainsApi.md#domains_post) | **POST** /domains | Add Domain


# **domains_by_domain_delete**
> domains_by_domain_delete(domain => $domain)

Delete Domain

Deletes configured domain from Account. Required Access Level: ModifySettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::DomainsApi;
my $api_instance = ElasticEmail::DomainsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $domain = "domain_example"; # string | Name of the given domain

eval {
    $api_instance->domains_by_domain_delete(domain => $domain);
};
if ($@) {
    warn "Exception when calling DomainsApi->domains_by_domain_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domain** | **string**| Name of the given domain | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **domains_by_domain_get**
> DomainData domains_by_domain_get(domain => $domain)

Load Domain

Retrieve a domain configured for this Account. Required Access Level: ViewSettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::DomainsApi;
my $api_instance = ElasticEmail::DomainsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $domain = "domain_example"; # string | Name of the given domain

eval {
    my $result = $api_instance->domains_by_domain_get(domain => $domain);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DomainsApi->domains_by_domain_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domain** | **string**| Name of the given domain | 

### Return type

[**DomainData**](DomainData.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **domains_by_domain_put**
> DomainDetail domains_by_domain_put(domain => $domain, domain_update_payload => $domain_update_payload)

Update Domain

Updates the specified domain. Required Access Level: ModifySettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::DomainsApi;
my $api_instance = ElasticEmail::DomainsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $domain = "domain_example"; # string | Name of the given domain
my $domain_update_payload = ElasticEmail::Object::DomainUpdatePayload->new(); # DomainUpdatePayload | Updated Domain resource

eval {
    my $result = $api_instance->domains_by_domain_put(domain => $domain, domain_update_payload => $domain_update_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DomainsApi->domains_by_domain_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domain** | **string**| Name of the given domain | 
 **domain_update_payload** | [**DomainUpdatePayload**](DomainUpdatePayload.md)| Updated Domain resource | 

### Return type

[**DomainDetail**](DomainDetail.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **domains_by_domain_restricted_get**
> boolean domains_by_domain_restricted_get(domain => $domain)

Check for domain restriction

Checking if domain is from free provider, or restricted. Required Access Level: ViewSettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::DomainsApi;
my $api_instance = ElasticEmail::DomainsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $domain = "domain_example"; # string | Name of the given domain

eval {
    my $result = $api_instance->domains_by_domain_restricted_get(domain => $domain);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DomainsApi->domains_by_domain_restricted_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domain** | **string**| Name of the given domain | 

### Return type

**boolean**

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **domains_by_domain_verification_put**
> DomainData domains_by_domain_verification_put(domain => $domain, body => $body)

Verify Domain

Verifies that required DNS records exist for specified domain. Required Access Level: ModifySettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::DomainsApi;
my $api_instance = ElasticEmail::DomainsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $domain = "domain_example"; # string | Name of the given domain
my $body = ElasticEmail::Object::string->new(); # string | Tracking type used in the Tracking verification

eval {
    my $result = $api_instance->domains_by_domain_verification_put(domain => $domain, body => $body);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DomainsApi->domains_by_domain_verification_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domain** | **string**| Name of the given domain | 
 **body** | **string**| Tracking type used in the Tracking verification | 

### Return type

[**DomainData**](DomainData.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **domains_by_email_default_patch**
> DomainDetail domains_by_email_default_patch(email => $email)

Set Default

Sets a verified email address as default sender. Required Access Level: ModifySettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::DomainsApi;
my $api_instance = ElasticEmail::DomainsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = "email_example"; # string | Default email sender, example: mail@yourdomain.com

eval {
    my $result = $api_instance->domains_by_email_default_patch(email => $email);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DomainsApi->domains_by_email_default_patch: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **email** | **string**| Default email sender, example: mail@yourdomain.com | 

### Return type

[**DomainDetail**](DomainDetail.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **domains_get**
> ARRAY[DomainDetail] domains_get()

Load Domains

Returns a list of all domains configured for this Account. Required Access Level: ViewSettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::DomainsApi;
my $api_instance = ElasticEmail::DomainsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);


eval {
    my $result = $api_instance->domains_get();
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DomainsApi->domains_get: $@\n";
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ARRAY[DomainDetail]**](DomainDetail.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **domains_post**
> DomainDetail domains_post(domain_payload => $domain_payload)

Add Domain

Add new domain to Account. Required Access Level: ModifySettings

### Example
```perl
use Data::Dumper;
use ElasticEmail::DomainsApi;
my $api_instance = ElasticEmail::DomainsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $domain_payload = ElasticEmail::Object::DomainPayload->new(); # DomainPayload | Domain to add

eval {
    my $result = $api_instance->domains_post(domain_payload => $domain_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling DomainsApi->domains_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **domain_payload** | [**DomainPayload**](DomainPayload.md)| Domain to add | 

### Return type

[**DomainDetail**](DomainDetail.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

