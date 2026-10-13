# ElasticEmail::Object::Webhook

## Load the model package
```perl
use ElasticEmail::Object::Webhook;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**webhook_id** | **string** | Public webhook ID | [optional] 
**name** | **string** | Filename | [optional] 
**date_created** | **DATE_TIME** | Creation date. | [optional] 
**date_updated** | **DATE_TIME** | Last change date | [optional] 
**url** | **string** | URL of notification. | [optional] 
**notify_once_per_email** | **boolean** |  | [optional] 
**notification_for_sent** | **boolean** |  | [optional] 
**notification_for_opened** | **boolean** |  | [optional] 
**notification_for_clicked** | **boolean** |  | [optional] 
**notification_for_unsubscribed** | **boolean** |  | [optional] 
**notification_for_abuse_report** | **boolean** |  | [optional] 
**notification_for_error** | **boolean** |  | [optional] 
**is_enabled** | **boolean** |  | [optional] 
**signing_enabled** | **boolean** | Requests carry an HMAC-SHA256 signature. Chosen when the webhook is created and can&#39;t be changed. | [optional] 
**delivery_method** | [**WebhookDeliveryMethod**](WebhookDeliveryMethod.md) |  | [optional] 
**signing_secret** | **string** | Signing secret - returned only once, when a webhook is created with signing or its secret is rotated. Store it safely. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


