# Load Statistics

This guide will walk you through steps of loading basic delivery statistics from your account using the Perl library. 

*Required Access Level: ViewReports*

## What statistics are returned?
When using Elastic Email you send emails to your contacts from that we create some statistics reports for you eg. number of emails sent, number of delivered messages, number of bounced messages, number of unsubscribed messages etc.

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

First you need to specify a date range:
- from date
- to date – optional

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/statisticsGet

```perl
my $from = DateTime->from_epoch(epoch => str2time('2021-02-01T11:00:00')); # DateTime | Starting date for search in YYYY-MM-DDThh:mm:ss format.
my $to = DateTime->from_epoch(epoch => str2time('2022-03-01T11:00:00')); # DateTime | Ending date for search in YYYY-MM-DDThh:mm:ss format.
```

And finally, call `statistics_get` method from the API to fetch statistics: 

```perl
my $result = $api_instance->statistics_get(from => $from, to => $to);
```


## The whole code to copy and paste:
```perl
use Data::Dumper;
use ElasticEmail::StatisticsApi;
use Date::Parse;
use DateTime;
my $api_instance = ElasticEmail::StatisticsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => 'YOUR_API_KEY'},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $from = DateTime->from_epoch(epoch => str2time('2021-02-01T11:00:00')); # DateTime | Starting date for search in YYYY-MM-DDThh:mm:ss format.
my $to = DateTime->from_epoch(epoch => str2time('2022-03-01T11:00:00')); # DateTime | Ending date for search in YYYY-MM-DDThh:mm:ss format.

eval {
    my $result = $api_instance->statistics_get(from => $from, to => $to);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling StatisticsApi->statistics_get: $@\n";
}
```

## Run the code
```
perl functions/loadStatistics.pl
```