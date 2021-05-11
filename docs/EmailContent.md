# ElasticEmail::Object::EmailContent

## Load the model package
```perl
use ElasticEmail::Object::EmailContent;
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**body** | [**ARRAY[BodyPart]**](BodyPart.md) | List of e-mail body parts, with user-provided MIME types (text/html, text/plain etc) | [optional] 
**merge** | **HASH[string,string]** | A key-value collection of custom merge fields, shared between recipients. Should be used in e-mail body like so: {firstname}, {lastname} etc. | [optional] 
**attachments** | [**ARRAY[MessageAttachment]**](MessageAttachment.md) | Attachments provided by sending binary data | [optional] 
**headers** | **HASH[string,string]** | A key-value collection of custom e-mail headers. | [optional] 
**postback** | **string** | Postback header. | [optional] 
**from** | **string** | Your e-mail with an optional name (e.g.: John Doe &lt;email@domain.com&gt;) | [optional] 
**reply_to** | **string** | To what address should the recipients reply to (e.g. John Doe &lt;email@domain.com&gt;) | [optional] 
**subject** | **string** | Default subject of email. | [optional] 
**template_name** | **string** | Name of template. | [optional] 
**attach_files** | **ARRAY[string]** | Names of previously uploaded files that should be sent as downloadable attachments | [optional] 
**utm** | [**Utm**](Utm.md) | Utm marketing data to be attached to every link in this e-mail. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


