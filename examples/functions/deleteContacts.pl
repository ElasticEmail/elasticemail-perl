use Data::Dumper;
use ElasticEmail::Object::EmailsPayload;
use ElasticEmail::ContactsApi;
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $emails_payload = ElasticEmail::Object::EmailsPayload->new(); # EmailsPayload | Provide either rule or a list of emails, not both.
$emails_payload->emails(['johnsmith@domain.com', 'johndoe@domain.com']);

eval {
    $api_instance->contacts_delete_post(emails_payload => $emails_payload);
    print Dumper('Contacts deleted');
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_delete_post: $@\n";
}
