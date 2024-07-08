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

use_ok('ElasticEmail::SuppressionsApi');

my $api = ElasticEmail::SuppressionsApi->new();
isa_ok($api, 'ElasticEmail::SuppressionsApi');

#
# suppressions_bounces_get test
#
# uncomment below and update the test
#my $suppressions_bounces_get_search = undef; # replace NULL with a proper value
#my $suppressions_bounces_get_limit = undef; # replace NULL with a proper value
#my $suppressions_bounces_get_offset = undef; # replace NULL with a proper value
#my $suppressions_bounces_get_result = $api->suppressions_bounces_get(search => $suppressions_bounces_get_search, limit => $suppressions_bounces_get_limit, offset => $suppressions_bounces_get_offset);

#
# suppressions_bounces_import_post test
#
# uncomment below and update the test
#my $suppressions_bounces_import_post_file = undef; # replace NULL with a proper value
#my $suppressions_bounces_import_post_result = $api->suppressions_bounces_import_post(file => $suppressions_bounces_import_post_file);

#
# suppressions_bounces_post test
#
# uncomment below and update the test
#my $suppressions_bounces_post_request_body = undef; # replace NULL with a proper value
#my $suppressions_bounces_post_result = $api->suppressions_bounces_post(request_body => $suppressions_bounces_post_request_body);

#
# suppressions_by_email_delete test
#
# uncomment below and update the test
#my $suppressions_by_email_delete_email = undef; # replace NULL with a proper value
#my $suppressions_by_email_delete_result = $api->suppressions_by_email_delete(email => $suppressions_by_email_delete_email);

#
# suppressions_by_email_get test
#
# uncomment below and update the test
#my $suppressions_by_email_get_email = undef; # replace NULL with a proper value
#my $suppressions_by_email_get_result = $api->suppressions_by_email_get(email => $suppressions_by_email_get_email);

#
# suppressions_complaints_get test
#
# uncomment below and update the test
#my $suppressions_complaints_get_search = undef; # replace NULL with a proper value
#my $suppressions_complaints_get_limit = undef; # replace NULL with a proper value
#my $suppressions_complaints_get_offset = undef; # replace NULL with a proper value
#my $suppressions_complaints_get_result = $api->suppressions_complaints_get(search => $suppressions_complaints_get_search, limit => $suppressions_complaints_get_limit, offset => $suppressions_complaints_get_offset);

#
# suppressions_complaints_import_post test
#
# uncomment below and update the test
#my $suppressions_complaints_import_post_file = undef; # replace NULL with a proper value
#my $suppressions_complaints_import_post_result = $api->suppressions_complaints_import_post(file => $suppressions_complaints_import_post_file);

#
# suppressions_complaints_post test
#
# uncomment below and update the test
#my $suppressions_complaints_post_request_body = undef; # replace NULL with a proper value
#my $suppressions_complaints_post_result = $api->suppressions_complaints_post(request_body => $suppressions_complaints_post_request_body);

#
# suppressions_get test
#
# uncomment below and update the test
#my $suppressions_get_limit = undef; # replace NULL with a proper value
#my $suppressions_get_offset = undef; # replace NULL with a proper value
#my $suppressions_get_result = $api->suppressions_get(limit => $suppressions_get_limit, offset => $suppressions_get_offset);

#
# suppressions_unsubscribes_get test
#
# uncomment below and update the test
#my $suppressions_unsubscribes_get_search = undef; # replace NULL with a proper value
#my $suppressions_unsubscribes_get_limit = undef; # replace NULL with a proper value
#my $suppressions_unsubscribes_get_offset = undef; # replace NULL with a proper value
#my $suppressions_unsubscribes_get_result = $api->suppressions_unsubscribes_get(search => $suppressions_unsubscribes_get_search, limit => $suppressions_unsubscribes_get_limit, offset => $suppressions_unsubscribes_get_offset);

#
# suppressions_unsubscribes_import_post test
#
# uncomment below and update the test
#my $suppressions_unsubscribes_import_post_file = undef; # replace NULL with a proper value
#my $suppressions_unsubscribes_import_post_result = $api->suppressions_unsubscribes_import_post(file => $suppressions_unsubscribes_import_post_file);

#
# suppressions_unsubscribes_post test
#
# uncomment below and update the test
#my $suppressions_unsubscribes_post_request_body = undef; # replace NULL with a proper value
#my $suppressions_unsubscribes_post_result = $api->suppressions_unsubscribes_post(request_body => $suppressions_unsubscribes_post_request_body);


done_testing();
