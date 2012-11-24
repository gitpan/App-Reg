use strict;
use warnings;
use Test::More tests => 5;
use App::Reg;
use File::Spec;
use IPC::Open3;
use Symbol qw/gensym/;

# Should be filled by IPC::Run after import.
sub run;

sub execute {
    # Slurp mode
    local $/;
    # Declare global filehandle to be local.
    local *PH;
    # $^X gets current Perl executable. It's needed because we cannot be
    # sure if perl executable is surely the executable that tests the
    # module.
    my $executable = File::Spec->catfile(qw/bin reg/);
    my $pid = open3 gensym, \*PH, \*PH, $^X, $executable, @_;
    
    my $output = "";
    while (<PH>) {
        $output .= $_;
    }
    waitpid $pid, 0;
    $output;
}
# Anchored UTF-8 means that input was interpreted as UTF-8
like execute('a', 'a'), qr/anchored utf8 "/, 'UTF-8';
# But when executed with ASCII, it shouldn't mention UTF-8
like execute('--ascii', 'a', 'a'), qr/anchored "/, 'ASCII option';
# Color option should have escape sequences
like execute('a', 'a'), qr/\e/, 'Colors';
# No colors
unlike execute('--no-colors', 'a', 'a'), qr/\e/, 'No colors';
# Version should show current version
like execute('--version'), qr/\b$App::Reg::VERSION\b/, 'Version';
