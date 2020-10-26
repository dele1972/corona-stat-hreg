#!/usr/bin/perl
use strict;
use warnings;
use POSIX qw(strftime);
use Cwd;

print <<'END';
Status: 200
Content-type: text/html

<!doctype html>
<html lang="de">
<head>
<title>Corona Stats H-Reg</title>
</head>
<body>
<h1>Meine heruntergeladenen Corona Statistiken der Region Hannover</h1>
<ul>
END

# my $path = getcwd;
my @files = <./get-it--grabbed/*.html>;
my @filesProcessed = <../../.data-nogit/store-web-data/processed/*.html>;
my @filesDuplicates = <../../.data-nogit/store-web-data/processed/duplicate/*.html>;
my @filesErrors = <../../.data-nogit/store-web-data/processed/error/*.html>;

print "<h2>Unbearbeitet</h2>";
foreach my $file(@files){
    print "<li><a href='" . $file . "'>" . $file . "</a></li>"
}

print "<h2>Fehler</h2>";
foreach my $file(@filesErrors){
    print "<li><a href='" . $file . "'>" . $file . "</a></li>"
}

print "<h2>Duplikate</h2>";
foreach my $file(@filesDuplicates){
    print "<li><a href='" . $file . "'>" . $file . "</a></li>"
}

print "<h2>Bearbeitet</h2>";
foreach my $file(@filesProcessed){
    print "<li><a href='" . $file . "'>" . $file . "</a></li>"
}

print "</ul></body></html>";
