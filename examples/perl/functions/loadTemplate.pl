use Data::Dumper;
use ElasticEmail::TemplatesApi;
my $api_instance = ElasticEmail::TemplatesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = 'template name'; # string | Name of template.

eval {
    my $result = $api_instance->templates_by_name_get(name => $name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TemplatesApi->templates_by_name_get: $@\n";
}