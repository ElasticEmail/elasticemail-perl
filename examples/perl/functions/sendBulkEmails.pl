use Data::Dumper;
use ElasticEmail::EmailsApi;
use ElasticEmail::Object::EmailMessageData;
use ElasticEmail::Object::EmailRecipient;
use ElasticEmail::Object::EmailContent;
use ElasticEmail::Object::BodyPart;
my $api_instance = ElasticEmail::EmailsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email_message_data = ElasticEmail::Object::EmailMessageData->new(); # EmailMessageData | Email data
my $recipient = ElasticEmail::Object::EmailRecipient->new();
$recipient->email('test@domain.com');

my $content = ElasticEmail::Object::EmailContent->new();

my $body = ElasticEmail::Object::BodyPart->new();
$body->content('body content');
my $body_content_type = 'HTML';
$body->content_type($body_content_type);
$content->body([$body]);

$content->reply_to('test@domain.com');
$content->from('test@domain.com');
$content->subject('template subject');
$content->template_name('template name');


$email_message_data->recipients([$recipient]);
$email_message_data->content($content);

eval {
    my $result = $api_instance->emails_post(email_message_data => $email_message_data);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EmailsApi->emails_post: $@\n";
}