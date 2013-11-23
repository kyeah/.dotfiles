#!/usr/bin/perl
use v5.10;

use Time::HiRes qw(time);
use Time::HiRes qw/gettimeofday/;

sub restart {
    @processes = `ps aux | grep google-musicmanager`;

    my @ids;
    for ($i = 0; $i < @processes - 2; $i++) {
        $processes[$i] =~ /(\d+)/;
        push @ids, $1;
    }

    print "Processes\n";
    print "\t$_" foreach @processes;
    
    print "Killing IDS: ";
    print "$_ " foreach @ids;
    print "\n";

    `kill -9 $_` foreach @ids;
    open GMM, "-|", "google-musicmanager";
}

restart;
while ( sleep(120) ) {
    close GMM;
    restart;
}
        
print "exiting\n";
