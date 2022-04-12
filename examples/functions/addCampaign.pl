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

my $name = 'testnameperl41';

my $recipient = ElasticEmail::Object::CampaignRecipient->new();
$recipient->segment_names(['do mnie']);

my $options = ElasticEmail::Object::CampaignOptions->new();

my $template = ElasticEmail::Object::CampaignTemplate->new();

$template->template_name('news!%$#$%:2022-03-21 13:02:14:2022-03-22 22:32:13 2022-03-22 10:32:22 PM');
$template->reply_to('dagmara.tega@elasticemail.com');
$template->from('dagmara.tega@elasticemail.com');
$template->subject('news!%$#$%:2022-03-21 13:02:14:2022-03-22 22:32:13');

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