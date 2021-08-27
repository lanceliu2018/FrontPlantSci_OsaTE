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



my $in1="TE_polymorphysism_flat_Version.1(containinggt0.9)_selected_addinfo_Singleton.txt";
my $out1="TE_polymorphysism_flat_Version.1(containinggt0.9)_selected_addinfo_Singleton_retain.txt";
my $out2="TEs_low_confidence.txt";
open my $infh1,"<","$in1";
open my $outfh1,">","$out1";
open my $outfh2,">","$out2";


while (my $line =<$infh1>) {
	my ($num1)=(split /\s+/,$line)[3];
	if ($num1 >=3) {
		print $outfh1 $line;
	}else {
		print $outfh2 $line;
	}
}

close $infh1;
close $outfh1;
close $outfh2;



my $t2=localtime; print $outfh_log $t2,"\t";
my $delta=$t2-$t1; print $outfh_log $delta->pretty,"\n"; 
  
