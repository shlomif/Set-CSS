package Set::CSS;

use 5.014;
use strict;
use warnings;

use parent 'Set::Object';

use HTML::Widgets::NavMenu::EscapeHtml qw/ escape_html /;

sub html_attrs
{
    my ( $self, $args ) = @_;

    if ( $args->{on_empty} or !( $self->is_null ) )
    {
        return { class => join( " ", @$self ) };
    }
    return +{};
}

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

sub addClass
{
    my ( $self, @c ) = @_;

    $self->insert(@c);

    return;
}

sub removeClass
{
    my ( $self, @c ) = @_;

    $self->remove(@c);

    return;
}

sub toggleClass
{
    my ( $self, @c ) = @_;

    $self->invert(@c);

    return;
}

1;

__END__

=encoding utf8

=head1 NAME

Set::CSS - set of CSS classes

=head1 SYNOPSIS

    use Set::CSS ();

    my $set = Set::CSS->new( "class1", );
    $set->insert("blast");
    # Avoiding duplicates
    $set->insert("class1");

    # Prints ' class="blast class1"'
    print $set->as_html(), "\n";

=head1 DESCRIPTION

Inheriting from L<Set::Object> this class provides methods for emitting
HTML.

If C<< $args{on_empty} >> is not true B<and> the set is empty, then no output
shall be emitted.

=head1 METHODS

=head2 $self->html_attrs(\%args)

Returns a hash reference of HTML attributes.

=head2 $self->as_html(\%args)

Returns a string of HTML attributes.

=head2 $self->addClass(@classes)

Wrapper for Set::Object 's insert() with an empty return value (for use
in L<Template> / etc.)

(Added in v0.2.0. )

=head2 $self->removeClass(@classes)

Wrapper for Set::Object 's remove() with an empty return value (for use
in L<Template> / etc.)

(Added in v0.2.0. )

=head2 $self->toggleClass(@classes)

Wrapper for Set::Object 's invert() with an empty return value (for use
in L<Template> / etc.)

(Added in v0.2.0. )

=head1 Media Recommendations

L<Hallelujah - Cover by Lucy Thomas|https://www.youtube.com/watch?v=4hjgkvuKES8>

=head1 SEE ALSO

L<Set::Object> - Set::CSS inherits its methods

L<HTML's 'class' attribute|https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/class>

L<jQuery’s class methods|https://api.jquery.com/category/manipulation/class-attribute/>

=cut

