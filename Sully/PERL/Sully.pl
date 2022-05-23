#!/bin/perl

$code='#!/bin/perl%1$c%1$c$code=%2$c%5$s%2$c;%1$c%1$c$i = %3$d;%1$c$j = %4$d;%1$cif ($i <= 0) {%1$c	exit;%1$c} elsif (!$j) {%1$c	$i--;%1$c}%1$c$filename = "Sully_$i.pl";%1$copen(FILE, ">$filename") or exit;%1$cchmod 0755, $filename;%1$cprintf FILE $code, 10, 39, $i, !$i, $code;%1$cclose(FILE);%1$csystem("./Sully_$i.pl");%1$c';

$i = 5;
$j = 1;
if ($i <= 0) {
	exit;
} elsif (!$j) {
	$i--;
}
$filename = "Sully_$i.pl";
open(FILE, ">$filename") or exit;
chmod 0755, $filename;
printf FILE $code, 10, 39, $i, !$i, $code;
close(FILE);
system("./Sully_$i.pl");
