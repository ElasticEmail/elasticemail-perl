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

Get client instance, generate and use your API key (remember to check a required access level): 

```perl
my $api_instance = ElasticEmail::EmailsApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
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
```


And finally, call `emails_post` method from the API to send an email: 

```javascript
my $result = $api_instance->emails_post(email_message_data => $email_message_data);
```

## The whole code to copy and paste:
```perl
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
```

## Run the code
```
perl functions/sendBulkEmails.pl
```