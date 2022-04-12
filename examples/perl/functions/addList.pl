use Data::Dumper;
use ElasticEmail::Object::ListPayload;
use ElasticEmail::ListsApi;
my $api_instance = ElasticEmail::ListsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $list_payload = ElasticEmail::Object::ListPayload->new(); # ListPayload | 
$list_payload->list_name('List Name');
eval {
    my $result = $api_instance->lists_post(list_payload => $list_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ListsApi->lists_post: $@\n";
}