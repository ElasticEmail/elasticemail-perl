# ElasticEmail::Object::CampaignOptions

## Load the model package
```perl
use ElasticEmail::Object::CampaignOptions;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**delivery_optimization** | [**DeliveryOptimizationType**](DeliveryOptimizationType.md) |  | [optional] 
**track_opens** | **boolean** | Should the opens be tracked? If no value has been provided, Account&#39;s default setting will be used. | [optional] 
**track_clicks** | **boolean** | Should the clicks be tracked? If no value has been provided, Account&#39;s default setting will be used. | [optional] 
**schedule_for** | **DATE_TIME** | Date when this Campaign is scheduled to be sent on | [optional] 
**trigger_frequency** | **double** | How often (in minutes) to send the campaign | [optional] 
**trigger_count** | **int** | How many times send the campaign | [optional] 
**split_options** | [**SplitOptions**](SplitOptions.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


