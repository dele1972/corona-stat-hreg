#!/usr/bin/perl
use strict;
use warnings;
use POSIX qw(strftime);
use Cwd;

# --- LINKS
# download web page to string
# https://perlmaven.com/simple-way-to-fetch-many-web-pages
#
# DateTime - POSIX/strftime
# https://www.tutorialspoint.com/perl/perl_date_time.htm
#
# write to file
# https://www.perltutorial.org/perl-write-to-file/
#
# create dir if not exist
# https://www.tek-tips.com/viewthread.cfm?qid=1491600
#
# get current path
# https://perlmaven.com/current-working-directory

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
 mkdir($full_out_path) or die "Content-type: text/plain\r\n\r\nStatus: 400\r\nCan't create get-it--grabbed:$!\r\n" . $full_out_path;
} 

open(FH, '>', $full_out_filename) or die $!;
print FH $html;
close(FH);

print <<'END';
Content-type: text/plain

Status: 200
cgi end
END