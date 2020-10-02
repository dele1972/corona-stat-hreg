#!/usr/bin/perl
use strict;
use warnings;
use POSIX qw(strftime);
use Cwd;
# --- get page

my $url = 'https://www.hannover.de/Leben-in-der-Region-Hannover/Verwaltungen-Kommunen/Die-Verwaltung-der-Region-Hannover/Region-Hannover/Aktuelle-Informationen-zum-Coronavirus-der-Region-Hannover';
my $html = qx{wget --quiet --output-document=- $url};
#my $html="test";

# write html
my $path = getcwd;
my $folder = "get-it--grabbed";
my $filename = strftime "get-it--%Y-%m-%dT%H.%M.%S.html", localtime;
my $full_out_path = $path . "/" . $folder;
my $full_out_filename = $full_out_path . "/" . $filename;

if (! -e $full_out_path) {
 mkdir($full_out_path) or die "Can't create get-it--grabbed:$!\n";
} 

open(FH, '>', $full_out_filename) or die $!;
print FH $html;
close(FH);

print <<'END';
Status: 200
Content-type: text/plain
cgi end
END