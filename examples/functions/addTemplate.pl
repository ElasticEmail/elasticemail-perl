use Data::Dumper;
use ElasticEmail::TemplatesApi;
use ElasticEmail::Object::TemplatePayload;
use ElasticEmail::Object::BodyPart;
my $api_instance = ElasticEmail::TemplatesApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $template_payload = ElasticEmail::Object::TemplatePayload->new(); # TemplatePayload | 
$template_payload->name('template name');
$template_payload->subject('template subject');

my $body = ElasticEmail::Object::BodyPart->new();
$body->content_type('HTML');
$body->content('<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="EN">
          <head>
            <style type="text/css">
                .mydiv {
                    background: #FFBD5A;
                    text-align: center;
                    padding: 40px;
                }
            </style>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          </head>
        <body>
        <div class="mydiv">
            <h1>My template</h1>
        </div>
        </body>
        </html>');

$template_payload->template_scope('Global');
$template_payload->body([$body]);

eval {
    my $result = $api_instance->templates_post(template_payload => $template_payload);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling TemplatesApi->templates_post: $@\n";
}