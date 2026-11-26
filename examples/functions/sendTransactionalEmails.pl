use Data::Dumper;
use ElasticEmail::EmailsApi;
use ElasticEmail::Object::TransactionalRecipient;
use ElasticEmail::Object::EmailTransactionalMessageData;
use ElasticEmail::Object::BodyPart;
use ElasticEmail::Object::Options;

my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::EmailsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

# README:BEGIN quickstart
my $email_transactional_message_data = ElasticEmail::Object::EmailTransactionalMessageData->new(); # EmailTransactionalMessageData | Email data
my $recipient = ElasticEmail::Object::TransactionalRecipient->new();

$recipient->to(['test@domain.com']);
$recipient->cc(['test@domain.com']);
$recipient->bcc(['test@domain.com']);
$email_transactional_message_data->recipients($recipient);


my $content = ElasticEmail::Object::EmailContent->new();

my $html_body = ElasticEmail::Object::BodyPart->new();
$html_body->content_type('HTML');
$html_body->content('<strong>test</strong>');

my $text_body = ElasticEmail::Object::BodyPart->new();
$text_body->content_type('PlainText');
$text_body->content('test');

$content->body([$html_body, $text_body]);

$content->reply_to('test@domain.com');
$content->from('test@domain.com');
$content->subject('template subject');
$content->template_name('template name');

my $options = ElasticEmail::Object::Options->new();
$options->channel_name('channel name');
$email_transactional_message_data->options($options);

$email_transactional_message_data->content($content);

# One new key per send (a UUID v4); reuse it only to retry this same send with the same message.
open my $urandom, '<:raw', '/dev/urandom' or die "Cannot read /dev/urandom: $!\n";
read($urandom, my $random_bytes, 16) == 16 or die "Cannot read /dev/urandom\n";
close $urandom;
my @uuid_bytes = unpack 'C16', $random_bytes;
$uuid_bytes[6] = ($uuid_bytes[6] & 0x0f) | 0x40;
$uuid_bytes[8] = ($uuid_bytes[8] & 0x3f) | 0x80;
my $idempotency_key = sprintf '%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x', @uuid_bytes;

eval {
    my $result = $api_instance->emails_transactional_post(email_transactional_message_data => $email_transactional_message_data, idempotency_key => $idempotency_key);
    printf "TransactionID: %s  Idempotency-Key: %s\n", $result->transaction_id, $idempotency_key;
};
if ($@) {
    warn "Exception when calling EmailsApi->emails_transactional_post: $@\n";
}
# README:END quickstart