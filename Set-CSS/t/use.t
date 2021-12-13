#!/usr/bin/env perl

use strict;
use warnings;
use Test::More tests => 1;

use Set::CSS ();

{
    my $set = Set::CSS->new( "class1", "blast", );

    use Test::Differences qw( eq_or_diff );

    # TEST
    eq_or_diff(
        $set->html_attrs(),
        {
            class => "blast class1"
        },
        "html_attrs on full"
    );
}
