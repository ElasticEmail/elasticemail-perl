# ElasticEmail::TemplatesApi

## Load the API package
```perl
use ElasticEmail::Object::TemplatesApi;
```

All URIs are relative to *https://api.elasticemail.com/v4*

Method | HTTP request | Description
------------- | ------------- | -------------
[**templates_by_name_delete**](TemplatesApi.md#templates_by_name_delete) | **DELETE** /templates/{name} | Delete Template
[**templates_by_name_get**](TemplatesApi.md#templates_by_name_get) | **GET** /templates/{name} | Load Template
[**templates_by_name_put**](TemplatesApi.md#templates_by_name_put) | **PUT** /templates/{name} | Update Template
[**templates_get**](TemplatesApi.md#templates_get) | **GET** /templates | Load Templates
[**templates_post**](TemplatesApi.md#templates_post) | **POST** /templates | Add Template


# **templates_by_name_delete**
> templates_by_name_delete(name => $name)

Delete Template

Delete template with the specified name. Required Access Level: ModifyTemplates

### Example
```perl
use Data::Dumper;
use ElasticEmail::TemplatesApi;
my $api_instance = ElasticEmail::TemplatesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = Template01; # string | Name of template.

eval {
    $api_instance->templates_by_name_delete(name => $name);
};
if ($@) {
    warn "Exception when calling TemplatesApi->templates_by_name_delete: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of template. | 

### Return type

void (empty response body)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **templates_by_name_get**
> Template templates_by_name_get(name => $name)

Load Template

Load detailed information of the specified template. Required Access Level: ViewTemplates

### Example
```perl
use Data::Dumper;
use ElasticEmail::TemplatesApi;
my $api_instance = ElasticEmail::TemplatesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = Template01; # string | Name of template.

eval {
    my $result = $api_instance->templates_by_name_get(name => $name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TemplatesApi->templates_by_name_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of template. | 

### Return type

[**Template**](Template.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **templates_by_name_put**
> Template templates_by_name_put(name => $name, template_payload => $template_payload)

Update Template

Update existing template, overwriting existing data. Required Access Level: ModifyTemplates

### Example
```perl
use Data::Dumper;
use ElasticEmail::TemplatesApi;
my $api_instance = ElasticEmail::TemplatesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = Template01; # string | Name of template.
my $template_payload = ElasticEmail::Object::TemplatePayload->new(); # TemplatePayload | 

eval {
    my $result = $api_instance->templates_by_name_put(name => $name, template_payload => $template_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TemplatesApi->templates_by_name_put: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **string**| Name of template. | 
 **template_payload** | [**TemplatePayload**](TemplatePayload.md)|  | 

### Return type

[**Template**](Template.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **templates_get**
> ARRAY[Template] templates_get(scope_type => $scope_type, template_types => $template_types, limit => $limit, offset => $offset)

Load Templates

Returns a list of templates for the specified type. Required Access Level: ViewTemplates

### Example
```perl
use Data::Dumper;
use ElasticEmail::TemplatesApi;
my $api_instance = ElasticEmail::TemplatesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $scope_type = [(new ElasticEmail.TemplateScope())]; # ARRAY[TemplateScope] | Return templates with specified scope only
my $template_types = [(new ElasticEmail.TemplateType())]; # ARRAY[TemplateType] | Return templates with specified type only
my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->templates_get(scope_type => $scope_type, template_types => $template_types, limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TemplatesApi->templates_get: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **scope_type** | [**ARRAY[TemplateScope]**](TemplateScope.md)| Return templates with specified scope only | 
 **template_types** | [**ARRAY[TemplateType]**](TemplateType.md)| Return templates with specified type only | [optional] 
 **limit** | **int**| Maximum number of returned items. | [optional] 
 **offset** | **int**| How many items should be returned ahead. | [optional] 

### Return type

[**ARRAY[Template]**](Template.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **templates_post**
> Template templates_post(template_payload => $template_payload)

Add Template

Add a new Template. Required Access Level: ModifyTemplates

### Example
```perl
use Data::Dumper;
use ElasticEmail::TemplatesApi;
my $api_instance = ElasticEmail::TemplatesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $template_payload = ElasticEmail::Object::TemplatePayload->new(); # TemplatePayload | 

eval {
    my $result = $api_instance->templates_post(template_payload => $template_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TemplatesApi->templates_post: $@\n";
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **template_payload** | [**TemplatePayload**](TemplatePayload.md)|  | 

### Return type

[**Template**](Template.md)

### Authorization

[apikey](../README.md#apikey)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

