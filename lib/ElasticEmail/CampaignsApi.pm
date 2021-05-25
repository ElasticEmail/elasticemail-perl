=begin comment

Elastic Email REST API

This API is based on the REST API architecture, allowing the user to easily manage their data with this resource-based approach.    Every API call is established on which specific request type (GET, POST, PUT, DELETE) will be used.    To start using this API, you will need your Access Token (available <a target=\"_blank\" href=\"https://elasticemail.com/account#/settings/new/manage-api\">here</a>). Remember to keep it safe. Required access levels are listed in the given request’s description.    This is the documentation for REST API. If you’d like to read our legacy documentation regarding Web API v2 click <a target=\"_blank\" href=\"https://api.elasticemail.com/public/help\">here</a>.    Downloadable library clients can be found in our Github repository <a target=\"_blank\" href=\"https://github.com/ElasticEmail?tab=repositories&q=%22rest+api%22+in%3Areadme\">here</a>

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
package ElasticEmail::CampaignsApi;

require 5.6.0;
use strict;
use warnings;
use utf8; 
use Exporter;
use Carp qw( croak );
use Log::Any qw($log);

use ElasticEmail::ApiClient;

use base "Class::Data::Inheritable";

__PACKAGE__->mk_classdata('method_documentation' => {});

sub new {
    my $class = shift;
    my $api_client;

    if ($_[0] && ref $_[0] && ref $_[0] eq 'ElasticEmail::ApiClient' ) {
        $api_client = $_[0];
    } else {
        $api_client = ElasticEmail::ApiClient->new(@_);
    }

    bless { api_client => $api_client }, $class;

}


#
# campaigns_by_name_delete
#
# Delete Campaign
# 
# @param string $name Name of Campaign to delete (required)
{
    my $params = {
    'name' => {
        data_type => 'string',
        description => 'Name of Campaign to delete',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'campaigns_by_name_delete' } = { 
        summary => 'Delete Campaign',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub campaigns_by_name_delete {
    my ($self, %args) = @_;

    # verify the required parameter 'name' is set
    unless (exists $args{'name'}) {
      croak("Missing the required parameter 'name' when calling campaigns_by_name_delete");
    }

    # parse inputs
    my $_resource_path = '/campaigns/{name}';

    my $_method = 'DELETE';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept();
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # path params
    if ( exists $args{'name'}) {
        my $_base_variable = "{" . "name" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'name'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(apikey )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# campaigns_by_name_get
#
# Load Campaign
# 
# @param string $name Name of Campaign to get (required)
{
    my $params = {
    'name' => {
        data_type => 'string',
        description => 'Name of Campaign to get',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'campaigns_by_name_get' } = { 
        summary => 'Load Campaign',
        params => $params,
        returns => 'Campaign',
        };
}
# @return Campaign
#
sub campaigns_by_name_get {
    my ($self, %args) = @_;

    # verify the required parameter 'name' is set
    unless (exists $args{'name'}) {
      croak("Missing the required parameter 'name' when calling campaigns_by_name_get");
    }

    # parse inputs
    my $_resource_path = '/campaigns/{name}';

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # path params
    if ( exists $args{'name'}) {
        my $_base_variable = "{" . "name" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'name'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(apikey )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Campaign', $response);
    return $_response_object;
}

#
# campaigns_by_name_put
#
# Update Campaign
# 
# @param string $name Name of Campaign to update (required)
# @param Campaign $campaign JSON representation of a campaign (required)
{
    my $params = {
    'name' => {
        data_type => 'string',
        description => 'Name of Campaign to update',
        required => '1',
    },
    'campaign' => {
        data_type => 'Campaign',
        description => 'JSON representation of a campaign',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'campaigns_by_name_put' } = { 
        summary => 'Update Campaign',
        params => $params,
        returns => 'Campaign',
        };
}
# @return Campaign
#
sub campaigns_by_name_put {
    my ($self, %args) = @_;

    # verify the required parameter 'name' is set
    unless (exists $args{'name'}) {
      croak("Missing the required parameter 'name' when calling campaigns_by_name_put");
    }

    # verify the required parameter 'campaign' is set
    unless (exists $args{'campaign'}) {
      croak("Missing the required parameter 'campaign' when calling campaigns_by_name_put");
    }

    # parse inputs
    my $_resource_path = '/campaigns/{name}';

    my $_method = 'PUT';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    # path params
    if ( exists $args{'name'}) {
        my $_base_variable = "{" . "name" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'name'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # body params
    if ( exists $args{'campaign'}) {
        $_body_data = $args{'campaign'};
    }

    # authentication setting, if any
    my $auth_settings = [qw(apikey )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Campaign', $response);
    return $_response_object;
}

#
# campaigns_get
#
# Load Campaigns
# 
# @param string $search Text fragment used for searching in Campaign name (using the &#39;contains&#39; rule) (optional)
# @param int $offset How many items should be returned ahead. (optional)
# @param int $limit Maximum number of returned items. (optional)
{
    my $params = {
    'search' => {
        data_type => 'string',
        description => 'Text fragment used for searching in Campaign name (using the &#39;contains&#39; rule)',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'How many items should be returned ahead.',
        required => '0',
    },
    'limit' => {
        data_type => 'int',
        description => 'Maximum number of returned items.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'campaigns_get' } = { 
        summary => 'Load Campaigns',
        params => $params,
        returns => 'ARRAY[Campaign]',
        };
}
# @return ARRAY[Campaign]
#
sub campaigns_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/campaigns';

    my $_method = 'GET';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type();

    # query params
    if ( exists $args{'search'}) {
        $query_params->{'search'} = $self->{api_client}->to_query_value($args{'search'});
    }

    # query params
    if ( exists $args{'offset'}) {
        $query_params->{'offset'} = $self->{api_client}->to_query_value($args{'offset'});
    }

    # query params
    if ( exists $args{'limit'}) {
        $query_params->{'limit'} = $self->{api_client}->to_query_value($args{'limit'});
    }

    my $_body_data;
    # authentication setting, if any
    my $auth_settings = [qw(apikey )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Campaign]', $response);
    return $_response_object;
}

#
# campaigns_post
#
# Add Campaign
# 
# @param Campaign $campaign JSON representation of a campaign (required)
{
    my $params = {
    'campaign' => {
        data_type => 'Campaign',
        description => 'JSON representation of a campaign',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'campaigns_post' } = { 
        summary => 'Add Campaign',
        params => $params,
        returns => 'Campaign',
        };
}
# @return Campaign
#
sub campaigns_post {
    my ($self, %args) = @_;

    # verify the required parameter 'campaign' is set
    unless (exists $args{'campaign'}) {
      croak("Missing the required parameter 'campaign' when calling campaigns_post");
    }

    # parse inputs
    my $_resource_path = '/campaigns';

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept('application/json');
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    my $_body_data;
    # body params
    if ( exists $args{'campaign'}) {
        $_body_data = $args{'campaign'};
    }

    # authentication setting, if any
    my $auth_settings = [qw(apikey )];

    # make the API Call
    my $response = $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    if (!$response) {
        return;
    }
    my $_response_object = $self->{api_client}->deserialize('Campaign', $response);
    return $_response_object;
}

1;
