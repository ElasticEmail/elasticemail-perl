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
