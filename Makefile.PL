#!/usr/bin/env perl
use 5.006;
use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'App::Reg',
    AUTHOR           => 'Konrad Borowski <glitchmr@myopera.com>',
    VERSION_FROM     => 'lib/App/Reg.pm',
    ABSTRACT_FROM    => 'lib/App/Reg.pm',
    LICENSE          => 'perl',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.9.5,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More' => 0,
    },
    PREREQ_PM => {},
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'App-Reg-*' },
    EXE_FILES => ['bin/reg'],
);
