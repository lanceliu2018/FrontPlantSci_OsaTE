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



my $in1="TE_polymorphysism_flat_Version.1(containinggt0.9)_selected_addinfo_Pair.txt";
my $in2="all.sam_sorted_pools_revised_lt0.9_sorted_pairs_selected.txt";
my $out1="TE_polymorphysism_flat_Version.1(containinggt0.9)_selected_addinfo_Pair_sorted.txt";
open my $infh1,"<","$in1";
open my $infh2,"<","$in2";
open my $outfh1,">","$out1";
my %h1;
while (my $line =<$infh1>) {
	my ($id)=(split /\s+/,$line)[1];
	$h1{$id}=$line;
}
while (my $line =<$infh2>) {
	$line =~s/\s+$//;
	my ($id1,$id2)=(split /\s+/,$line)[0,1];
	print $outfh1 $h1{$id1},$h1{$id2};
}




close $infh1;
close $infh2;
close $outfh1;







my $t2=localtime; print $outfh_log $t2,"\t";
my $delta=$t2-$t1; print $outfh_log $delta->pretty,"\n"; 
  
