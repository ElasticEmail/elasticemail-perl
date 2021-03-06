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

use_ok('ElasticEmail::VerificationsApi');

my $api = ElasticEmail::VerificationsApi->new();
isa_ok($api, 'ElasticEmail::VerificationsApi');

#
# verifications_by_email_delete test
#
{
    my $email = undef; # replace NULL with a proper value
    my $result = $api->verifications_by_email_delete(email => $email);
}

#
# verifications_by_email_get test
#
{
    my $email = undef; # replace NULL with a proper value
    my $result = $api->verifications_by_email_get(email => $email);
}

#
# verifications_by_email_post test
#
{
    my $email = undef; # replace NULL with a proper value
    my $result = $api->verifications_by_email_post(email => $email);
}

#
# verifications_files_by_id_delete test
#
{
    my $id = undef; # replace NULL with a proper value
    my $result = $api->verifications_files_by_id_delete(id => $id);
}

#
# verifications_files_by_id_result_download_get test
#
{
    my $id = undef; # replace NULL with a proper value
    my $result = $api->verifications_files_by_id_result_download_get(id => $id);
}

#
# verifications_files_by_id_result_get test
#
{
    my $id = undef; # replace NULL with a proper value
    my $limit = undef; # replace NULL with a proper value
    my $offset = undef; # replace NULL with a proper value
    my $result = $api->verifications_files_by_id_result_get(id => $id, limit => $limit, offset => $offset);
}

#
# verifications_files_post test
#
{
    my $file = undef; # replace NULL with a proper value
    my $result = $api->verifications_files_post(file => $file);
}

#
# verifications_files_result_get test
#
{
    my $result = $api->verifications_files_result_get();
}

#
# verifications_get test
#
{
    my $limit = undef; # replace NULL with a proper value
    my $offset = undef; # replace NULL with a proper value
    my $result = $api->verifications_get(limit => $limit, offset => $offset);
}


1;
