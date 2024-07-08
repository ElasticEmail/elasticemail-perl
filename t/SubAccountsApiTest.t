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

use_ok('ElasticEmail::SubAccountsApi');

my $api = ElasticEmail::SubAccountsApi->new();
isa_ok($api, 'ElasticEmail::SubAccountsApi');

#
# subaccounts_by_email_credits_patch test
#
# uncomment below and update the test
#my $subaccounts_by_email_credits_patch_email = undef; # replace NULL with a proper value
#my $subaccounts_by_email_credits_patch_subaccount_email_credits_payload = undef; # replace NULL with a proper value
#my $subaccounts_by_email_credits_patch_result = $api->subaccounts_by_email_credits_patch(email => $subaccounts_by_email_credits_patch_email, subaccount_email_credits_payload => $subaccounts_by_email_credits_patch_subaccount_email_credits_payload);

#
# subaccounts_by_email_delete test
#
# uncomment below and update the test
#my $subaccounts_by_email_delete_email = undef; # replace NULL with a proper value
#my $subaccounts_by_email_delete_result = $api->subaccounts_by_email_delete(email => $subaccounts_by_email_delete_email);

#
# subaccounts_by_email_get test
#
# uncomment below and update the test
#my $subaccounts_by_email_get_email = undef; # replace NULL with a proper value
#my $subaccounts_by_email_get_result = $api->subaccounts_by_email_get(email => $subaccounts_by_email_get_email);

#
# subaccounts_by_email_settings_email_put test
#
# uncomment below and update the test
#my $subaccounts_by_email_settings_email_put_email = undef; # replace NULL with a proper value
#my $subaccounts_by_email_settings_email_put_subaccount_email_settings = undef; # replace NULL with a proper value
#my $subaccounts_by_email_settings_email_put_result = $api->subaccounts_by_email_settings_email_put(email => $subaccounts_by_email_settings_email_put_email, subaccount_email_settings => $subaccounts_by_email_settings_email_put_subaccount_email_settings);

#
# subaccounts_get test
#
# uncomment below and update the test
#my $subaccounts_get_limit = undef; # replace NULL with a proper value
#my $subaccounts_get_offset = undef; # replace NULL with a proper value
#my $subaccounts_get_result = $api->subaccounts_get(limit => $subaccounts_get_limit, offset => $subaccounts_get_offset);

#
# subaccounts_post test
#
# uncomment below and update the test
#my $subaccounts_post_subaccount_payload = undef; # replace NULL with a proper value
#my $subaccounts_post_result = $api->subaccounts_post(subaccount_payload => $subaccounts_post_subaccount_payload);


done_testing();
