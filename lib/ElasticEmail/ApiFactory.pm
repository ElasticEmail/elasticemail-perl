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
package ElasticEmail::ApiFactory;

use strict;
use warnings;
use utf8;

use Carp;
use Module::Find;

usesub ElasticEmail::Object;

use ElasticEmail::ApiClient;

=head1 Name

    ElasticEmail::ApiFactory - constructs APIs to retrieve ElasticEmail objects

=head1 Synopsis

    package My::Petstore::App;
    
    use ElasticEmail::ApiFactory;
    
    my $api_factory = ElasticEmail::ApiFactory->new( ... ); # any args for ApiClient constructor

    # later...
    my $pet_api = $api_factory->get_api('Pet');  
    
    # $pet_api isa ElasticEmail::PetApi
    
    my $pet = $pet_api->get_pet_by_id(pet_id => $pet_id);

    # object attributes have proper accessors:
    printf "Pet's name is %s", $pet->name;

    # change the value stored on the object:
    $pet->name('Dave'); 

=cut

# Load all the API classes and construct a lookup table at startup time
my %_apis = map { $_ =~ /^ElasticEmail::(.*)$/; $1 => $_ } 
            grep {$_ =~ /Api$/} 
            usesub 'ElasticEmail';

=head1 new($api_client)
    
    create a new ElasticEmail::ApiFactory instance with the given ElasticEmail::ApiClient instance.

=head1 new(%parameters)

    Any parameters are optional, and are passed to and stored on the api_client object.
    
    See L<ElasticEmail::ApiClient> and L<ElasticEmail::Configuration> for valid parameters

=cut    

sub new {
    my ($class) = shift;

    my $api_client;
    if ($_[0] && ref $_[0] && ref $_[0] eq 'ElasticEmail::ApiClient' ) {
        $api_client = $_[0];
    } else {
        $api_client = ElasticEmail::ApiClient->new(@_);
    }
    bless { api_client => $api_client }, $class;
}

=head1 get_api($which)

    Returns an API object of the requested type. 
    
    $which is a nickname for the class: 
    
        FooBarClient::BazApi has nickname 'Baz'
        
=cut

sub get_api {
    my ($self, $which) = @_;
    croak "API not specified" unless $which;
    my $api_class = $_apis{"${which}Api"} || croak "No known API for '$which'";
    return $api_class->new($self->api_client); 
}

=head1 api_client()

    Returns the api_client object, should you ever need it.
    
=cut

sub api_client { $_[0]->{api_client} }

=head1 apis_available()
=cut 

sub apis_available { return map { $_ =~ s/Api$//; $_ } sort keys %_apis }

=head1 classname_for()
=cut

sub classname_for {
    my ($self, $api_name) = @_;
    return $_apis{"${api_name}Api"};
}


1;