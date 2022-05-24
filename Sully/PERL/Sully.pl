#!/bin/perl

$code='#!/bin/perl%1$c%1$c$code=%2$c%4$s%2$c;%1$c%1$c$i = %3$d;%1$cif ($i <= 0) {%1$c	exit;%1$c} elsif ($ENV{CHILD}) {%1$c	$i--;%1$c}%1$c$filename = "Sully_$i.pl";%1$copen(FILE, ">$filename") or exit;%1$cchmod 0755, $filename;%1$cprintf FILE $code, 10, 39, $i, $code;%1$cclose(FILE);%1$c$ENV{CHILD} = "CHILD";%1$cif ($i) {%1$c	system("./Sully_$i.pl");%1$c}%1$c';

$i = 5;
if ($i <= 0) {
	exit;
} elsif ($ENV{CHILD}) {
	$i--;
}
$filename = "Sully_$i.pl";
open(FILE, ">$filename") or exit;
chmod 0755, $filename;
printf FILE $code, 10, 39, $i, $code;
close(FILE);
$ENV{CHILD} = "CHILD";
if ($i) {
	system("./Sully_$i.pl");
}
