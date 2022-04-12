# Send Transactional Emails

This guide will walk you through steps of sending a transactional email using the Perl library. 

*Required Access Level: SendHttp*

## What's a transactional email?
When using Elastic Email you send emails to your contacts. One of options is to send transational emails. Transactional emails can be described that they are emails generated as a response to a particular actions done by the subscriber eg. account changes, purchase receipts, other confirmations.

A transactional email have a limit of 50 maximum recipients.

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
use ElasticEmail::Object::TransactionalRecipient;
use ElasticEmail::Object::EmailTransactionalMessageData;
use ElasticEmail::Object::BodyPart;
use ElasticEmail::Object::Options;
```

Get client instance, generate and use your API key (remember to check a required access level): 

```perl
my $api_instance = ElasticEmail::EmailsApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
);
```

First you need to specify email details:
- email recipients
- email content:
    - body parts – in HTML, PlainText or in both
    - from email – it needs to be your validated email address
    - email subject

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/emailsTransactionalPost

```perl
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
```

And finally, call `emails_transactional_post` method from the API to send an email: 

```perl
my $result = $api_instance->emails_transactional_post(email_transactional_message_data => $email_transactional_message_data);
```


## The whole code to copy and paste:
```perl
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
```

## Run the code
```
perl functions/sendTransactionalEmails.pl
```