# ElasticEmail::Object::NewApiKey

## Load the model package
```perl
use ElasticEmail::Object::NewApiKey;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**token** | **string** | Unique token to be used in the system | [optional] 
**access_level** | [**ARRAY[AccessLevel]**](AccessLevel.md) | Access level or permission to be assigned to this ApiKey. | [optional] 
**name** | **string** | Name of the ApiKey. | [optional] 
**date_created** | **DATE_TIME** | Date this ApiKey was created. | [optional] 
**last_use** | **DATE_TIME** | Date this ApiKey was last used. | [optional] 
**expires** | **DATE_TIME** | Date this ApiKey expires. | [optional] 
**restrict_access_to_ip_range** | **ARRAY[string]** | Which IPs can use this ApiKey | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


