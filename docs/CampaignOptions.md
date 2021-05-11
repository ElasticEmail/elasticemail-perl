# ElasticEmail::Object::CampaignOptions

## Load the model package
```perl
use ElasticEmail::Object::CampaignOptions;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**delivery_optimization** | [**DeliveryOptimizationType**](DeliveryOptimizationType.md) | How to order email delivery - by recipients&#39; engagement score or by the time they open the most of the emails that were sent to them | [optional] 
**track_opens** | **boolean** | Should the opens be tracked? If no value has been provided, Account&#39;s default setting will be used. | [optional] 
**track_clicks** | **boolean** | Should the clicks be tracked? If no value has been provided, Account&#39;s default setting will be used. | [optional] 
**schedule_for** | **DateTime** | Date when this Campaign is scheduled to be sent on | [optional] 
**split_options** | [**SplitOptions**](SplitOptions.md) | Optional options for A/X split campaigns. Will be ignored if only one template content was provided | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


