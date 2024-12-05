# ElasticEmail::Object::EmailStatus

## Load the model package
```perl
use ElasticEmail::Object::EmailStatus;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**from** | **string** | Email address this email was sent from. | [optional] 
**to** | **string** | Email address this email was sent to. | [optional] 
**date** | **DATE_TIME** | Date the email was submitted. | [optional] 
**status** | [**LogJobStatus**](LogJobStatus.md) |  | [optional] 
**status_name** | **string** | Name of email&#39;s status | [optional] 
**status_change_date** | **DATE_TIME** | Date of last status change. | [optional] 
**date_sent** | **DATE_TIME** | Date when the email was sent | [optional] 
**date_opened** | **DATE_TIME** | Date when the email changed the status to &#39;opened&#39; | [optional] 
**date_clicked** | **DATE_TIME** | Date when the email changed the status to &#39;clicked&#39; | [optional] 
**error_message** | **string** | Detailed error or bounced message. | [optional] 
**transaction_id** | **string** | ID number of transaction | [optional] 
**envelope_from** | **string** | Envelope from address | [optional] 
**error_category** | [**MessageCategoryEnum**](MessageCategoryEnum.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


