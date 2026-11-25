use Data::Dumper;
use ElasticEmail::CampaignsApi;
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::CampaignsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = 'hello campaign'; # string | Name of Campaign to get

eval {
    my $result = $api_instance->campaigns_by_name_get(name => $name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling CampaignsApi->campaigns_by_name_get: $@\n";
}
