use Data::Dumper;
use ElasticEmail::StatisticsApi;
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::StatisticsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->statistics_channels_get(limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling StatisticsApi->statistics_channels_get: $@\n";
}