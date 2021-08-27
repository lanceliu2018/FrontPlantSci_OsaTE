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



my $in1="all.sam_sorted_pools_revised_lt0.9_sorted_pairs_remove_selected.txt";
my $in2="TEs_low_confidence.txt";
my $out1="TEs_locus_filted.txt";
open my $infh1,"<","$in1";
open my $infh2,"<","$in2";
open my $outfh1,">","$out1";

while (my $line =<$infh1>) {
	print $outfh1 $line;
}
while (my $line =<$infh2>) {
	my ($id)=(split /\s+/,$line)[1];
	print $outfh1 $id,"\n";
}




close $infh1;
close $infh2;
close $outfh1;







my $t2=localtime; print $outfh_log $t2,"\t";
my $delta=$t2-$t1; print $outfh_log $delta->pretty,"\n"; 
  
