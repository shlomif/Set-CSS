package Set::CSS;

use strict;
use warnings;

use parent 'Set::Object';

sub html_attrs
{
    my ( $self, $args ) = @_;

    if ( $args->{on_empty} or !( $self->is_null ) )
    {
        return { class => join( " ", @$self ) };
    }
    return +{};
}

1;

__END__

=encoding utf8

=head1 NAME

Set::CSS - set of CSS classes

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=head2 $self->html_attrs(\%args)

Returns a hash reference of HTML attributes.

=head2

=cut

