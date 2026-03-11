use Data::Dumper;
use ElasticEmail::ContactsApi;
my $api_instance = ElasticEmail::ContactsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $file_format = 'Csv'; # ExportFileFormats | Format of the exported file
my $rule = 'Status = Engaged'; # string | Query used for filtering.
my $compression_format = 'None'; # CompressionFormat | FileResponse compression format. None or Zip.
my $file_name = 'Engaged Contacts.txt'; # string | Name of your file including extension.

eval {
    my $result = $api_instance->contacts_export_post(file_format => $file_format, rule => $rule, compression_format => $compression_format, file_name => $file_name);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling ContactsApi->contacts_export_post: $@\n";
}