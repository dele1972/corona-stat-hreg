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
foreach my $file(@files){
    print "<li><a href='" . $file . "'>" . $file . "</a></li>"
}
print "</ul></body></html>";
