# ElasticEmail::Object::SmtpCredentialsPayload

## Load the model package
```perl
use ElasticEmail::Object::SmtpCredentialsPayload;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **string** | Name of the Credential for ease of reference. It must be a valid email address. | 
**expires** | **DateTime** | Date this SmtpCredential expires. | [optional] 
**restrict_access_to_ip_range** | **ARRAY[string]** | Which IPs can use this SmtpCredential | [optional] 
**subaccount** | **string** | Email of the subaccount for which this SmtpCredential should be created | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


