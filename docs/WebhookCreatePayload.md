# ElasticEmail::Object::WebhookCreatePayload

## Load the model package
```perl
use ElasticEmail::Object::WebhookCreatePayload;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **string** | Filename | 
**url** | **string** | URL of notification. | 
**notify_once_per_email** | **boolean** |  | [optional] 
**notification_for_sent** | **boolean** |  | [optional] 
**notification_for_opened** | **boolean** |  | [optional] 
**notification_for_clicked** | **boolean** |  | [optional] 
**notification_for_unsubscribed** | **boolean** |  | [optional] 
**notification_for_abuse_report** | **boolean** |  | [optional] 
**notification_for_error** | **boolean** |  | [optional] 
**enable_signing** | **boolean** | Sign every request with HMAC-SHA256. Can be set only when the webhook is created. Default: false. | [optional] 
**delivery_method** | [**WebhookDeliveryMethod**](WebhookDeliveryMethod.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


