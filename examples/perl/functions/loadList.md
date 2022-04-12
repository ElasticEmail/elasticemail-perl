# Load List

This guide will walk you through the process of loading details about contacts list on your account using the Perl library. 

*Required Access Level: ViewContacts*

## What's a list?
When using Elastic Email, you send emails to contacts – recipients who receive your emails. Contacts can be grouped by created segments or lists. Segments add contacts automatically when specfied conditions are met, and contacts on lists are managed manually.

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
use ElasticEmail::ListsApi;
```

Get client instance, generate and use your API key (remember to check a required access level): 

```perl
my $api_instance = ElasticEmail::ListsApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
);
```

The only thing needed is a list name.

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/listsByNameGet

```perl
my $name = 'your list name'; # string | Name of your list.
```

And finally, call `lists_by_name_get` method from the API to load list details: 

```perl
my $result = $api_instance->lists_by_name_get(name => $name);
```

## The whole code to copy and paste:
```perl
use Data::Dumper;
use ElasticEmail::ListsApi;
my $api_instance = ElasticEmail::ListsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = 'your list name'; # string | Name of your list.

eval {
    my $result = $api_instance->lists_by_name_get(name => $name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ListsApi->lists_by_name_get: $@\n";
}
```

## Run the code
```
perl functions/loadList.pl
```