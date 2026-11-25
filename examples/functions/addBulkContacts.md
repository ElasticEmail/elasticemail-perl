
# Add Bulk Contacts

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

Create an instance of ContactsApi that will be used to add contacts.

```perl
my $list_name = "test"; # string | Name of an existing list to add these contacts to
my $encoding_name = "ASCII"; # string | In what encoding the file is uploaded
my $file = "./functions/files/contacts.csv"; # string

$api_instance->contacts_import_post(list_name => $list_name, encoding_name => $encoding_name, file => $file);
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

my $list_name = "test"; # string | Name of an existing list to add these contacts to
my $encoding_name = "ASCII"; # string | In what encoding the file is uploaded
my $file = "./functions/files/contacts.csv"; # string | 

eval {
    $api_instance->contacts_import_post(list_name => $list_name, encoding_name => $encoding_name, file => $file);
    print Dumper('Contacts added')
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_import_post: $@\n";
}
```
## Run the code
```
export ELASTICEMAIL_API_KEY=your-api-key
perl functions/addBulkContacts.pl
```