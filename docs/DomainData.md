# ElasticEmail::Object::DomainData

## Load the model package
```perl
use ElasticEmail::Object::DomainData;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**validation_log** | **string** | Domain validation results - when domain has been running through validation process | [optional] 
**domain** | **string** | Name of selected domain. | [optional] 
**default_domain** | **boolean** | True, if domain is used as default. Otherwise, false, | [optional] 
**spf** | **boolean** | True, if SPF record is verified | [optional] 
**dkim** | **boolean** | True, if DKIM record is verified | [optional] 
**mx** | **boolean** | True, if MX record is verified | [optional] 
**dmarc** | **boolean** |  | [optional] 
**is_rewrite_domain_valid** | **boolean** | True, if tracking CNAME record is verified | [optional] 
**verify** | **boolean** | True, if DKIM, SPF, or tracking are still to be verified | [optional] 
**type** | [**TrackingType**](TrackingType.md) |  | [optional] 
**tracking_status** | [**TrackingValidationStatus**](TrackingValidationStatus.md) |  | [optional] 
**certificate_status** | [**CertificateValidationStatus**](CertificateValidationStatus.md) |  | [optional] 
**certificate_validation_error** | **string** |  | [optional] 
**tracking_type_user_request** | [**TrackingType**](TrackingType.md) |  | [optional] 
**verp** | **boolean** |  | [optional] 
**custom_bounces_domain** | **string** |  | [optional] 
**is_custom_bounces_domain_default** | **boolean** |  | [optional] 
**is_marked_for_deletion** | **boolean** |  | [optional] 
**ownership** | [**DomainOwner**](DomainOwner.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


