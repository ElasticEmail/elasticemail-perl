use Data::Dumper;
use ElasticEmail::ListsApi;
my $api_instance = ElasticEmail::ListsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = 'list name';  # string | Name of your list to delete.

eval {
    $api_instance->lists_by_name_delete(name => $name);
    print Dumper('List deleted');
};
if ($@) {
    warn "Exception when calling ListsApi->lists_by_name_delete: $@\n";
}