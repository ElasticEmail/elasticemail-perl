# ElasticEmail::Object::VerificationFileResult

## Load the model package
```perl
use ElasticEmail::Object::VerificationFileResult;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**verification_id** | **string** | Identifier of this verification result | [optional] 
**filename** | **string** | Origin file name | [optional] 
**verification_status** | [**VerificationStatus**](VerificationStatus.md) | In what state does this verification result currently is | [optional] 
**file_upload_result** | [**FileUploadResult**](FileUploadResult.md) | How many emails were detected in the file for verification | [optional] 
**date_added** | **DateTime** | Date of creation in YYYY-MM-DDThh:ii:ss format | [optional] 
**source** | **string** | Origin file extension | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


