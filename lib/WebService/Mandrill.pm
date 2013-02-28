package WebService::Mandrill;

use 5.010;
use Any::Moose;
with 'Web::API';

=head1 NAME

WebService::Mandrill - an interface to mandrillapp.com's RESTful Web API using Web::API

=head1 VERSION

Version 0.2.2

=cut

our $VERSION = '0.2';

has 'commands' => (
    is      => 'rw',
    default => sub {
        {
            ping         => { path => 'users/ping' },
            ping2        => { path => 'users/ping2' },
            user_info    => { path => 'users/info' },
            user_senders => { path => 'users/senders' },
            send         => {
                path      => 'messages/send',
                mandatory => [ 'subject', 'from_email', 'to' ],
                wrapper   => 'message',
            },
            send_raw => {
                path      => 'messages/send-raw',
                mandatory => ['raw_message'],
                wrapper   => 'message',
            },
            parse => {
                path      => 'messages/parse',
                mandatory => ['raw_message'],
            },
            search => { path => 'messages/search' },
            tags   => { path => 'tags/list' },
            tag    => {
                path      => 'tags/info',
                mandatory => ['tag'],
            },
            delete_tag => {
                path      => 'tags/delete',
                mandatory => ['tag'],
            },
            tag_history => {
                path      => 'tags/time-series',
                mandatory => ['tag'],
            },
            all_tag_history => {
                path      => 'tags/all-time-series',
                mandatory => ['tag'],
            },
            rejects       => { path => 'rejects/list' },
            delete_reject => {
                path      => 'rejects/delete',
                mandatory => ['email']
            },
            senders        => { path => 'senders/list' },
            sender_domains => { path => 'senders/domains' },
            sender         => {
                path      => 'senders/info',
                mandatory => ['address'],
            },
            sender_history => {
                path      => 'senders/time-series',
                mandatory => ['address'],
            },
            urls        => { path => 'urls/list' },
            search_urls => {
                path      => 'urls/search',
                mandatory => ['q'],
            },
            url_history => {
                path      => 'urls/time-series',
                mandatory => ['url'],
            },
            webhooks => { path => 'webhooks/list' },
            webhook  => {
                path      => 'webhooks/info',
                mandatory => ['id'],
            },
            add_webhook => {
                path      => 'webhooks/add',
                mandatory => ['url'],
            },
            update_webhook => {
                path      => 'webhooks/update',
                mandatory => [ 'id', 'url' ],
            },
            delete_webhook => {
                path      => 'webhooks/delete',
                mandatory => ['id'],
            },
            inbound_domains => { path => 'inbound/domains' },
            inbound_routes  => {
                path      => 'inbound/routes',
                mandatory => ['domain'],
            },
            inbound_raw => {
                path      => 'inbound/send-raw',
                mandatory => ['raw_message'],
            },
        };
    },
);

=head1 SYNOPSIS

Please refer to the API documentation at L<http://mandrillapp.com/api/docs/index.html>

    use WebService::Mandrill;
    
    my $mandrill = WebService::Mandrill->new(
        debug   => 1,
        api_key => '12345678-9abc-def0-1234-56789abcdef0',
    );
    
    my $response = $mandrill->send(
        subject      => "h4x0r",
        from_email   => "mail@example.com",
        text         => "what zee fug",
        track_opens  => 1,
        track_clicks => 1,
        to => [
            { email => 'mail@example.com' }
        ],
    );

=head1 SUBROUTINES/METHODS

=head2 ping

=head2 ping2

=head2 user_info

=head2 user_senders

=head2 send

=head2 send_raw

=head2 parse

=head2 search

=head2 tags

=head2 tag

=head2 delete_tag

=head2 tag_history

=head2 all_tag_history

=head2 rejects

=head2 delete_reject

=head2 senders

=head2 sender

=head2 sender_domains

=head2 sender_history

=head2 urls

=head2 search_urls

=head2 url_history

=head2 webhooks

=head2 webhook

=head2 add_webhook

=head2 update_webhook

=head2 delete_webhook

=head2 inbound_domains

=head2 inbound_routes

=head2 inbound_raw

=head1 INTERNALS

=cut

sub commands {
    my ($self) = @_;
    return $self->commands;
}

=head2 BUILD

basic configuration for the client API happens usually in the BUILD method when using Web::API

=cut

sub BUILD {
    my ($self) = @_;

    $self->user_agent(__PACKAGE__ . ' ' . $VERSION);
    $self->content_type('application/json');
    $self->default_method('POST');
    $self->extension('json');
    $self->base_url('https://mandrillapp.com/api/1.0');
    $self->auth_type('hash_key');

    return $self;
}

=head1 AUTHOR

Tobias Kirschstein, C<< <lev at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-webservice-mandrill at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WebService-Mandrill>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WebService::Mandrill

You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WebService-Mandrill>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WebService-Mandrill>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WebService-Mandrill>

=item * Search CPAN

L<http://search.cpan.org/dist/WebService-Mandrill/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2013 Tobias Kirschstein.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;    # End of WebService::Mandrill
