# Add Campaign

This guide will walk you through the process of creating your first campaign using the Perl library. 

*Required Access Level: ModifyCampaigns*

## What's a campaign?
When using Elastic Email, when you send an email to any group of contacts we call that a "campaign".

To send a campaign you need a template (which becomes the email body itself) and you need contacts (the recipients who receive the email).

## Preparation

Download our ElasticEmail-WebApiClient (https://github.com/ElasticEmail/ElasticEmail.WebApiClient.perl) and our library https://github.com/ElasticEmail/elasticemail-perl/tree/master/lib/ElasticEmail.

To install this module, run the following commands:

	perl Makefile.PL
	make
	make test
	make install
    
Create a new Perl file `snippet.pl` and open it in editor of your preference eg. Visual Studio Code (https://code.visualstudio.com/)


### Let's dig into the code

Put the below code to your file.

Load libraries using below line:

```perl
use ElasticEmail::Object::Campaign;
use ElasticEmail::Object::CampaignStatus;
use ElasticEmail::Object::CampaignTemplate;
use ElasticEmail::Object::CampaignRecipient;
use ElasticEmail::Object::CampaignOptions;
use ElasticEmail::CampaignsApi;
```

Get client instance, generate and use your API key (remember to check a required access level): 

```perl
my $api_instance = ElasticEmail::CampaignsApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
);
```

Create an example campaign object:
- Name: defines campaign name by which you can identify it later
- Recipients: define your audience
- Conent: define your message details
- Status: define status in which campaign should be created

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/campaignsPost

```perl
my $name = 'new campaign name';

my $recipient = ElasticEmail::Object::CampaignRecipient->new();
$recipient->segment_names(['segment name']);

my $options = ElasticEmail::Object::CampaignOptions->new();

my $template = ElasticEmail::Object::CampaignTemplate->new();
$template->template_name('template name');
$template->reply_to('test@domain.com');
$template->from('test@domain.com');
$template->subject('subject');

my $campaign = ElasticEmail::Object::Campaign->new(); # Campaign | JSON representation of a campaign

$campaign->name($name);
$campaign->options($options);
$campaign->recipients($recipient);
$campaign->content([$template]);

```

Create an instance of CampaignsApi that will be used to create a campaign.

```perl
my $result = $api_instance->campaigns_post(campaign => $campaign);
```

## The whole code to copy and paste:
```perl
use Data::Dumper;
use ElasticEmail::Object::Campaign;
use ElasticEmail::Object::CampaignStatus;
use ElasticEmail::Object::CampaignTemplate;
use ElasticEmail::Object::CampaignRecipient;
use ElasticEmail::Object::CampaignOptions;
use ElasticEmail::CampaignsApi;

my $api_instance = ElasticEmail::CampaignsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = 'new campaign name';

my $recipient = ElasticEmail::Object::CampaignRecipient->new();
$recipient->segment_names(['segment name']);

my $options = ElasticEmail::Object::CampaignOptions->new();

my $template = ElasticEmail::Object::CampaignTemplate->new();

$template->template_name('template name');
$template->reply_to('test@domain.com');
$template->from('test@domain.com');
$template->subject('subject');

my $campaign = ElasticEmail::Object::Campaign->new(); # Campaign | JSON representation of a campaign

$campaign->name($name);
$campaign->options($options);
$campaign->recipients($recipient);
$campaign->content([$template]);

eval {
    my $result = $api_instance->campaigns_post(campaign => $campaign);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling CampaignsApi->campaigns_post: $@\n";
}
```

## Run the code
```
perl functions/addCampaign.pl
```