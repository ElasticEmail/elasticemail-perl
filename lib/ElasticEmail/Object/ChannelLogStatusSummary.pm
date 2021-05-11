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
package ElasticEmail::Object::ChannelLogStatusSummary;

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
#Summary of channel log status
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



__PACKAGE__->class_documentation({description => 'Summary of channel log status',
                                  class => 'ChannelLogStatusSummary',
                                  required => [], # TODO
}                                 );

__PACKAGE__->method_documentation({
    'channel_name' => {
        datatype => 'string',
        base_name => 'ChannelName',
        description => 'Channel name',
        format => '',
        read_only => '',
            },
    'recipients' => {
        datatype => 'int',
        base_name => 'Recipients',
        description => 'Number of recipients',
        format => '',
        read_only => '',
            },
    'email_total' => {
        datatype => 'int',
        base_name => 'EmailTotal',
        description => 'Number of emails',
        format => '',
        read_only => '',
            },
    'sms_total' => {
        datatype => 'int',
        base_name => 'SmsTotal',
        description => 'Number of SMS',
        format => '',
        read_only => '',
            },
    'delivered' => {
        datatype => 'int',
        base_name => 'Delivered',
        description => 'Number of delivered messages',
        format => '',
        read_only => '',
            },
    'bounced' => {
        datatype => 'int',
        base_name => 'Bounced',
        description => 'Number of bounced messages',
        format => '',
        read_only => '',
            },
    'in_progress' => {
        datatype => 'int',
        base_name => 'InProgress',
        description => 'Number of messages in progress',
        format => '',
        read_only => '',
            },
    'opened' => {
        datatype => 'int',
        base_name => 'Opened',
        description => 'Number of opened messages',
        format => '',
        read_only => '',
            },
    'clicked' => {
        datatype => 'int',
        base_name => 'Clicked',
        description => 'Number of clicked messages',
        format => '',
        read_only => '',
            },
    'unsubscribed' => {
        datatype => 'int',
        base_name => 'Unsubscribed',
        description => 'Number of unsubscribed messages',
        format => '',
        read_only => '',
            },
    'complaints' => {
        datatype => 'int',
        base_name => 'Complaints',
        description => 'Number of complaint messages',
        format => '',
        read_only => '',
            },
    'inbound' => {
        datatype => 'int',
        base_name => 'Inbound',
        description => 'Number of inbound messages',
        format => '',
        read_only => '',
            },
    'manual_cancel' => {
        datatype => 'int',
        base_name => 'ManualCancel',
        description => 'Number of manually cancelled messages',
        format => '',
        read_only => '',
            },
    'not_delivered' => {
        datatype => 'int',
        base_name => 'NotDelivered',
        description => 'Number of messages flagged with &#39;Not Delivered&#39;',
        format => '',
        read_only => '',
            },
});

__PACKAGE__->openapi_types( {
    'channel_name' => 'string',
    'recipients' => 'int',
    'email_total' => 'int',
    'sms_total' => 'int',
    'delivered' => 'int',
    'bounced' => 'int',
    'in_progress' => 'int',
    'opened' => 'int',
    'clicked' => 'int',
    'unsubscribed' => 'int',
    'complaints' => 'int',
    'inbound' => 'int',
    'manual_cancel' => 'int',
    'not_delivered' => 'int'
} );

__PACKAGE__->attribute_map( {
    'channel_name' => 'ChannelName',
    'recipients' => 'Recipients',
    'email_total' => 'EmailTotal',
    'sms_total' => 'SmsTotal',
    'delivered' => 'Delivered',
    'bounced' => 'Bounced',
    'in_progress' => 'InProgress',
    'opened' => 'Opened',
    'clicked' => 'Clicked',
    'unsubscribed' => 'Unsubscribed',
    'complaints' => 'Complaints',
    'inbound' => 'Inbound',
    'manual_cancel' => 'ManualCancel',
    'not_delivered' => 'NotDelivered'
} );

__PACKAGE__->mk_accessors(keys %{__PACKAGE__->attribute_map});


1;