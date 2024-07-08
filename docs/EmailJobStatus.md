# ElasticEmail::Object::EmailJobStatus

## Load the model package
```perl
use ElasticEmail::Object::EmailJobStatus;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **string** | ID number of your attachment | [optional] 
**status** | **string** | Name of status: submitted, complete, in_progress | [optional] 
**recipients_count** | **int** |  | [optional] 
**failed** | [**ARRAY[EmailJobFailedStatus]**](EmailJobFailedStatus.md) |  | [optional] 
**failed_count** | **int** | Total emails failed. | [optional] 
**sent** | **ARRAY[string]** |  | [optional] 
**sent_count** | **int** | Total emails sent. | [optional] 
**delivered** | **ARRAY[string]** | Number of delivered messages | [optional] 
**delivered_count** | **int** |  | [optional] 
**pending** | **ARRAY[string]** |  | [optional] 
**pending_count** | **int** |  | [optional] 
**opened** | **ARRAY[string]** | Number of opened messages | [optional] 
**opened_count** | **int** | Total emails opened. | [optional] 
**clicked** | **ARRAY[string]** | Number of clicked messages | [optional] 
**clicked_count** | **int** | Total emails clicked | [optional] 
**unsubscribed** | **ARRAY[string]** | Number of unsubscribed messages | [optional] 
**unsubscribed_count** | **int** | Total emails unsubscribed | [optional] 
**abuse_reports** | **ARRAY[string]** |  | [optional] 
**abuse_reports_count** | **int** |  | [optional] 
**message_ids** | **ARRAY[string]** | List of all MessageIDs for this job. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


