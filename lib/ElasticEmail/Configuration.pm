=begin comment

Elastic Email REST API

This API is based on the REST API architecture, allowing the user to easily manage their data with this resource-based approach.    Every API call is established on which specific request type (GET, POST, PUT, DELETE) will be used.    The API has a limit of 20 concurrent connections and a hard timeout of 600 seconds per request.    To start using this API, you will need your Access Token (available <a target=\"_blank\" href=\"https://elasticemail.com/account#/settings/new/manage-api\">here</a>). Remember to keep it safe. Required access levels are listed in the given request’s description.    Downloadable library clients can be found in our Github repository <a target=\"_blank\" href=\"https://github.com/ElasticEmail?tab=repositories&q=%22rest+api%22+in%3Areadme\">here</a>

The version of the OpenAPI document: 4.0.0
Contact: support@elasticemail.com
Generated by: https://openapi-generator.tech

=end comment

=cut

#
# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
# Do not edit the class manually.
# Ref: https://openapi-generator.tech
#
package ElasticEmail::Configuration;

use strict;
use warnings;
use utf8;

use Log::Any qw($log);
use Carp;

use constant VERSION => '4.0.17';

=head1 Name

        ElasticEmail::Configuration - holds the configuration for all ElasticEmail Modules

=head1 new(%parameters)

=over 4

=item http_timeout: (optional)

Integer. timeout for HTTP requests in seconds

default: 180

=item http_user_agent: (optional)

String. custom UserAgent header

default: OpenAPI-Generator/4.0.17/perl

=item api_key: (optional)

Hashref. Keyed on the name of each key (there can be multiple tokens).

    api_key => {
        secretKey => 'aaaabbbbccccdddd',
        anotherKey => '1111222233334444',
    };

=item api_key_prefix: (optional)

Hashref. Keyed on the name of each key (there can be multiple tokens). Note not all api keys require a prefix.

    api_key_prefix => {
        secretKey => 'string',
        anotherKey => 'same or some other string',
    };

=item api_key_in: (optional)

=item username: (optional)

String. The username for basic auth.

=item password: (optional)

String. The password for basic auth.

=item access_token: (optional)

String. The OAuth access token.

=item base_url: (optional)

String. The base URL of the API

default: https://api.elasticemail.com/v4

=back

=cut

sub new {
    my ($self, %p) = (shift,@_);

    # class/static variables
    $p{http_timeout} //= 180;
    $p{http_user_agent} //= 'OpenAPI-Generator/4.0.17/perl';

    # authentication setting
    $p{api_key} //= {};
    $p{api_key_prefix} //= {};
    $p{api_key_in} //= {};

    # username and password for HTTP basic authentication
    $p{username} //= '';
    $p{password} //= '';

    # access token for OAuth
    $p{access_token} //= '';

    # base_url
    $p{base_url} //= 'https://api.elasticemail.com/v4';

    return bless \%p => $self;
}


sub get_tokens {
    my $self = shift;

    my $tokens = {};
    $tokens->{username} = $self->{username} if $self->{username};
    $tokens->{password} = $self->{password} if $self->{password};
    $tokens->{access_token} = $self->{access_token} if $self->{access_token};

    foreach my $token_name (keys %{ $self->{api_key} }) {
        $tokens->{$token_name}->{token} = $self->{api_key}{$token_name};
        $tokens->{$token_name}->{prefix} = $self->{api_key_prefix}{$token_name};
        $tokens->{$token_name}->{in} = $self->{api_key_in}{$token_name};
    }

    return $tokens;
}

sub clear_tokens {
    my $self = shift;
    my %tokens = %{$self->get_tokens}; # copy

    $self->{username} = '';
    $self->{password} = '';
    $self->{access_token} = '';

    $self->{api_key} = {};
    $self->{api_key_prefix} = {};
    $self->{api_key_in} = {};

    return \%tokens;
}

sub accept_tokens {
    my ($self, $tokens) = @_;

    foreach my $known_name (qw(username password access_token)) {
        next unless $tokens->{$known_name};
        $self->{$known_name} = delete $tokens->{$known_name};
    }

    foreach my $token_name (keys %$tokens) {
        $self->{api_key}{$token_name} = $tokens->{$token_name}{token};
        if ($tokens->{$token_name}{prefix}) {
            $self->{api_key_prefix}{$token_name} = $tokens->{$token_name}{prefix};
        }
        my $in = $tokens->{$token_name}->{in} || 'head';
        croak "Tokens can only go in 'head' or 'query' (not in '$in')" unless $in =~ /^(?:head|query)$/;
        $self->{api_key_in}{$token_name} = $in;
    }
}

1;
