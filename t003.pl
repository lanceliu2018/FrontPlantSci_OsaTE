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


my $in1="outcome_all_ALL.txt_sorted_statistic_2_subALL_ALL_selected_addinfo.txt";
my $out1="outcome_all_ALL.txt_sorted_statistic_2_subALL_ALL_selected_addinfo_singleton.txt";
open my $infh1,"<","$in1";
open my $outfh1,">","$out1";

while (my $line =<$infh1>) {
	my ($num1,$num2,$num3)=(split /\s+/,$line)[1,2,3];
	my $ratio =$num3/$num1;
	if ($num1 <=2700 || $num2 !=1 || $num3 >0 ||$ratio >=0.48) {next}
	print $outfh1 $line;
}


close $infh1;
close $outfh1;


my $t2=localtime; print $outfh_log $t2,"\t";
my $delta=$t2-$t1; print $outfh_log $delta->pretty,"\n"; 
  
