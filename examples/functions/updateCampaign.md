# Update Campaign

This guide will walk you through steps to update an existing campaign on your account.

*Required Access Level: ModifyCampaigns*

## What's a campaign?
When using Elastic Email, when you send an email to any group of contacts we call that a "campaign".

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
use ElasticEmail::CampaignsApi;
use ElasticEmail::Object::Campaign;
use ElasticEmail::Object::CampaignRecipient;
use ElasticEmail::Object::CampaignTemplate;
use ElasticEmail::Object::CampaignOptions;
```

Get client instance, generate and use your API key (remember to check a required access level): 

```perl
my $api_instance = ElasticEmail::CampaignsApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
);
```

Create a whole campaign object that you want to put in place of a current version:
- Name: defines campaign name by which you can identify it later
- Recipients: define your audience
- Conent: define your message details
- Status: define status in which campaign should be created

Send will be triggered immediately or postponed, depending on given options. 
If we define `Status` as `Draft`, it will be postponed and campaign will be added to drafts.

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/campaignsByNamePut

```perl
my $name = "campaign name"; # string | Name of Campaign to update
my $campaign = ElasticEmail::Object::Campaign->new(); # Campaign | JSON representation of a campaign
$campaign->name('new campaign name');

my $recipient = ElasticEmail::Object::CampaignRecipient->new();
@array = ("recipient list name 1", "recipient list name 2");
$recipient->list_names(@array);

$campaign->recipients($recipient);

my $options = ElasticEmail::Object::CampaignOptions->new();

my $template = ElasticEmail::Object::CampaignTemplate->new();

$template->template_name('template name');
$template->reply_to('test@domain.com');
$template->from('test@domain.com');
$template->subject('subject');

$campaign->options($options);
$campaign->content([$template]);
```

And finally, call `campaigns_by_name_put` method from the API to update a campaign: 

```perl
my $result = $api_instance->campaigns_by_name_put(name => $name, campaign => $campaign);
```


## The whole code to copy and paste:
````perl
use Data::Dumper;
use ElasticEmail::CampaignsApi;
use ElasticEmail::Object::Campaign;
use ElasticEmail::Object::CampaignRecipient;
use ElasticEmail::Object::CampaignTemplate;
use ElasticEmail::Object::CampaignOptions;
my $api_instance = ElasticEmail::CampaignsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "campaign name"; # string | Name of Campaign to update
my $campaign = ElasticEmail::Object::Campaign->new(); # Campaign | JSON representation of a campaign
$campaign->name('new campaign name');

my $recipient = ElasticEmail::Object::CampaignRecipient->new();
@array = ("recipient list name 1", "recipient list name 2");
$recipient->list_names(@array);

$campaign->recipients($recipient);

my $options = ElasticEmail::Object::CampaignOptions->new();

my $template = ElasticEmail::Object::CampaignTemplate->new();

$template->template_name('template name');
$template->reply_to('test@domain.com');
$template->from('test@domain.com');
$template->subject('subject');

$campaign->options($options);
$campaign->content([$template]);

eval {
    my $result = $api_instance->campaigns_by_name_put(name => $name, campaign => $campaign);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling CampaignsApi->campaigns_by_name_put: $@\n";
}
```

## Run the code
```
perl functions/updateCampaign.pl
```