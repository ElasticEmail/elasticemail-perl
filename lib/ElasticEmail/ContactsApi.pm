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
package ElasticEmail::ContactsApi;

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
# contacts_by_email_delete
#
# Delete Contact
# 
# @param string $email Proper email address. (required)
{
    my $params = {
    'email' => {
        data_type => 'string',
        description => 'Proper email address.',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'contacts_by_email_delete' } = { 
        summary => 'Delete Contact',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub contacts_by_email_delete {
    my ($self, %args) = @_;

    # verify the required parameter 'email' is set
    unless (exists $args{'email'}) {
      croak("Missing the required parameter 'email' when calling contacts_by_email_delete");
    }

    # parse inputs
    my $_resource_path = '/contacts/{email}';

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
    if ( exists $args{'email'}) {
        my $_base_variable = "{" . "email" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'email'});
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
# contacts_by_email_get
#
# Load Contact
# 
# @param string $email Proper email address. (required)
{
    my $params = {
    'email' => {
        data_type => 'string',
        description => 'Proper email address.',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'contacts_by_email_get' } = { 
        summary => 'Load Contact',
        params => $params,
        returns => 'Contact',
        };
}
# @return Contact
#
sub contacts_by_email_get {
    my ($self, %args) = @_;

    # verify the required parameter 'email' is set
    unless (exists $args{'email'}) {
      croak("Missing the required parameter 'email' when calling contacts_by_email_get");
    }

    # parse inputs
    my $_resource_path = '/contacts/{email}';

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
    if ( exists $args{'email'}) {
        my $_base_variable = "{" . "email" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'email'});
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
    my $_response_object = $self->{api_client}->deserialize('Contact', $response);
    return $_response_object;
}

#
# contacts_by_email_history_get
#
# Load History
# 
# @param string $email Proper email address. (required)
# @param int $limit Maximum number of returned items. (optional)
# @param int $offset How many items should be returned ahead. (optional)
{
    my $params = {
    'email' => {
        data_type => 'string',
        description => 'Proper email address.',
        required => '1',
    },
    'limit' => {
        data_type => 'int',
        description => 'Maximum number of returned items.',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'How many items should be returned ahead.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'contacts_by_email_history_get' } = { 
        summary => 'Load History',
        params => $params,
        returns => 'ARRAY[ContactHistory]',
        };
}
# @return ARRAY[ContactHistory]
#
sub contacts_by_email_history_get {
    my ($self, %args) = @_;

    # verify the required parameter 'email' is set
    unless (exists $args{'email'}) {
      croak("Missing the required parameter 'email' when calling contacts_by_email_history_get");
    }

    # parse inputs
    my $_resource_path = '/contacts/{email}/history';

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
    if ( exists $args{'limit'}) {
        $query_params->{'limit'} = $self->{api_client}->to_query_value($args{'limit'});
    }

    # query params
    if ( exists $args{'offset'}) {
        $query_params->{'offset'} = $self->{api_client}->to_query_value($args{'offset'});
    }

    # path params
    if ( exists $args{'email'}) {
        my $_base_variable = "{" . "email" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'email'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[ContactHistory]', $response);
    return $_response_object;
}

#
# contacts_by_email_put
#
# Update Contact
# 
# @param string $email Proper email address. (required)
# @param ContactUpdatePayload $contact_update_payload  (required)
{
    my $params = {
    'email' => {
        data_type => 'string',
        description => 'Proper email address.',
        required => '1',
    },
    'contact_update_payload' => {
        data_type => 'ContactUpdatePayload',
        description => '',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'contacts_by_email_put' } = { 
        summary => 'Update Contact',
        params => $params,
        returns => 'Contact',
        };
}
# @return Contact
#
sub contacts_by_email_put {
    my ($self, %args) = @_;

    # verify the required parameter 'email' is set
    unless (exists $args{'email'}) {
      croak("Missing the required parameter 'email' when calling contacts_by_email_put");
    }

    # verify the required parameter 'contact_update_payload' is set
    unless (exists $args{'contact_update_payload'}) {
      croak("Missing the required parameter 'contact_update_payload' when calling contacts_by_email_put");
    }

    # parse inputs
    my $_resource_path = '/contacts/{email}';

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
    if ( exists $args{'email'}) {
        my $_base_variable = "{" . "email" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'email'});
        $_resource_path =~ s/$_base_variable/$_base_value/g;
    }

    my $_body_data;
    # body params
    if ( exists $args{'contact_update_payload'}) {
        $_body_data = $args{'contact_update_payload'};
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
    my $_response_object = $self->{api_client}->deserialize('Contact', $response);
    return $_response_object;
}

#
# contacts_delete_post
#
# Delete Contacts Bulk
# 
# @param EmailsPayload $emails_payload Provide either rule or a list of emails, not both. (required)
{
    my $params = {
    'emails_payload' => {
        data_type => 'EmailsPayload',
        description => 'Provide either rule or a list of emails, not both.',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'contacts_delete_post' } = { 
        summary => 'Delete Contacts Bulk',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub contacts_delete_post {
    my ($self, %args) = @_;

    # verify the required parameter 'emails_payload' is set
    unless (exists $args{'emails_payload'}) {
      croak("Missing the required parameter 'emails_payload' when calling contacts_delete_post");
    }

    # parse inputs
    my $_resource_path = '/contacts/delete';

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept();
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('application/json');

    my $_body_data;
    # body params
    if ( exists $args{'emails_payload'}) {
        $_body_data = $args{'emails_payload'};
    }

    # authentication setting, if any
    my $auth_settings = [qw(apikey )];

    # make the API Call
    $self->{api_client}->call_api($_resource_path, $_method,
                                           $query_params, $form_params,
                                           $header_params, $_body_data, $auth_settings);
    return;
}

#
# contacts_export_by_id_status_get
#
# Check Export Status
# 
# @param string $id ID of the exported file (required)
{
    my $params = {
    'id' => {
        data_type => 'string',
        description => 'ID of the exported file',
        required => '1',
    },
    };
    __PACKAGE__->method_documentation->{ 'contacts_export_by_id_status_get' } = { 
        summary => 'Check Export Status',
        params => $params,
        returns => 'ExportStatus',
        };
}
# @return ExportStatus
#
sub contacts_export_by_id_status_get {
    my ($self, %args) = @_;

    # verify the required parameter 'id' is set
    unless (exists $args{'id'}) {
      croak("Missing the required parameter 'id' when calling contacts_export_by_id_status_get");
    }

    # parse inputs
    my $_resource_path = '/contacts/export/{id}/status';

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
    if ( exists $args{'id'}) {
        my $_base_variable = "{" . "id" . "}";
        my $_base_value = $self->{api_client}->to_path_value($args{'id'});
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
    my $_response_object = $self->{api_client}->deserialize('ExportStatus', $response);
    return $_response_object;
}

#
# contacts_export_post
#
# Export Contacts
# 
# @param ExportFileFormats $file_format Format of the exported file (optional)
# @param string $rule Query used for filtering. (optional)
# @param ARRAY[string] $emails Comma delimited list of contact emails (optional)
# @param CompressionFormat $compression_format FileResponse compression format. None or Zip. (optional)
# @param string $file_name Name of your file including extension. (optional)
{
    my $params = {
    'file_format' => {
        data_type => 'ExportFileFormats',
        description => 'Format of the exported file',
        required => '0',
    },
    'rule' => {
        data_type => 'string',
        description => 'Query used for filtering.',
        required => '0',
    },
    'emails' => {
        data_type => 'ARRAY[string]',
        description => 'Comma delimited list of contact emails',
        required => '0',
    },
    'compression_format' => {
        data_type => 'CompressionFormat',
        description => 'FileResponse compression format. None or Zip.',
        required => '0',
    },
    'file_name' => {
        data_type => 'string',
        description => 'Name of your file including extension.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'contacts_export_post' } = { 
        summary => 'Export Contacts',
        params => $params,
        returns => 'ExportLink',
        };
}
# @return ExportLink
#
sub contacts_export_post {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/contacts/export';

    my $_method = 'POST';
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
    if ( exists $args{'file_format'}) {
        $query_params->{'fileFormat'} = $self->{api_client}->to_query_value($args{'file_format'});
    }

    # query params
    if ( exists $args{'rule'}) {
        $query_params->{'rule'} = $self->{api_client}->to_query_value($args{'rule'});
    }

    # query params
    if ( exists $args{'emails'}) {
        $query_params->{'emails'} = $self->{api_client}->to_query_value($args{'emails'});
    }

    # query params
    if ( exists $args{'compression_format'}) {
        $query_params->{'compressionFormat'} = $self->{api_client}->to_query_value($args{'compression_format'});
    }

    # query params
    if ( exists $args{'file_name'}) {
        $query_params->{'fileName'} = $self->{api_client}->to_query_value($args{'file_name'});
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
    my $_response_object = $self->{api_client}->deserialize('ExportLink', $response);
    return $_response_object;
}

#
# contacts_get
#
# Load Contacts
# 
# @param int $limit Maximum number of returned items. (optional)
# @param int $offset How many items should be returned ahead. (optional)
{
    my $params = {
    'limit' => {
        data_type => 'int',
        description => 'Maximum number of returned items.',
        required => '0',
    },
    'offset' => {
        data_type => 'int',
        description => 'How many items should be returned ahead.',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'contacts_get' } = { 
        summary => 'Load Contacts',
        params => $params,
        returns => 'ARRAY[Contact]',
        };
}
# @return ARRAY[Contact]
#
sub contacts_get {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/contacts';

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
    if ( exists $args{'limit'}) {
        $query_params->{'limit'} = $self->{api_client}->to_query_value($args{'limit'});
    }

    # query params
    if ( exists $args{'offset'}) {
        $query_params->{'offset'} = $self->{api_client}->to_query_value($args{'offset'});
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Contact]', $response);
    return $_response_object;
}

#
# contacts_import_post
#
# Upload Contacts
# 
# @param string $list_name Name of an existing list to add these contacts to (optional)
# @param string $encoding_name In what encoding the file is uploaded (optional)
# @param string $file  (optional)
{
    my $params = {
    'list_name' => {
        data_type => 'string',
        description => 'Name of an existing list to add these contacts to',
        required => '0',
    },
    'encoding_name' => {
        data_type => 'string',
        description => 'In what encoding the file is uploaded',
        required => '0',
    },
    'file' => {
        data_type => 'string',
        description => '',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'contacts_import_post' } = { 
        summary => 'Upload Contacts',
        params => $params,
        returns => undef,
        };
}
# @return void
#
sub contacts_import_post {
    my ($self, %args) = @_;

    # parse inputs
    my $_resource_path = '/contacts/import';

    my $_method = 'POST';
    my $query_params = {};
    my $header_params = {};
    my $form_params = {};

    # 'Accept' and 'Content-Type' header
    my $_header_accept = $self->{api_client}->select_header_accept();
    if ($_header_accept) {
        $header_params->{'Accept'} = $_header_accept;
    }
    $header_params->{'Content-Type'} = $self->{api_client}->select_header_content_type('multipart/form-data');

    # query params
    if ( exists $args{'list_name'}) {
        $query_params->{'listName'} = $self->{api_client}->to_query_value($args{'list_name'});
    }

    # query params
    if ( exists $args{'encoding_name'}) {
        $query_params->{'encodingName'} = $self->{api_client}->to_query_value($args{'encoding_name'});
    }

    # form params
    if ( exists $args{'file'} ) {
        $form_params->{'file'} = [] unless defined $form_params->{'file'};
        push @{$form_params->{'file'}}, $args{'file'};
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
# contacts_post
#
# Add Contact
# 
# @param ARRAY[ContactPayload] $contact_payload  (required)
# @param ARRAY[string] $listnames Names of lists to which the uploaded contacts should be added to (optional)
{
    my $params = {
    'contact_payload' => {
        data_type => 'ARRAY[ContactPayload]',
        description => '',
        required => '1',
    },
    'listnames' => {
        data_type => 'ARRAY[string]',
        description => 'Names of lists to which the uploaded contacts should be added to',
        required => '0',
    },
    };
    __PACKAGE__->method_documentation->{ 'contacts_post' } = { 
        summary => 'Add Contact',
        params => $params,
        returns => 'ARRAY[Contact]',
        };
}
# @return ARRAY[Contact]
#
sub contacts_post {
    my ($self, %args) = @_;

    # verify the required parameter 'contact_payload' is set
    unless (exists $args{'contact_payload'}) {
      croak("Missing the required parameter 'contact_payload' when calling contacts_post");
    }

    # parse inputs
    my $_resource_path = '/contacts';

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

    # query params
    if ( exists $args{'listnames'}) {
        $query_params->{'listnames'} = $self->{api_client}->to_query_value($args{'listnames'});
    }

    my $_body_data;
    # body params
    if ( exists $args{'contact_payload'}) {
        $_body_data = $args{'contact_payload'};
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
    my $_response_object = $self->{api_client}->deserialize('ARRAY[Contact]', $response);
    return $_response_object;
}

1;
