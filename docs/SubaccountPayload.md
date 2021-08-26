# ElasticEmail::Object::SubaccountPayload

## Load the model package
```perl
use ElasticEmail::Object::SubaccountPayload;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**email** | **string** | Proper email address. | 
**password** | **string** | Current password. | 
**send_activation** | **boolean** | True, if you want to send activation email to this Account to confirm the creation of a new SubAccount. Otherwise, false (SubAccount will immediately be Active). | [optional] 
**settings** | [**SubaccountSettingsInfoPayload**](SubaccountSettingsInfoPayload.md) | SubAccount settings | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


