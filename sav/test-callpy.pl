#!/usr/bin/perl
use strict;
use warnings;
# use CGI;
# my $cgi = CGI->new;

system("python3", "./test-write.py") == 0 or die "Python script returned error $?";

# my $file = "temp.txt";
# 
# unless(open FILE, '>'.$file) {
#     die "\nUnable to create $file\n";
# }
# 
# print FILE "Hello";
# close FILE;

# print $cgi->header( -type => 'text/plain' );
# 
# print <<'END';
# cgi done
# END

print <<'END';
Status: 200
Content-type: text/plain
cgi end
END