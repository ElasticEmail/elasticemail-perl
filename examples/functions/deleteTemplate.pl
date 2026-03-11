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
    $api_instance->templates_by_name_delete(name => $name);
    print Dumper('Template deleted');
};
if ($@) {
    warn "Exception when calling TemplatesApi->templates_by_name_delete: $@\n";
}