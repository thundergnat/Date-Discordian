use v6;
use Test;
use Date::Discordian;

plan 15;

is( discordian( '2020-03-24' ), 'Pungenday, the tenth day of Discord in the YOLD 3186', 'takes a Date-ish string');
is( discordian( 2021, 8, 15 ), 'Boomtime, the eighth day of Bureaucracy in the YOLD 3187', 'takes Integer args');
is( discordian( Date.new("2005-01-31") ), 'Sweetmorn, the thirty-first day of Chaos in the YOLD 3171', 'takes a Date');

is( discordian( '2020-02-29' ), "St. Tib's Day, in the YOLD 3186", 'test some holy dates');
is( discordian( '2020-01-05' ), 'Holyday of Mungday: Setting Orange, the fifth day of Chaos in the YOLD 3186', 'test some holy dates');
is( discordian( '2020-02-19' ), 'Holyday of Chaoflux: Setting Orange, the fiftieth day of Chaos in the YOLD 3186', 'test some holy dates');
is( discordian( '2020-03-19' ), 'Holyday of Mojoday: Pungenday, the fifth day of Discord in the YOLD 3186', 'test some holy dates');
is( discordian( '2020-05-03' ), 'Holyday of Discoflux: Pungenday, the fiftieth day of Discord in the YOLD 3186', 'test some holy dates');
is( discordian( '2020-07-15' ), 'Holyday of Confuflux: Sweetmorn, the fiftieth day of Confusion in the YOLD 3186', 'test some holy dates');
is( discordian( '2020-08-12' ), 'Holyday of Zaraday: Prickle-Prickle, the fifth day of Bureaucracy in the YOLD 3186', 'test some holy dates');
is( discordian( '2020-09-26' ), 'Holyday of Bureflux: Prickle-Prickle, the fiftieth day of Bureaucracy in the YOLD 3186', 'test some holy dates');
is( discordian( '2020-10-24' ), 'Holyday of Maladay: Boomtime, the fifth day of The Aftermath in the YOLD 3186', 'test some holy dates');
is( discordian( '2020-12-08' ), 'Holyday of Afflux: Boomtime, the fiftieth day of The Aftermath in the YOLD 3186', 'test some holy dates');

my $dd = discordian( '2020-03-24' , :h );

is( $dd<weekday season day yold holy>, 'Pungenday Discord 10 3186 ', 'test hash return');

is(discordian( '2020-02-29', :h )<yold holy>, "3186 St. Tib's Day", 'test St Tib\'s hash return');

done-testing;
