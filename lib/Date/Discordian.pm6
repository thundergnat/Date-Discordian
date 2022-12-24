use v6.c;
unit class Date::Discordian:ver<0.0.2>;

use Lingua::EN::Numbers;

multi discordian ( Str $ymd, :$h = False ) is export {
    my $date = Date.new($ymd);
    __ddate($date, $h)
}

multi discordian ( Instant $time, :$h = False ) is export {
    my $date = Date.new($time);
    __ddate($date, $h)
}

multi discordian ( 'today', :$h = False ) is export {
    my $date = Date.today;
    __ddate($date, $h)
}

multi discordian ( Int $y, Int $m, Int $d, :$h = False ) is export {
    my $date = Date.new( $y, $m, $d );
    __ddate($date, $h)
}

multi discordian ( Date $date, :$h = False ) is export {
    __ddate($date, $h)
}

sub today is export { Date.today }

sub __ddate ( Date $date, $h ) {
    my @seasons = << Chaos Discord Confusion Bureaucracy 'The Aftermath' >>;
    my @days = << Sweetmorn Boomtime Pungenday Prickle-Prickle 'Setting Orange' >>;
    my %holy =
        'Chaos 5'          => 'Mungday',
        'Chaos 50'         => 'Chaoflux',
        'Discord 5'        => 'Mojoday',
        'Discord 50'       => 'Discoflux',
        'Confusion 5'      => 'Syaday',
        'Confusion 50'     => 'Confuflux',
        'Bureaucracy 5'    => 'Zaraday',
        'Bureaucracy 50'   => 'Bureflux',
        'The Aftermath 5'  => 'Maladay',
        'The Aftermath 50' => 'Afflux'
        ;

    my $yold = 'in the YOLD ' ~ $date.year + 1166;

    my $day_of_year0 = $date.day-of-year - 1;

    if $date.is-leap-year {
        if $date.month == 2 and $date.day == 29 {
            if $h {
                return {:holy("St. Tib's Day"), :yold($date.year + 1166), :season(''), :day(''), :weekday('') }
            }
            else {
                return "St. Tib's Day, $yold"
            }
        }
        --$day_of_year0 if $day_of_year0 >= 60; # Compensate for St. Tib's Day
    }

    my $weekday    = @days[    $day_of_year0 mod  5    ];
    my $season     = @seasons[ $day_of_year0 div 73    ];
    my $season_day =           $day_of_year0 mod 73 + 1;
    my $holy       = %holy{"$season $season_day"} ?? "Holyday of {%holy{"$season $season_day"}}: " !! '';

    $h ?? {:holy(%holy{"$season $season_day"} // ''), :season($season), :day($season_day), :weekday($weekday), :yold($date.year + 1166) }
       !! "$holy$weekday, the {ordinal($season_day)} day of $season $yold";
}

=begin pod

=head1 NAME

Date::Discordian - Convert Gregorian Dates to Discordian

=head1 SYNOPSIS

=begin code :lang<raku>

use Date::Discordian;

say discordian( '2020-03-24' ); # Pungenday, the tenth day of Discord in the YOLD 3186

say discordian( 2021, 8, 15 ); # Boomtime, the eighth day of Bureaucracy in the YOLD 3187

say discordian( Date.new("2005-01-31") ) # Sweetmorn, the thirty-first day of Chaos in the YOLD 3171

=end code

=head1 DESCRIPTION

Exports a single subroutine: C<discordian()>. When given a Gregorian date, returns
the text description or hash of date elementsof the corresponding Discordian date.

Will accept the same parameters a the internal Date class.  Will also accept the keyword today.

=begin code :lang<raku>

# Get textual date conversions
discordian( '2020-03-24' ); # formatted date string (ISO-8601)

discordian( 2020, 3, 24 ); # Integer year, month, day

discordian( Date.new("2020-03-24") ); # Native Date object

discordian( now ); # Instant

discordian( today ); # today

# Get a hash of date elements - supply a truthy second parameter to force hash return values
my $dd = discordian( '2020-03-24', :h );
say $dd.<weekday season day yold holy>

=end code

Most likely, some hash elements will be blank. If it isn't a holyday, :holy will
be blank. On St Tib's day, :weekday, :season and :day will be blank.

=head1 AUTHOR

Portions adapted from code from L<http://rosettacode.org/wiki/Discordian_date#Raku>

Other code by Steve Schulze

=head1 COPYRIGHT AND LICENSE

Copyright 2020 Steve Schulze (thundergnat)

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
