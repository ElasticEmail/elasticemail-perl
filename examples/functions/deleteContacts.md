
# Delete Contacts

This guide will walk you through steps of deleting contact(s) from your account using the Perl library.

*Required Access Level: ModifyContacts*

## What's a contact?
When using Elastic Email, you send emails to contacts – recipients who receive your emails. Contacts can be grouped by created segments or lists.

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
use ElasticEmail::ContactsApi;
```

Get client instance, generate and use your API key (remember to check a required access level): 

```perl
my $api_instance = ElasticEmail::ContactsApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
);
```

Create an object with an array of contact to delete.

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/contactsByEmailDelete

Create an instance of CampaignsApi that will be used to create a campaign.

```perl
my $email = 'test@domain.com'; # string | Proper email address.
$response = $apiInstance->contactsByEmailDelete($email);
```
And finally, call `contacts_by_email_delete` method from the API to delete campaign: 

```perl
$api_instance->contacts_by_email_delete(email => $email);
```

## The whole code to copy and paste:
```perl
use Data::Dumper;
use ElasticEmail::ContactsApi;
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = 'test@domain.com'; # string | Proper email address.

eval {
    $api_instance->contacts_by_email_delete(email => $email);
    print Dumper('Contact deleted')
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_by_email_delete: $@\n";
}
```

## Run the code
```
perl functions/deleteContacts.pl
```