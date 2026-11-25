use Data::Dumper;
use ElasticEmail::ListsApi;
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::ListsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = 'your list name'; # string | Name of your list.

eval {
    my $result = $api_instance->lists_by_name_get(name => $name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ListsApi->lists_by_name_get: $@\n";
}