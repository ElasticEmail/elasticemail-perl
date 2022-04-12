# Load Template

This guide will walk you through steps of loading existing template details using the Perl library. 

*Required Access Level: ViewTemplates*

## What's a template?
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
```

Get client instance, generate and use your API key (remember to check a required access level): 

```perl
my $api_instance = ElasticEmail::TemplatesApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
);
```

To load a template you need to specfiy it's name:

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/templatesPost

```perl
my $name = 'template name'; # string | Name of template.
```

And finally, call `templates_by_name_get` method from the API to load a template: 

```perl
my $result = $api_instance->templates_by_name_get(name => $name);
```

## The whole code to copy and paste:
```
use Data::Dumper;
use ElasticEmail::TemplatesApi;
my $api_instance = ElasticEmail::TemplatesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = 'template name'; # string | Name of template.

eval {
    my $result = $api_instance->templates_by_name_get(name => $name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TemplatesApi->templates_by_name_get: $@\n";
}
```

## Run the code
```
perl functions/loadTemplate.pl
```