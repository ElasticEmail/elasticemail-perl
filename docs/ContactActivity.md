# ElasticEmail::Object::ContactActivity

## Load the model package
```perl
use ElasticEmail::Object::ContactActivity;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**total_sent** | **int** | Total emails sent. | [optional] 
**total_opened** | **int** | Total emails opened. | [optional] 
**total_clicked** | **int** | Total emails clicked | [optional] 
**total_failed** | **int** | Total emails failed. | [optional] 
**last_sent** | **DATE_TIME** | Last date when an email was sent to this contact | [optional] 
**last_opened** | **DATE_TIME** | Date this contact last opened an email | [optional] 
**last_clicked** | **DATE_TIME** | Date this contact last clicked an email | [optional] 
**last_failed** | **DATE_TIME** | Last date when an email sent to this contact bounced | [optional] 
**last_ip** | **string** | IP from which this contact opened or clicked their email last time | [optional] 
**error_code** | **int** | Last RFC Error code if any occurred | [optional] 
**friendly_error_message** | **string** | Last RFC error message if any occurred | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


