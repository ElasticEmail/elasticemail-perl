# ElasticEmail::Object::SmtpCredentials

## Load the model package
```perl
use ElasticEmail::Object::SmtpCredentials;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**access_level** | [**AccessLevel**](AccessLevel.md) |  | [optional] 
**name** | **string** | Name of the key. | [optional] 
**date_created** | **DATE_TIME** | Date this SmtpCredential was created. | [optional] 
**last_use** | **DATE_TIME** | Date this SmtpCredential was last used. | [optional] 
**expires** | **DATE_TIME** | Date this SmtpCredential expires. | [optional] 
**restrict_access_to_ip_range** | **ARRAY[string]** | Which IPs can use this SmtpCredential | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


