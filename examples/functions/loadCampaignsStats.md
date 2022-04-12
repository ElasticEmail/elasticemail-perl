
# Load Campaigns Statistics

This guide will walk you through steps of loading statistics for each campaign from your account using the Perl library. 

*Required Access Level: ViewChannels*

## What statistics are returned?
When using Elastic Email you send email campaigns to your contacts. From that we create statistics reports for you eg. number of emails sent, number of delivered messages,Number of opened messages, number of unsubscribed messages, number of clicked messages etc.

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

Load library using below line:

```perl
use ElasticEmail::StatisticsApi;
```

Get client instance, generate and use your API key (remember to check a required access level): 

```perl
my $api_instance = ElasticEmail::StatisticsApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
);
```


Campaigns statistics reponse is paginated you need to specfiy pagination options:
- limit – maximum returned items, `limit = 0` means to return everything till the end of the list
- offset – how many items should be skipped from begging

Eg. to return first 20 elements specify pagination options as follows
```
{
    limit: 20,
    offset: 0,
};
```

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/statisticsCampaignsByNameGet

Let's fetch everthing:

```perl
my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.
```


And finally, call `statistics_campaigns_get` method from the API to fetch statistics: 

```perl
my $result = $api_instance->statistics_campaigns_get(limit => $limit, offset => $offset);
```


## The whole code to copy and paste:
```perl
use Data::Dumper;
use ElasticEmail::StatisticsApi;
my $api_instance = ElasticEmail::StatisticsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $limit = 100; # int | Maximum number of returned items.
my $offset = 20; # int | How many items should be returned ahead.

eval {
    my $result = $api_instance->statistics_campaigns_get(limit => $limit, offset => $offset);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling StatisticsApi->statistics_campaigns_get: $@\n";
}
```

## Run the code
```
perl functions/loadCampaignsStats.pl
```