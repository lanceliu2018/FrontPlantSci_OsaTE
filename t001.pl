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


my $in1="outcome_all_ALL.txt_sorted_statistic_2_subALL_ALL_selected.txt";
my $out1="outcome_all_ALL.txt_sorted_statistic_2_subALL_ALL_selected_addinfo.txt";
my $out2="outcome_all_ALL.txt_sorted_statistic_2_subALL_ALL_selected_statistics.txt";
open my $infh1,"<","$in1";
open my $outfh1,">","$out1";
open my $outfh2,">","$out2";

my ($num01,$num02)=(0,0);
while (my $line =<$infh1>) {
	$line =~s/\s+$//;
	my ($num1,$num3)=(split /\s+/,$line)[1,3];
	my $ratio =$num3/$num1;
	print $outfh1 $line,"\t",$ratio,"\n";
	if ($num1 <1500) {
		$num01 ++;
		next
	}
	if ($ratio >=0.48) {
		$num02 ++;
	}
}


print $outfh2 "Excess of missing calls(>1500)","\t",$num01,"\n";
print $outfh2 "Excess of heterozygous calls(>=0.48)","\t",$num02,"\n";

close $infh1;
close $outfh1;
close $outfh2;


my $t2=localtime; print $outfh_log $t2,"\t";
my $delta=$t2-$t1; print $outfh_log $delta->pretty,"\n"; 
  
