# Upload Contacts

This guide will walk you through the process of adding new contacts to your account, by uploading them from a CSV file, using the Perl library.

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

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/contactsImportPost

Set the path to the CSV file and its encoding. There is a sample file in `files/contacts.csv`. Optionally, name an existing list to add the contacts to; otherwise they are only added to all contacts. The client reads the file and sends it as the multipart `file` field:

```perl
my $list_name = 'My New List';
my $encoding_name = 'utf-8';
my $file = dirname(__FILE__) . '/files/contacts.csv'; # needs: use File::Basename qw(dirname);
```

And finally, call `contacts_import_post` method from the API to upload the contacts:

```perl
$api_instance->contacts_import_post(list_name => $list_name, encoding_name => $encoding_name, file => $file);
```

## The whole code to copy and paste:
```perl
use Data::Dumper;
use File::Basename qw(dirname);
use ElasticEmail::ContactsApi;
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $list_name = 'My New List'; # string | Name of an existing list to add these contacts to (optional)
my $encoding_name = 'utf-8'; # string | In what encoding the file is uploaded
my $file = dirname(__FILE__) . '/files/contacts.csv'; # string | Path to the CSV, sent as the multipart "file" field

eval {
    $api_instance->contacts_import_post(list_name => $list_name, encoding_name => $encoding_name, file => $file);
    print Dumper('Contacts uploaded');
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_import_post: $@\n";
}
```

## Run the code
```
export ELASTICEMAIL_API_KEY=your-api-key
perl functions/uploadContacts.pl
```
