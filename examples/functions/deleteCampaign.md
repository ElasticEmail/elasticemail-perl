# Delete Campaign

This guide will walk you through steps to delete an existing campaign from your account.

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


### Let's dig into the code

Put the below code to your file.

Load library using below line:

```perl
use ElasticEmail::CampaignsApi;
```

Get client instance, generate and use your API key (remember to check a required access level): 

```perl
my $api_instance = ElasticEmail::CampaignsApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
);
```

The only thing you need to specify is a campaign name

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/campaignsByNameDelete

```perl
my $name = "campaign name"; # string | Name of Campaign to delete

```
And finally, call `campaigns_by_name_delete` method from the API to delete campaign: 

```perl
$api_instance->campaigns_by_name_delete(name => $name);
```

## The whole code to copy and paste:
```perl
use Data::Dumper;
use ElasticEmail::CampaignsApi;
my $api_instance = ElasticEmail::CampaignsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $name = "campaign name"; # string | Name of Campaign to delete

eval {
    $api_instance->campaigns_by_name_delete(name => $name);
};
if ($@) {
    warn "Exception when calling CampaignsApi->campaigns_by_name_delete: $@\n";
}
```

## Run the code
```
perl functions/deleteCampaign.pl
```