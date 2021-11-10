# ElasticEmail::Object::Template

## Load the model package
```perl
use ElasticEmail::Object::Template;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**template_type** | [**TemplateType**](TemplateType.md) |  | [optional] 
**name** | **string** | Template name | [optional] 
**date_added** | **DateTime** | Date of creation in YYYY-MM-DDThh:ii:ss format | [optional] 
**subject** | **string** | Default subject of email. | [optional] 
**body** | [**ARRAY[BodyPart]**](BodyPart.md) | Email content of this template | [optional] 
**template_scope** | [**TemplateScope**](TemplateScope.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


