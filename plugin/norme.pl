#!/usr/bin/perl

## Matching formats (everithing else is dropped)
#print STDERR "hello.c:45: warning: this is a warning!\n";
#print STDERR "titi.c:6:8:this is an error!\n";
## Non-matching formats
#print STDERR "\n";
#print STDERR "And this is nothing\n";

use 5.014;
use warnings;

#Basic error Handling and opening of the file

my $arg = $#ARGV + 1;
if ($arg != 1) {
  print "\nUsage: norme.pl file.c\n";
  exit;
}
my $filename = $ARGV[0];
open(my $fh, '<:encoding(UTF-8)', $filename)
  or die "Could not open file '$filename' $!";

# Header or code file ?
# Useless now, but may be useful for later
my $isHeader;
$filename =~ ".*\.h" ? $isHeader = 1 : $isHeader = undef;

#pushing lines to an array, easier for outputting lines i think
my @lines;
foreach(<$fh>){
  push(@lines, $_);
}

my $funcBegin = 0;
my $funcEnd = 0;
my $inFunc = 0;
for (my $i = 0; $i < @lines && !$funcEnd; $i++){
  if ($lines[$i] =~ "\\s*{\\s*"){
    if ($inFunc == 0){
      $funcBegin = $i + 1;
    }
    $inFunc += 1;
  }
  if ($lines[$i] =~ "\\s*}\\s*"){
    $inFunc -= 1;
    if ($inFunc == 0){
      $funcEnd = $i + 1;
    }
  }
  if (($funcEnd - $funcBegin) > 25){
    for ($i = $funcBegin + 25; $i < $funcEnd; $i++){
      print STDERR "$filename:$i:0:function over 25 lines (-5)\n";
    }
  }
}

# Battle plan
# for each line, check the collumn
# look on the line above, check if the function declaration is normed
# go to the corresponding closing brace, count the lines
# check if there is tabs between a type and the following word, except in parenthesis (casts)
# check spaces at both side of a binary operator
# check space after a comma
# check in the args if the struc type is followed by a star
# check forbidden keywords
