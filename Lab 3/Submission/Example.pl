#!usr/local/bin/perl

$first = (a,b,c)[0];
print "$first\n";
($name,$age) = ('Raman',20);

%fruits = (
'apple' =>'red',
'banana'=>'yellow',
'grape' =>'black'
);
%fruits = ('apple','red','banana','yellow','grape','black');
print "colour of apple is $fruits{apple}\n";
$fruits{'orange'}='orange';

$mark = 40;
if ($mark>75){
    print "passed with distinction\n";
}
elsif ($mark<35){
    print "failed\n";
}else {
    print "passed\n";
}
#$a=11;
print "variable a is > 10\n" if ($a>10);

for ($i=0;$i<10;$i++){
    print "i=$i\n";
}
foreach $i (a,b,c) {
    print uc $i;
}
print "\n";
foreach $f (keys %fruits ) {
    print "Color of $f is $fruits{$f}\n" ;
}
$i=0;
while ($i<10){
    print "i=$i\n";
    $i++;
}

print "enter your name ";
$name=<STDIN>;
print "Welcome $name\n";

foreach (a,b,c){
    print uc;
}
print "\n";
foreach (1..10){
    print ;
}
print "\n";

$v1 = 10;
$v2 = 20;
print add($v1,$v2);
sub add {
    ($a,$b)=@_;
    return $a+$b;
}
print "\n";

$v1=10; $v2=30;
$v3=30;
$v3=add( $v1,$v2 );
sub add{
    my ($ix,$jx)=@_;
    print "inside add sub value of i=$ix j=$jx\n";
    print "inside add sub value of globals v1=$v1 v2=$v2 v3=$v3\n";
    return $ix+$jx;
}
print "Value of globals v1=$v1 v2=$v2 v3=$v3\n";
print "Value of variables inside sub i=$ix j=$jx\n";
for (my $i=0; $i<10; $i++) {
    print "inside for i=$i\n";
}
print "outside for i=$i\n";

use strict;
my $v1=10;
my $v2=20;
print add ($v1,$v2)."\n";
sub add {
    my ($a, $b)=@_;
    return $a+$b;
}

my $a=10;
my $ref_toa=\$a;
print "value of a using reference = $$ref_toa\nValue of using directly = $a\nReference of a = $ref_toa\n";

open(my $fh, "<", "data.txt");
my $line = <$fh>;
print $line;
close($fh);
open(my $fh, ">", "data.txt");
print $fh "new line";
close($fh);
open ( $fh, "<", "data.txt" );
open (my $fh1,">","udata.txt");
while ( $line = <$fh> ) {
print "line=$line";
print $fh1 uc($line);
}
close($fh);
close($fh1);
