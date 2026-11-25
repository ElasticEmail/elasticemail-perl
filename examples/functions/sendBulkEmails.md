# Send Bulk Emails

This guide will walk you through steps of sending a bulk email using the Perl library. 

*Required Access Level: SendHttp*

## What's a bulk email?
When using Elastic Email you send emails to your contacts. One of options is to send bulk emails. Bulk email can be described as a single email message send to a large group at once.

## Preparation

Download our ElasticEmail-WebApiClient (https://github.com/ElasticEmail/ElasticEmail.WebApiClient.perl) and our library https://github.com/ElasticEmail/elasticemail-perl/tree/master/lib/ElasticEmail.

To install this module, run the following commands:

	perl Makefile.PL
	make
	make test
	make install
    
Create a new Perl file `snippet.pl` and open it in editor of your preference eg. Visual Studio Code (https://code.visualstudio.com/)

## Let's dig into the code

Put the below code to your file.

Load libraries using below line:

```perl
use ElasticEmail::EmailsApi;
use ElasticEmail::Object::EmailMessageData;
use ElasticEmail::Object::EmailRecipient;
use ElasticEmail::Object::EmailContent;
use ElasticEmail::Object::BodyPart;
```

Read your API key from the `ELASTICEMAIL_API_KEY` environment variable (remember to check a required access level) and get a client instance. The script stops with an error if the variable is not set: 

```perl
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::EmailsApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
);
```

First you need to specify email details:
- email recipients:
    - this example demostrates merge fields usage, for each recipient `{name}` will be changed to recipient's name
- email content:
    - body parts – in HTML, PlainText or in both
    - from email – it needs to be your validated email address
    - email subject

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/emailsPost

```perl
my $email_message_data = ElasticEmail::Object::EmailMessageData->new(); # EmailMessageData | Email data
my $recipient = ElasticEmail::Object::EmailRecipient->new();
$recipient->email('test@domain.com');

my $content = ElasticEmail::Object::EmailContent->new();

my $html_body = ElasticEmail::Object::BodyPart->new();
$html_body->content_type('HTML');
$html_body->content('<strong>body content</strong>');

my $text_body = ElasticEmail::Object::BodyPart->new();
$text_body->content_type('PlainText');
$text_body->content('body content');

$content->body([$html_body, $text_body]);

$content->reply_to('test@domain.com');
$content->from('test@domain.com');
$content->subject('template subject');
$content->template_name('template name');


$email_message_data->recipients([$recipient]);
$email_message_data->content($content);
```


Create an idempotency key, so the send can be retried after a timeout without delivering the email twice: a retry with the same key and the same message gets the stored response instead of sending again. Any UUID v4 works; this one is built from random bytes with core Perl:

```perl
# One new key per send (a UUID v4); reuse it only to retry this same send with the same message.
open my $urandom, '<:raw', '/dev/urandom' or die "Cannot read /dev/urandom: $!\n";
read($urandom, my $random_bytes, 16) == 16 or die "Cannot read /dev/urandom\n";
close $urandom;
my @uuid_bytes = unpack 'C16', $random_bytes;
$uuid_bytes[6] = ($uuid_bytes[6] & 0x0f) | 0x40;
$uuid_bytes[8] = ($uuid_bytes[8] & 0x3f) | 0x80;
my $idempotency_key = sprintf '%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x', @uuid_bytes;
```

And finally, call `emails_post` method from the API to send the email, passing the key:

```javascript
my $result = $api_instance->emails_post(email_message_data => $email_message_data, idempotency_key => $idempotency_key);
```

## The whole code to copy and paste:
```perl
use Data::Dumper;
use ElasticEmail::EmailsApi;
use ElasticEmail::Object::EmailMessageData;
use ElasticEmail::Object::EmailRecipient;
use ElasticEmail::Object::EmailContent;
use ElasticEmail::Object::BodyPart;
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::EmailsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $email_message_data = ElasticEmail::Object::EmailMessageData->new(); # EmailMessageData | Email data
my $recipient = ElasticEmail::Object::EmailRecipient->new();
$recipient->email('test@domain.com');

my $content = ElasticEmail::Object::EmailContent->new();

my $html_body = ElasticEmail::Object::BodyPart->new();
$html_body->content_type('HTML');
$html_body->content('<strong>body content</strong>');

my $text_body = ElasticEmail::Object::BodyPart->new();
$text_body->content_type('PlainText');
$text_body->content('body content');

$content->body([$html_body, $text_body]);

$content->reply_to('test@domain.com');
$content->from('test@domain.com');
$content->subject('template subject');
$content->template_name('template name');


$email_message_data->recipients([$recipient]);
$email_message_data->content($content);

# One new key per send (a UUID v4); reuse it only to retry this same send with the same message.
open my $urandom, '<:raw', '/dev/urandom' or die "Cannot read /dev/urandom: $!\n";
read($urandom, my $random_bytes, 16) == 16 or die "Cannot read /dev/urandom\n";
close $urandom;
my @uuid_bytes = unpack 'C16', $random_bytes;
$uuid_bytes[6] = ($uuid_bytes[6] & 0x0f) | 0x40;
$uuid_bytes[8] = ($uuid_bytes[8] & 0x3f) | 0x80;
my $idempotency_key = sprintf '%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x', @uuid_bytes;

eval {
    my $result = $api_instance->emails_post(email_message_data => $email_message_data, idempotency_key => $idempotency_key);
    printf "TransactionID: %s  Idempotency-Key: %s\n", $result->transaction_id, $idempotency_key;
};
if ($@) {
    warn "Exception when calling EmailsApi->emails_post: $@\n";
}
```

## Run the code
```
export ELASTICEMAIL_API_KEY=your-api-key
perl functions/sendBulkEmails.pl
```