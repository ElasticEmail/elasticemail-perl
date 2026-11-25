# Export Contacts

This guide will walk you through the process of exporting selected contacts to downloadable file using the Perl library.

*Required Access Level: Export*

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

Create an options object:

fileFormat - specify format in which file should be created, options are: "Csv" "Xml" "Json".
fileName - you can specify file name of your choice
rule - eg. rule=Status%20=%20Engaged – Query used for filtering

Other options:

compressionFormat - "None" "Zip"
emails - select contacts to export by providing array of emails

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/contactsExportPost

```perl
my $file_format = 'Csv'; # ExportFileFormats | Format of the exported file
my $rule = 'Status = Engaged'; # string | Query used for filtering.
my $compression_format = 'None'; # CompressionFormat | FileResponse compression format. None or Zip.
my $file_name = 'Engaged Contacts.txt'; # string | Name of your file including extension.
```
And finally, call `contacts_export_post` method from the API to export contacts: 

```perl
my $result = $api_instance->contacts_export_post(file_format => $file_format, rule => $rule, compression_format => $compression_format, file_name => $file_name);
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

my $file_format = 'Csv'; # ExportFileFormats | Format of the exported file
my $rule = 'Status = Engaged'; # string | Query used for filtering.
my $compression_format = 'None'; # CompressionFormat | FileResponse compression format. None or Zip.
my $file_name = 'Engaged Contacts.txt'; # string | Name of your file including extension.

eval {
    my $result = $api_instance->contacts_export_post(file_format => $file_format, rule => $rule, compression_format => $compression_format, file_name => $file_name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_export_post: $@\n";
}
```

## Run the code
```
export ELASTICEMAIL_API_KEY=your-api-key
perl functions/exportContacts.pl
```