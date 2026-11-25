use Data::Dumper;
use ElasticEmail::StatisticsApi;
use Date::Parse;
use DateTime;
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::StatisticsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $from = DateTime->from_epoch(epoch => str2time('2021-02-01T11:00:00')); # DateTime | Starting date for search in YYYY-MM-DDThh:mm:ss format.
my $to = DateTime->from_epoch(epoch => str2time('2022-03-01T11:00:00')); # DateTime | Ending date for search in YYYY-MM-DDThh:mm:ss format.

eval {
    my $result = $api_instance->statistics_get(from => $from, to => $to);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling StatisticsApi->statistics_get: $@\n";
}