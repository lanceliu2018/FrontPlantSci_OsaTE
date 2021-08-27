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
my $out1="TE_excess_missing.txt";
my $out2="TE_excess_heterozygous.txt";
open my $infh1,"<","$in1";
open my $outfh1,">","$out1";
open my $outfh2,">","$out2";

while (my $line =<$infh1>) {
	my ($id,$num1,$num3)=(split /\s+/,$line)[0,1,3];
	my $ratio =$num3/$num1;
	if ($num1 <1500) {
		print $outfh1 $id,"\n";
		next
	}
	if ($ratio >=0.48) {
		print $outfh2 $id,"\n";
	}
}


close $infh1;
close $outfh1;
close $outfh2;


my $t2=localtime; print $outfh_log $t2,"\t";
my $delta=$t2-$t1; print $outfh_log $delta->pretty,"\n"; 
  
