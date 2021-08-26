# ElasticEmail::Object::Campaign

## Load the model package
```perl
use ElasticEmail::Object::Campaign;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**content** | [**ARRAY[CampaignTemplate]**](CampaignTemplate.md) | Campaign&#39;s email content. Provide multiple items to send an A/X Split Campaign | [optional] 
**name** | **string** | Campaign name | 
**status** | [**CampaignStatus**](CampaignStatus.md) | Campaign status | [optional] 
**recipients** | [**CampaignRecipient**](CampaignRecipient.md) | Recipients this campaign should be sent to | 
**options** | [**CampaignOptions**](CampaignOptions.md) | Campaign sending options | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


