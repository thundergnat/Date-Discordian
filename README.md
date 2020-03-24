NAME
====

Date::Discordian - Convert Gregorian Dates to Discordian

[![Build Status](https://travis-ci.org/thundergnat/Date-Discordian.svg?branch=master)](https://travis-ci.org/thundergnat/Date-Discordian)

SYNOPSIS
========

```perl6
use Date::Discordian;

say discordian( '2020-03-24' ); # Pungenday, the tenth day of Discord in the YOLD 3186

say discordian( 2021, 8, 15 ); # Boomtime, the eighth day of Bureaucracy in the YOLD 3187

say discordian( Date.new("2005-01-31") ) # Sweetmorn, the thirty-first day of Chaos in the YOLD 3171
```

DESCRIPTION
===========

Exports a single subroutine: `discordian()`. When given a Gregorian date, returns the text description or hash of date elementsof the corresponding Discordian date.

Will accept the same parameters a the internal Date class.

```perl6
# Get textual date conversions
discordian( '2020-03-24' ); # formatted date string (ISO-8601)

discordian( 2020, 3, 24 ); # Integer year, month, day

discordian( Date.new("2020-03-24") ); # Native Date object

# Get a hash of date elements - supply a truthy value to force hash return values
my $dd = discordian( '2020-03-24', :h );
say $dd.<weekday season day yold holy>
```

Most likely, some hash elements will be blank. If it isn't a holyday, :holy will be blank. On St Tib's day, :weekday, :season and :day will be blank.

AUTHOR
======

Portions adapted from code from http://rosettacode.org/wiki/Discordian_date#Raku

Other code by Steve Schulze

COPYRIGHT AND LICENSE
=====================

Copyright 2020 Steve Schulze (thundergnat)

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

