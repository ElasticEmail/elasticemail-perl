# ElasticEmail::Object::EmailValidationResult

## Load the model package
```perl
use ElasticEmail::Object::EmailValidationResult;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account** | **string** | Local part of an email | [optional] 
**domain** | **string** | Name of selected domain. | [optional] 
**email** | **string** | Full email address that was verified | [optional] 
**suggested_spelling** | **string** | Suggested spelling if a possible mistake was found | [optional] 
**disposable** | **boolean** | Does the email have a temporary domain | [optional] 
**role** | **boolean** | Is an email a role email (e.g. info@, noreply@ etc.) | [optional] 
**reason** | **string** | All detected issues | [optional] 
**date_added** | **DATE_TIME** | Added date | [optional] 
**result** | [**EmailValidationStatus**](EmailValidationStatus.md) |  | [optional] 
**predicted_score** | **double** | Predicted score | [optional] 
**predicted_status** | [**EmailPredictedValidationStatus**](EmailPredictedValidationStatus.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


