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