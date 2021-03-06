# ElasticEmail::Object::Options

## Load the model package
```perl
use ElasticEmail::Object::Options;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**time_offset** | **int** | By how long should an e-mail be delayed (in minutes). Maximum is 35 days. | [optional] 
**pool_name** | **string** | Name of your custom IP Pool to be used in the sending process | [optional] 
**channel_name** | **string** | Name of selected channel. | [optional] 
**encoding** | [**EncodingType**](EncodingType.md) |  | [optional] 
**track_opens** | **boolean** | Should the opens be tracked? If no value has been provided, Account&#39;s default setting will be used. | [optional] 
**track_clicks** | **boolean** | Should the clicks be tracked? If no value has been provided, Account&#39;s default setting will be used. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


