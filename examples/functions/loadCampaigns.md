# Load Campaign List

This guide will walk you through the process of loading campaign list in your account using the Perl library. 

*Required Access Level: ViewCampaigns*

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

Load library using below line:

```perl
use ElasticEmail::CampaignsApi;
```

Read your API key from the `ELASTICEMAIL_API_KEY` environment variable (remember to check a required access level) and get a client instance. The script stops with an error if the variable is not set: 

```perl
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::CampaignsApi->new(
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
);
```


The only thing you need to specify is a campaign name

> Find out more by checking our API's documentation: https://elasticemail.com/developers/api-documentation/rest-api#operation/campaignsGet

You can add search, offset and limit parameters.

```perl
my $search = ""; # string | Text fragment used for searching in Campaign name (using the 'contains' rule)
my $offset = 20; # int | How many items should be returned ahead.
my $limit = 100; # int | Maximum number of returned items.
```

And finally, call `campaigns_get` method from the API to get a campaign: 

```perl
my $result = $api_instance->campaigns_get(search => $search, offset => $offset, limit => $limit);
```

## The whole code to copy and paste:
```perl
use Data::Dumper;
use ElasticEmail::CampaignsApi;
my $api_key = $ENV{ELASTICEMAIL_API_KEY} or die "Set the ELASTICEMAIL_API_KEY environment variable\n";
my $api_instance = ElasticEmail::CampaignsApi->new(

    # Configure API key authorization: apikey
    api_key => {'X-ElasticEmail-ApiKey' => $api_key},
    # uncomment below to setup prefix (e.g. Bearer) for API key, if needed
    #api_key_prefix => {'X-ElasticEmail-ApiKey' => 'Bearer'},
);

my $search = ""; # string | Text fragment used for searching in Campaign name (using the 'contains' rule)
my $offset = 20; # int | How many items should be returned ahead.
my $limit = 100; # int | Maximum number of returned items.

eval {
    my $result = $api_instance->campaigns_get(search => $search, offset => $offset, limit => $limit);
    print Dumper($result);
};
if ($@) {
    warn "Exception when calling CampaignsApi->campaigns_get: $@\n";
}
```

## Run the code
```
export ELASTICEMAIL_API_KEY=your-api-key
perl functions/loadCampaigns.pl
```