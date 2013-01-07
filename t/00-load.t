#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'WebService::Mandrill' ) || print "Bail out!\n";
}

diag( "Testing WebService::Mandrill $WebService::Mandrill::VERSION, Perl $], $^X" );
