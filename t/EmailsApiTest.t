=begin comment

Elastic Email REST API

This API is based on the REST API architecture, allowing the user to easily manage their data with this resource-based approach.    Every API call is established on which specific request type (GET, POST, PUT, DELETE) will be used.    To start using this API, you will need your Access Token (available <a href=\"https://elasticemail.com/account#/settings/new/manage-api\">here</a>). Remember to keep it safe. Required access levels are listed in the given request’s description.    This is the documentation for REST API. If you’d like to read our legacy documentation regarding Web API v2 click <a href=\"https://api.elasticemail.com/public/help\">here</a>.

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
use Test::More tests => 1; #TODO update number of test cases
use Test::Exception;

use lib 'lib';
use strict;
use warnings;

use_ok('ElasticEmail::EmailsApi');

my $api = ElasticEmail::EmailsApi->new();
isa_ok($api, 'ElasticEmail::EmailsApi');

#
# emails_by_msgid_view_get test
#
{
    my $msgid = undef; # replace NULL with a proper value
    my $result = $api->emails_by_msgid_view_get(msgid => $msgid);
}

#
# emails_mergefile_post test
#
{
    my $merge_email_payload = undef; # replace NULL with a proper value
    my $result = $api->emails_mergefile_post(merge_email_payload => $merge_email_payload);
}

#
# emails_post test
#
{
    my $email_message_data = undef; # replace NULL with a proper value
    my $result = $api->emails_post(email_message_data => $email_message_data);
}

#
# emails_transactional_post test
#
{
    my $email_transactional_message_data = undef; # replace NULL with a proper value
    my $result = $api->emails_transactional_post(email_transactional_message_data => $email_transactional_message_data);
}


1;