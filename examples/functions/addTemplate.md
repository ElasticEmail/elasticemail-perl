# Add Template

This guide will walk you through the process of adding a new template to your account using the Perl library. 

*Required Access Level: ModifyTemplates*

## What's a tempalte?
When using Elastic Email you send emails to your contacts. A single template is a body of  email prepared and saved under given name. Till it's deleted it can be reused to send any number of emails.

## Preparation

Download our ElasticEmail-WebApiClient (https://github.com/ElasticEmail/ElasticEmail.WebApiClient.perl) and our library https://github.com/ElasticEmail/elasticemail-perl/tree/master/lib/ElasticEmail.

To install this module, run the following commands:

	perl Makefile.PL
	make
	make test
	make install
    
Create a new Perl file `snippet.pl` and open it in editor of your preference eg. Visual Studio Code (https://code.visualstudio.com/)


## Let's dig into the code

Put the below code to your file.

Load library using below line:

```perl
use ElasticEmail::TemplatesApi;
use ElasticEmail::Object::TemplatePayload;
use ElasticEmail::Object::BodyPart;
```

Get client instance, generate and use your API key (remember to check a required access level): 

```perl
my $api_instance = ElasticEmail::TemplatesApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
);
```

Create an object with details about new template:
- Name – name of your template by which it can be identified and used
- Subject – specify default subject for this template
- Body – specify acctual body content eg. in HTML, PlainText or both
- TemplateScope – specify scope, "Personal" template won't be shared, "Global" template can be shared with your sub accounts.

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/templatesPost

```perl
my $template_payload = ElasticEmail::Object::TemplatePayload->new(); # TemplatePayload | 
$template_payload->name('template name');
$template_payload->subject('template subject');

my $body = ElasticEmail::Object::BodyPart->new();
$body->content_type('HTML');
$body->content('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="EN">
          <head>
            <style type="text/css">
                .mydiv {
                    background: #FFBD5A;
                    text-align: center;
                    padding: 40px;
                }
            </style>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          </head>
        <body>
        <div class="mydiv">
            <h1>My template</h1>
        </div>
        </body>
        </html>');

$template_payload->template_scope('Global');
$template_payload->body([$body]);

```

And finally, call `templatesPost` method from the API to create a template: 

```perl
  my $result = $api_instance->templates_post(template_payload => $template_payload);
```

## The whole code to copy and paste:
```perl
use Data::Dumper;
use ElasticEmail::TemplatesApi;
use ElasticEmail::Object::TemplatePayload;
use ElasticEmail::Object::BodyPart;
my $api_instance = ElasticEmail::TemplatesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $template_payload = ElasticEmail::Object::TemplatePayload->new(); # TemplatePayload | 
$template_payload->name('template name');
$template_payload->subject('template subject');

my $body = ElasticEmail::Object::BodyPart->new();
$body->content_type('HTML');
$body->content('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="EN">
          <head>
            <style type="text/css">
                .mydiv {
                    background: #FFBD5A;
                    text-align: center;
                    padding: 40px;
                }
            </style>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          </head>
        <body>
        <div class="mydiv">
            <h1>My template</h1>
        </div>
        </body>
        </html>');

$template_payload->template_scope('Global');
$template_payload->body([$body]);

eval {
    my $result = $api_instance->templates_post(template_payload => $template_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TemplatesApi->templates_post: $@\n";
}
```

## Run the code
```
perl functions/addTemplate.pl
```