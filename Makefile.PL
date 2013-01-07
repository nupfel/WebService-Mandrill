use 5.010;
use inc::Module::Install;

name     'WebService-Mandrill';
all_from 'lib/WebService/Mandrill.pm';
author   q{Tobias Kirschstein <lev@cpan.org>};
license  'perl';

build_requires 'Test::More';

requires 'Any::Moose';
requires 'Web::API';

auto_install;

WriteAll;
