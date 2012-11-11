package App::Reg;
use strict;
use warnings;

our $VERSION = '1.0.2';

# Return positive value
1;

__END__

=head1 NAME

App::Reg - re 'debug' wrapper

=head1 SYNOPSIS

  reg [options] [string] [regex]

  Options:
    -help            brief help message

=head1 OPTIONS

=over 8

=item B<-help>

Print a brief help message and exits.

=back

=head1 DESCRIPTION

B<This program> tries to match regex to string and shows Perl regular
expression debugger output.

=head1 AUTHOR

Konrad Borowski <glitchmr@myopera.com>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Konrad Borowski.
 
This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
