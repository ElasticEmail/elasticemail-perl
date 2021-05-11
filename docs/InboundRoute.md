# ElasticEmail::Object::InboundRoute

## Load the model package
```perl
use ElasticEmail::Object::InboundRoute;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**public_id** | **string** |  | [optional] 
**name** | **string** | Name of this route | [optional] 
**filter_type** | [**InboundRouteFilterType**](InboundRouteFilterType.md) | Type of the filter | [optional] 
**filter** | **string** | Filter of the inbound data | [optional] 
**action_type** | [**InboundRouteActionType**](InboundRouteActionType.md) | Type of action to take | [optional] 
**action_parameter** | **string** | URL address or Email to notify about the inbound | [optional] 
**sort_order** | **int** | Place of this route in your routes queue&#39;s order | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


