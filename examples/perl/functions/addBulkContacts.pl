use Data::Dumper;
use ElasticEmail::ContactsApi;
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
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