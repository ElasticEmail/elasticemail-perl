=begin comment

Elastic Email REST API

This API is based on the REST API architecture, allowing the user to easily manage their data with this resource-based approach.    Every API call is established on which specific request type (GET, POST, PUT, DELETE) will be used.    The API has a limit of 20 concurrent connections and a hard timeout of 600 seconds per request.    To start using this API, you will need your Access Token (available <a target=\"_blank\" href=\"https://app.elasticemail.com/marketing/settings/new/manage-api\">here</a>). Remember to keep it safe. Required access levels are listed in the given request’s description.    Downloadable library clients can be found in our Github repository <a target=\"_blank\" href=\"https://github.com/ElasticEmail?tab=repositories&q=%22rest+api%22+in%3Areadme\">here</a>

The version of the OpenAPI document: 4.0.0
Contact: support@elasticemail.com
Generated by: https://openapi-generator.tech

=end comment

=cut

#
# NOTE: This class is auto generated by OpenAPI Generator
# Please update the test cases below to test the API endpoints.
# Ref: https://openapi-generator.tech
#
use Test::More;
use Test::Exception;

use lib 'lib';
use strict;
use warnings;

use_ok('ElasticEmail::InboundRouteApi');

my $api = ElasticEmail::InboundRouteApi->new();
isa_ok($api, 'ElasticEmail::InboundRouteApi');

#
# inboundroute_by_id_delete test
#
# uncomment below and update the test
#my $inboundroute_by_id_delete_id = undef; # replace NULL with a proper value
#my $inboundroute_by_id_delete_result = $api->inboundroute_by_id_delete(id => $inboundroute_by_id_delete_id);

#
# inboundroute_by_id_get test
#
# uncomment below and update the test
#my $inboundroute_by_id_get_id = undef; # replace NULL with a proper value
#my $inboundroute_by_id_get_result = $api->inboundroute_by_id_get(id => $inboundroute_by_id_get_id);

#
# inboundroute_by_id_put test
#
# uncomment below and update the test
#my $inboundroute_by_id_put_id = undef; # replace NULL with a proper value
#my $inboundroute_by_id_put_inbound_payload = undef; # replace NULL with a proper value
#my $inboundroute_by_id_put_result = $api->inboundroute_by_id_put(id => $inboundroute_by_id_put_id, inbound_payload => $inboundroute_by_id_put_inbound_payload);

#
# inboundroute_get test
#
# uncomment below and update the test
#my $inboundroute_get_result = $api->inboundroute_get();

#
# inboundroute_order_put test
#
# uncomment below and update the test
#my $inboundroute_order_put_sort_order_item = undef; # replace NULL with a proper value
#my $inboundroute_order_put_result = $api->inboundroute_order_put(sort_order_item => $inboundroute_order_put_sort_order_item);

#
# inboundroute_post test
#
# uncomment below and update the test
#my $inboundroute_post_inbound_payload = undef; # replace NULL with a proper value
#my $inboundroute_post_result = $api->inboundroute_post(inbound_payload => $inboundroute_post_inbound_payload);


done_testing();
