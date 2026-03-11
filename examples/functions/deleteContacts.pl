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