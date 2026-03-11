# Add Contacts

This guide will walk you through the process of adding new contacts to your account using the Perl library. 

*Required Access Level: ModifyContacts*

## What's contact?
When using Elastic Email, you send emails to contacts – recipients who receive your emails. Contacts can be grouped by created segments or lists.

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
use ElasticEmail::ContactsApi;
use ElasticEmail::Object::ContactPayload;
```

Get client instance, generate and use your API key (remember to check a required access level): 

```perl
my $api_instance = ElasticEmail::ContactsApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
);
```

Create an array with new contacts.

You can pass an array with up to 1000 contacts.

The `Email` field is mandatory, the rest is optional.

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/contactsPost

```perl
my $contact_payload = ElasticEmail::Object::ContactPayload->new(); # ARRAY[ContactPayload]
$contact_payload->email('test@domain.com');
$contact_payload->first_name('test');
$contact_payload->last_name('test');
$contact_payload->status('Active');
```

Specify an existing list name in options, otherwise contacts will be added to all contacts.

```perl
my $listnames = ["perlList"]; # ARRAY[string] | Names of lists to which the uploaded contacts should be added to
```

And finally, call `contacts_post` method from the API to add contacts: 

```perl
my $result = $api_instance->contacts_post(contact_payload => @contact_payload_array, listnames => $listnames);
```

## The whole code to copy and paste:

```perl
use Data::Dumper;
use JSON;
use ElasticEmail::ContactsApi;
use ElasticEmail::Object::ContactPayload;
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $contact_payload = ElasticEmail::Object::ContactPayload->new(); # ARRAY[ContactPayload] | 
$contact_payload->email('test@domain.com');
$contact_payload->first_name('test');
$contact_payload->last_name('test');
$contact_payload->status('Active');


my @contact_payload_array = ();
push(@contact_payload_array, $contact_payload);

my $listnames = ["perlList"]; # ARRAY[string] | Names of lists to which the uploaded contacts should be added to

eval {
    my $result = $api_instance->contacts_post(contact_payload => @contact_payload_array, listnames => $listnames);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_post: $@\n";
}

```

## Run the code
```
perl functions/addSingleContact.pl
```