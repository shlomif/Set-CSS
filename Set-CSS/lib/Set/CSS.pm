package Set::CSS;

use 5.014;
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

use HTML::Widgets::NavMenu::EscapeHtml qw/ escape_html /;

sub as_html
{
    my ( $self, $args ) = @_;

    my $att = $self->html_attrs($args);
    my $ret = "";
    foreach my $k ( sort keys %$att )
    {
        $ret .= qq# $k="# . escape_html( $att->{$k} ) . qq#"#;
    }
    return $ret;
}

1;

__END__

=encoding utf8

=head1 NAME

Set::CSS - set of CSS classes

=head1 SYNOPSIS

    use Set::CSS ();

    my $set = Set::CSS->new( "class1", "blast", );

    # Prints ' class="blast class1"'
    print $set->as_html(), "\n";

=head1 DESCRIPTION

Inheriting from L<Set::Object> this class provides methods for emitting
HTML.

If $args{on_empty} is not true B<and> the set is empty, then no output
shall be emitted.

=head1 METHODS

=head2 $self->html_attrs(\%args)

Returns a hash reference of HTML attributes.

=head2 $self->as_html(\%args)

Returns a string of HTML attributes.

=head1 Media Recommendations

L<Hallelujah - Cover by Lucy Thomas|https://www.youtube.com/watch?v=4hjgkvuKES8>

=cut

