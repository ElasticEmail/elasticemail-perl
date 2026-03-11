# Delete List:
This guide will walk you through steps of removing contacts list from your account using the Perl library.

*Required Access Level: ModifyContacts*

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

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/contactsByEmailDelete

Create an instance of ListsApi that will be used to delete a list.

```perl
my $name = 'list name';  # string | Name of your list to delete.
$response = $apiInstance->listsByNameDelete($name);
```


And finally, call `lists_by_name_delete` method from the API to delete a list: 

```perl
$api_instance->lists_by_name_delete(name => $name);
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

my $name = 'list name';  # string | Name of your list to delete.

eval {
    $api_instance->lists_by_name_delete(name => $name);
    print Dumper('List deleted');
};
if ($@) {
    warn "Exception when calling ListsApi->lists_by_name_delete: $@\n";
}
```

## Run the code
```
perl functions/deleteList.pl
```