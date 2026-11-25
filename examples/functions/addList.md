# Add List
This guide will walk you through the process of adding a new list of contacts to your account using the Perl library. 

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


### Let's dig into the code

Put the below code to your file.

Load libraries using below line:

```perl
use ElasticEmail::Object::ListPayload;
use ElasticEmail::ListsApi;
```

Read your API key from the `ELASTICEMAIL_API_KEY` environment variable (remember to check a required access level) and get a client instance. The script stops with an error if the variable is not set: 

```perl
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::ListsApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
);
```

Create an object with details about new list. Only `ListName` is required. 

You can also define if to allow unsubscription from list and pass an emails array of existing contacts on your account to add them to list during list creation. 

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/listsPost

```perl
my $list_payload = ElasticEmail::Object::ListPayload->new(); # ListPayload | 
$list_payload->list_name('List Name');
```

Create an instance of ListsApi that will be used to create a new list.

```perl
  my $result = $api_instance->lists_post(list_payload => $list_payload);
```

## The whole code to copy and paste:
```perl
use Data::Dumper;
use ElasticEmail::Object::ListPayload;
use ElasticEmail::ListsApi;
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::ListsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $list_payload = ElasticEmail::Object::ListPayload->new(); # ListPayload | 
$list_payload->list_name('List Name');
eval {
    my $result = $api_instance->lists_post(list_payload => $list_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ListsApi->lists_post: $@\n";
}
```

## Run the code
```
export ELASTICEMAIL_API_KEY=your-api-key
perl functions/addList.pl
```