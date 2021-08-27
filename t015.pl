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



my $in1="TEs_locus_filted.txt";
my $in2="outcome_all_ALL.txt_sorted_statistic_2_subALL_ALL_selected_addinfo_singleton.txt";
my $out1="outcome_all_ALL.txt_sorted_statistic_2_subALL_ALL_selected_addinfo_singleton_retained.txt";
open my $infh1,"<","$in1";
open my $infh2,"<","$in2";
open my $outfh1,">","$out1";
my %h1;
while (my $line =<$infh1>) {
	$line =~s/\s+$//;
	$h1{$line}++;	
}
while (my $line =<$infh2>) {
	my ($id)=(split /\s+/,$line)[0];
	if ($h1{$id}) {next}
	print $outfh1 $line;
}




close $infh1;
close $infh2;
close $outfh1;







my $t2=localtime; print $outfh_log $t2,"\t";
my $delta=$t2-$t1; print $outfh_log $delta->pretty,"\n"; 
  
