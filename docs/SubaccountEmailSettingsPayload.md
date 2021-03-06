# ElasticEmail::Object::SubaccountEmailSettingsPayload

## Load the model package
```perl
use ElasticEmail::Object::SubaccountEmailSettingsPayload;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**requires_email_credits** | **boolean** | True, if Account needs credits to send emails. Otherwise, false | [optional] 
**email_size_limit** | **int** | Maximum size of email including attachments in MB&#39;s | [optional] 
**daily_send_limit** | **int** | Amount of emails Account can send daily | [optional] 
**max_contacts** | **int** | Maximum number of contacts the Account can have. 0 means that parent account&#39;s limit is used. | [optional] 
**enable_private_ip_purchase** | **boolean** | Can the SubAccount purchase Private IP for themselves | [optional] 
**pool_name** | **string** | Name of your custom IP Pool to be used in the sending process | [optional] 
**valid_sender_domain_only** | **boolean** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


