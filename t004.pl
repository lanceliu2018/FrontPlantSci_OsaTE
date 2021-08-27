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



my $in1="outcome_all_ALL.txt_sorted_statistic_2_subALL_ALL_selected_addinfo_singleton.txt";
my $in2="all.sam_sorted_pools_revised_lt0.9_sorted_pairs.txt";
my $out1="all.sam_sorted_pools_revised_lt0.9_sorted_pairs_selected.txt";
open my $infh1,"<","$in1";
open my $infh2,"<","$in2";
open my $outfh1,">","$out1";
my %h1;
while (my $line =<$infh1>) {
	my ($id)=(split /\s+/,$line)[0];
	$h1{$id}++;
}
while (my $line =<$infh2>) {
	$line =~s/\s+$//;
	my ($id1,$id2)=(split /\s+/,$line)[0,1];
	if ($h1{$id1} && $h1{$id2}) {
		print $outfh1 $line,"\n";
	}
}




close $infh1;
close $infh2;
close $outfh1;







my $t2=localtime; print $outfh_log $t2,"\t";
my $delta=$t2-$t1; print $outfh_log $delta->pretty,"\n"; 
  
