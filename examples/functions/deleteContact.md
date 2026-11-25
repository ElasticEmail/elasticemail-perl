# Delete Contact

This guide will walk you through steps of deleting one contact from your account, by its email address, using the Perl library. To delete several contacts in one call, see [deleteContacts](deleteContacts.md).

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

Read your API key from the `ELASTICEMAIL_API_KEY` environment variable (remember to check a required access level) and get a client instance. The script stops with an error if the variable is not set:

```perl
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::ContactsApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
);
```

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/contactsByEmailDelete

Specify the email address of the contact to delete:

```perl
my $email = 'johnsmith@domain.com'; # string | Proper email address.
```

And finally, call `contacts_by_email_delete` method from the API to delete the contact:

```perl
$api_instance->contacts_by_email_delete(email => $email);
```

## The whole code to copy and paste:
```perl
use Data::Dumper;
use ElasticEmail::ContactsApi;
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email = 'johnsmith@domain.com'; # string | Proper email address.

eval {
    $api_instance->contacts_by_email_delete(email => $email);
    print Dumper('Contact deleted');
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_by_email_delete: $@\n";
}
```

## Run the code
```
export ELASTICEMAIL_API_KEY=your-api-key
perl functions/deleteContact.pl
```
