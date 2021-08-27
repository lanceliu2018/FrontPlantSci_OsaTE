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



my $in1="TE_groups_K5_K9_K15_revised.txt";
my $in2="TE_polymorphysism_flat_Version.1(containinggt0.9)_selected.txt";
my $out1="TE_polymorphysism_flat_Version.1(containinggt0.9)_selected_addinfo.txt";
open my $infh1,"<","$in1";
open my $infh2,"<","$in2";
open my $outfh1,">","$out1";
my %h1;
while (my $line =<$infh1>) {
	$line =~s/\s+$//;
	my ($acc,$grp)=(split /\t+/,$line)[0,3];
	$h1{$acc}=$grp;
}
while (my $line =<$infh2>) {
	my ($acc)=(split /\s+/,$line)[1];
	print $outfh1 $h1{$acc},"\t",$line;
}

close $infh1;
close $infh2;
close $outfh1;



my $t2=localtime; print $outfh_log $t2,"\t";
my $delta=$t2-$t1; print $outfh_log $delta->pretty,"\n"; 
  
