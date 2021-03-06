#!/usr/bin/env perl

use Data::Tabulate;
use Test::More;

use File::Basename;
use lib dirname(__FILE__);

my @array     = (1..10);
my $tabulator = Data::Tabulate->new();
my @table     = $tabulator->tabulate( @array );

is_deeply \@table, [[1,2,3],[4,5,6],[7,8,9],[10,undef,undef]];
is_deeply $tabulator->{tabulated}, [[1,2,3],[4,5,6],[7,8,9],[10,undef,undef]];

my $dump = $tabulator->render('Test');

my $check = q~$VAR1 = [
          [
            1,
            2,
            3
          ],
          [
            4,
            5,
            6
          ],
          [
            7,
            8,
            9
          ],
          [
            10,
            undef,
            undef
          ]
        ];
~;

is($dump,$check);

done_testing();
