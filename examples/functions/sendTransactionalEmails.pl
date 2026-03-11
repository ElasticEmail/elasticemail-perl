use Data::Dumper;
use ElasticEmail::EmailsApi;
use ElasticEmail::Object::TransactionalRecipient;
use ElasticEmail::Object::EmailTransactionalMessageData;
use ElasticEmail::Object::BodyPart;
use ElasticEmail::Object::Options;

my $api_instance = ElasticEmail::EmailsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email_transactional_message_data = ElasticEmail::Object::EmailTransactionalMessageData->new(); # EmailTransactionalMessageData | Email data
my $recipient = ElasticEmail::Object::TransactionalRecipient->new();

$recipient->to(['test@domain.com']);
$recipient->cc(['test@domain.com']);
$recipient->bcc(['test@domain.com']);
$email_transactional_message_data->recipients($recipient);


my $content = ElasticEmail::Object::EmailContent->new();

my $body = ElasticEmail::Object::BodyPart->new();
$body->content('test');
my $body_content_type = 'HTML';
$body->content_type($body_content_type);
$content->body([$body]);

$content->reply_to('test@domain.com');
$content->from('test@domain.com');
$content->subject('template subject');
$content->template_name('template name');

my $options = ElasticEmail::Object::Options->new();
$options->channel_name('channel name');
$email_transactional_message_data->options($options);

$email_transactional_message_data->content($content);

eval {
    my $result = $api_instance->emails_transactional_post(email_transactional_message_data => $email_transactional_message_data);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling EmailsApi->emails_transactional_post: $@\n";
}