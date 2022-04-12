use Data::Dumper;
use ElasticEmail::CampaignsApi;
my $api_instance = ElasticEmail::CampaignsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $search = ""; # string | Text fragment used for searching in Campaign name (using the 'contains' rule)
my $offset = 20; # int | How many items should be returned ahead.
my $limit = 100; # int | Maximum number of returned items.

eval {
    my $result = $api_instance->campaigns_get(search => $search, offset => $offset, limit => $limit);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling CampaignsApi->campaigns_get: $@\n";
}