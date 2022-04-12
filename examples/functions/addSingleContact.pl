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