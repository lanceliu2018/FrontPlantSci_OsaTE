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



my $in1="all.sam_sorted_pools_revised_lt0.9_sorted_pairs_selected.txt";
my $in2="outcome_all_ALL.txt_sorted_statistic_2_subALL_ALL_selected_addinfo_singleton.txt";
my $out1="outcome_all_ALL.txt_sorted_statistic_2_subALL_ALL_selected_addinfo_singleton_pairs.txt";
my $out2="outcome_all_ALL.txt_sorted_statistic_2_subALL_ALL_selected_addinfo_singleton_SingleEnd.txt";
open my $infh1,"<","$in1";
open my $infh2,"<","$in2";
open my $outfh1,">","$out1";
open my $outfh2,">","$out2";
my %h1;
while (my $line =<$infh1>) {
	$line =~s/\s+$//;
	my ($id1,$id2)=(split /\s+/,$line)[0,1];
	$h1 {$id1}++;
	$h1 {$id2}++;
}
while (my $line =<$infh2>) {
	my ($id)=(split /\s+/,$line)[0];
	if ($h1{$id}) {
		print $outfh1 $line;
	}else {
		print $outfh2 $line;
	}
}



close $infh1;
close $infh2;
close $outfh1;
close $outfh2;






my $t2=localtime; print $outfh_log $t2,"\t";
my $delta=$t2-$t1; print $outfh_log $delta->pretty,"\n"; 
  
