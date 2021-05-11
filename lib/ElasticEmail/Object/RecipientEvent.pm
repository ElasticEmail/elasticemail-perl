=begin comment

Elastic Email REST API

This API is based on the REST API architecture, allowing the user to easily manage their data with this resource-based approach.    Every API call is established on which specific request type (GET, POST, PUT, DELETE) will be used.    To start using this API, you will need your Access Token (available <a href=\"https://elasticemail.com/account#/settings/new/manage-api\">here</a>). Remember to keep it safe. Required access levels are listed in the given request’s description.    This is the documentation for REST API. If you’d like to read our legacy documentation regarding Web API v2 click <a href=\"https://api.elasticemail.com/public/help\">here</a>.

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
package ElasticEmail::Object::RecipientEvent;

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

use ElasticEmail::Object::EventType;
use ElasticEmail::Object::MessageCategory;

use base ("Class::Accessor", "Class::Data::Inheritable");

#
#Detailed information about message recipient
#
# NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech). Do not edit the class manually.
# REF: https://openapi-generator.tech
#

=begin comment

Elastic Email REST API

This API is based on the REST API architecture, allowing the user to easily manage their data with this resource-based approach.    Every API call is established on which specific request type (GET, POST, PUT, DELETE) will be used.    To start using this API, you will need your Access Token (available <a href=\"https://elasticemail.com/account#/settings/new/manage-api\">here</a>). Remember to keep it safe. Required access levels are listed in the given request’s description.    This is the documentation for REST API. If you’d like to read our legacy documentation regarding Web API v2 click <a href=\"https://api.elasticemail.com/public/help\">here</a>.

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



__PACKAGE__->class_documentation({description => 'Detailed information about message recipient',
                                  class => 'RecipientEvent',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'transaction_id' => {
        datatype => 'string',
        base_name => 'TransactionID',
        description => 'ID number of transaction',
        format => '',
        read_only => '',
            },
    'msg_id' => {
        datatype => 'string',
        base_name => 'MsgID',
        description => 'ID number of selected message.',
        format => '',
        read_only => '',
            },
    'from_email' => {
        datatype => 'string',
        base_name => 'FromEmail',
        description => 'Default From: email address.',
        format => '',
        read_only => '',
            },
    'to' => {
        datatype => 'string',
        base_name => 'To',
        description => 'Ending date for search in YYYY-MM-DDThh:mm:ss format.',
        format => '',
        read_only => '',
            },
    'subject' => {
        datatype => 'string',
        base_name => 'Subject',
        description => 'Default subject of email.',
        format => '',
        read_only => '',
            },
    'event_type' => {
        datatype => 'EventType',
        base_name => 'EventType',
        description => 'Type of an Event',
        format => '',
        read_only => '',
            },
    'event_date' => {
        datatype => 'DateTime',
        base_name => 'EventDate',
        description => 'Creation date',
        format => '',
        read_only => '',
            },
    'channel_name' => {
        datatype => 'string',
        base_name => 'ChannelName',
        description => 'Name of selected channel.',
        format => '',
        read_only => '',
            },
    'message_category' => {
        datatype => 'MessageCategory',
        base_name => 'MessageCategory',
        description => 'Message category',
        format => '',
        read_only => '',
            },
    'next_try_on' => {
        datatype => 'DateTime',
        base_name => 'NextTryOn',
        description => 'Date of next try',
        format => '',
        read_only => '',
            },
    'message' => {
        datatype => 'string',
        base_name => 'Message',
        description => 'Content of message, HTML encoded',
        format => '',
        read_only => '',
            },
    'ip_address' => {
        datatype => 'string',
        base_name => 'IPAddress',
        description => 'IP which this email was sent through',
        format => '',
        read_only => '',
            },
    'pool_name' => {
        datatype => 'string',
        base_name => 'PoolName',
        description => 'Name of an IP pool this email was sent through',
        format => '',
        read_only => '',
            },
});

__PACKAGE__->openapi_types( {
    'transaction_id' => 'string',
    'msg_id' => 'string',
    'from_email' => 'string',
    'to' => 'string',
    'subject' => 'string',
    'event_type' => 'EventType',
    'event_date' => 'DateTime',
    'channel_name' => 'string',
    'message_category' => 'MessageCategory',
    'next_try_on' => 'DateTime',
    'message' => 'string',
    'ip_address' => 'string',
    'pool_name' => 'string'
} );

__PACKAGE__->attribute_map( {
    'transaction_id' => 'TransactionID',
    'msg_id' => 'MsgID',
    'from_email' => 'FromEmail',
    'to' => 'To',
    'subject' => 'Subject',
    'event_type' => 'EventType',
    'event_date' => 'EventDate',
    'channel_name' => 'ChannelName',
    'message_category' => 'MessageCategory',
    'next_try_on' => 'NextTryOn',
    'message' => 'Message',
    'ip_address' => 'IPAddress',
    'pool_name' => 'PoolName'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;