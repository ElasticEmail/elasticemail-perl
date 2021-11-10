# ElasticEmail::Object::RecipientEvent

## Load the model package
```perl
use ElasticEmail::Object::RecipientEvent;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**transaction_id** | **string** | ID number of transaction | [optional] 
**msg_id** | **string** | ID number of selected message. | [optional] 
**from_email** | **string** | Default From: email address. | [optional] 
**to** | **string** | Ending date for search in YYYY-MM-DDThh:mm:ss format. | [optional] 
**subject** | **string** | Default subject of email. | [optional] 
**event_type** | [**EventType**](EventType.md) |  | [optional] 
**event_date** | **DateTime** | Creation date | [optional] 
**channel_name** | **string** | Name of selected channel. | [optional] 
**message_category** | [**MessageCategory**](MessageCategory.md) |  | [optional] 
**next_try_on** | **DateTime** | Date of next try | [optional] 
**message** | **string** | Content of message, HTML encoded | [optional] 
**ip_address** | **string** | IP which this email was sent through | [optional] 
**pool_name** | **string** | Name of an IP pool this email was sent through | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


