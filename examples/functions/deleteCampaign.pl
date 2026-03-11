use Data::Dumper;
use ElasticEmail::CampaignsApi;
my $api_instance = ElasticEmail::CampaignsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "campaign name"; # string | Name of Campaign to delete

eval {
    $api_instance->campaigns_by_name_delete(name => $name);
};
if ($@) {
    warn "Exception when calling CampaignsApi->campaigns_by_name_delete: $@\n";
}