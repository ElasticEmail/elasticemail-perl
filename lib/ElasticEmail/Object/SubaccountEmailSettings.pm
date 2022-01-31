=begin comment

Elastic Email REST API

This API is based on the REST API architecture, allowing the user to easily manage their data with this resource-based approach.    Every API call is established on which specific request type (GET, POST, PUT, DELETE) will be used.    The API has a limit of 20 concurrent connections and a hard timeout of 600 seconds per request.    To start using this API, you will need your Access Token (available <a target=\"_blank\" href=\"https://elasticemail.com/account#/settings/new/manage-api\">here</a>). Remember to keep it safe. Required access levels are listed in the given request’s description.    This is the documentation for REST API. If you’d like to read our legacy documentation regarding Web API v2 click <a target=\"_blank\" href=\"https://api.elasticemail.com/public/help\">here</a>.    Downloadable library clients can be found in our Github repository <a target=\"_blank\" href=\"https://github.com/ElasticEmail?tab=repositories&q=%22rest+api%22+in%3Areadme\">here</a>

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
package ElasticEmail::Object::SubaccountEmailSettings;

require 5.6.0;
use strict;
use warnings;
use utf8;
use JSON qw(decode_json);
use Data::Dumper;
use Module::Runtime qw(use_module);
use Log::Any qw($log);
use Date::Parse;
use DateTime;


use base ("Class::Accessor", "Class::Data::Inheritable");

#
#Settings related to sending emails
#
# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech). Do not edit the class manually.
# REF: https://openapi-generator.tech
#

=begin comment

Elastic Email REST API

This API is based on the REST API architecture, allowing the user to easily manage their data with this resource-based approach.    Every API call is established on which specific request type (GET, POST, PUT, DELETE) will be used.    The API has a limit of 20 concurrent connections and a hard timeout of 600 seconds per request.    To start using this API, you will need your Access Token (available <a target=\"_blank\" href=\"https://elasticemail.com/account#/settings/new/manage-api\">here</a>). Remember to keep it safe. Required access levels are listed in the given request’s description.    This is the documentation for REST API. If you’d like to read our legacy documentation regarding Web API v2 click <a target=\"_blank\" href=\"https://api.elasticemail.com/public/help\">here</a>.    Downloadable library clients can be found in our Github repository <a target=\"_blank\" href=\"https://github.com/ElasticEmail?tab=repositories&q=%22rest+api%22+in%3Areadme\">here</a>

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
__PACKAGE__->mk_classdata('attribute_map' => {});
__PACKAGE__->mk_classdata('openapi_types' => {});
__PACKAGE__->mk_classdata('method_documentation' => {});
__PACKAGE__->mk_classdata('class_documentation' => {});

# new plain object
sub new {
    my ($class, %args) = @_;

    my $self = bless {}, $class;

    $self->init(%args);

    return $self;
}

# initialize the object
sub init
{
    my ($self, %args) = @_;

    foreach my $attribute (keys %{$self->attribute_map}) {
        my $args_key = $self->attribute_map->{$attribute};
        $self->$attribute( $args{ $args_key } );
    }
}

# return perl hash
sub to_hash {
    my $self = shift;
    my $_hash = decode_json(JSON->new->convert_blessed->encode($self));

    return $_hash;
}

# used by JSON for serialization
sub TO_JSON {
    my $self = shift;
    my $_data = {};
    foreach my $_key (keys %{$self->attribute_map}) {
        if (defined $self->{$_key}) {
            $_data->{$self->attribute_map->{$_key}} = $self->{$_key};
        }
    }

    return $_data;
}

# from Perl hashref
sub from_hash {
    my ($self, $hash) = @_;

    # loop through attributes and use openapi_types to deserialize the data
    while ( my ($_key, $_type) = each %{$self->openapi_types} ) {
        my $_json_attribute = $self->attribute_map->{$_key};
        if ($_type =~ /^array\[(.+)\]$/i) { # array
            my $_subclass = $1;
            my @_array = ();
            foreach my $_element (@{$hash->{$_json_attribute}}) {
                push @_array, $self->_deserialize($_subclass, $_element);
            }
            $self->{$_key} = \@_array;
        } elsif ($_type =~ /^hash\[string,(.+)\]$/i) { # hash
            my $_subclass = $1;
            my %_hash = ();
            while (my($_key, $_element) = each %{$hash->{$_json_attribute}}) {
                $_hash{$_key} = $self->_deserialize($_subclass, $_element);
            }
            $self->{$_key} = \%_hash;
        } elsif (exists $hash->{$_json_attribute}) { #hash(model), primitive, datetime
            $self->{$_key} = $self->_deserialize($_type, $hash->{$_json_attribute});
        } else {
            $log->debugf("Warning: %s (%s) does not exist in input hash\n", $_key, $_json_attribute);
        }
    }

    return $self;
}

# deserialize non-array data
sub _deserialize {
    my ($self, $type, $data) = @_;
    $log->debugf("deserializing %s with %s",Dumper($data), $type);

    if ($type eq 'DateTime') {
        return DateTime->from_epoch(epoch => str2time($data));
    } elsif ( grep( /^$type$/, ('int', 'double', 'string', 'boolean'))) {
        return $data;
    } else { # hash(model)
        my $_instance = eval "ElasticEmail::Object::$type->new()";
        return $_instance->from_hash($data);
    }
}


__PACKAGE__->class_documentation({description => 'Settings related to sending emails',
                                  class => 'SubaccountEmailSettings',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'monthly_refill_credits' => {
        datatype => 'int',
        base_name => 'MonthlyRefillCredits',
        description => 'Amount of credits added to Account automatically',
        format => '',
        read_only => '',
            },
    'requires_email_credits' => {
        datatype => 'boolean',
        base_name => 'RequiresEmailCredits',
        description => 'True, if Account needs credits to send emails. Otherwise, false',
        format => '',
        read_only => '',
            },
    'email_size_limit' => {
        datatype => 'int',
        base_name => 'EmailSizeLimit',
        description => 'Maximum size of email including attachments in MB&#39;s',
        format => '',
        read_only => '',
            },
    'daily_send_limit' => {
        datatype => 'int',
        base_name => 'DailySendLimit',
        description => 'Amount of emails Account can send daily',
        format => '',
        read_only => '',
            },
    'max_contacts' => {
        datatype => 'int',
        base_name => 'MaxContacts',
        description => 'Maximum number of contacts the Account can have. 0 means that parent account&#39;s limit is used.',
        format => '',
        read_only => '',
            },
    'enable_private_ip_purchase' => {
        datatype => 'boolean',
        base_name => 'EnablePrivateIPPurchase',
        description => 'Can the SubAccount purchase Private IP for themselves',
        format => '',
        read_only => '',
            },
    'pool_name' => {
        datatype => 'string',
        base_name => 'PoolName',
        description => 'Name of your custom IP Pool to be used in the sending process',
        format => '',
        read_only => '',
            },
    'valid_sender_domain_only' => {
        datatype => 'boolean',
        base_name => 'ValidSenderDomainOnly',
        description => '',
        format => '',
        read_only => '',
            },
});

__PACKAGE__->openapi_types( {
    'monthly_refill_credits' => 'int',
    'requires_email_credits' => 'boolean',
    'email_size_limit' => 'int',
    'daily_send_limit' => 'int',
    'max_contacts' => 'int',
    'enable_private_ip_purchase' => 'boolean',
    'pool_name' => 'string',
    'valid_sender_domain_only' => 'boolean'
} );

__PACKAGE__->attribute_map( {
    'monthly_refill_credits' => 'MonthlyRefillCredits',
    'requires_email_credits' => 'RequiresEmailCredits',
    'email_size_limit' => 'EmailSizeLimit',
    'daily_send_limit' => 'DailySendLimit',
    'max_contacts' => 'MaxContacts',
    'enable_private_ip_purchase' => 'EnablePrivateIPPurchase',
    'pool_name' => 'PoolName',
    'valid_sender_domain_only' => 'ValidSenderDomainOnly'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;
