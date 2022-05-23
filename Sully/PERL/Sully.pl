#!/bin/perl

$code='#!/bin/perl%1$c%1$c$code=%2$c%4$s%2$c;%1$c%1$c$i = %3$d;%1$cif ($i <= 0) {%1$c	exit;%1$c}%1$cfor(; $i >= 0; $i--){%1$c	$filename = "Sully_$i.pl";%1$c	open(FILE, ">$filename") or next;%1$c	chmod 0755, $filename;%1$c	printf FILE $code, 10, 39, $i, $code;%1$c	close(FILE);%1$c}%1$c';

$i = 5;
if ($i <= 0) {
	exit;
}
for(; $i >= 0; $i--){
	$filename = "Sully_$i.pl";
	open(FILE, ">$filename") or next;
	chmod 0755, $filename;
	printf FILE $code, 10, 39, $i, $code;
	close(FILE);
}
