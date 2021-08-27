#!/usr/bin/perl
use strict;
use warnings;
use autodie;
use Time::Piece;
use Time::Seconds;



my $filename_log=__FILE__;
$filename_log =~s/.pl/.logs/;
open my $outfh_log,">>","$filename_log";
my $t1=localtime; print $outfh_log $t1,"\t";



my $in1="TE_polymorphysism_flat_Version.1(containinggt0.9)_selected_addinfo_Pair_sorted.txt";
my $out1="TE_polymorphysism_flat_Version.1(containinggt0.9)_selected_addinfo_Pair_sorted_stat.txt";
open my $infh1,"<","$in1";
open my $outfh1,">","$out1";

while (my $line1 =<$infh1>) {
	my $line2 =<$infh1>;
	my ($acc1)=(split /\s+/,$line1)[2];
	my ($acc2)=(split /\s+/,$line2)[2];
	if ($acc1 ne $acc2) {
		print $outfh1 $line1,$line2;
	}	
}




close $infh1;
close $outfh1;







my $t2=localtime; print $outfh_log $t2,"\t";
my $delta=$t2-$t1; print $outfh_log $delta->pretty,"\n"; 
  
