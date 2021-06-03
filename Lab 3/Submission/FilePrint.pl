#!usr/local/bin/perl

$len = $#ARGV + 1;

if ($len < 1){
    print "Error! No file name detected\n";
}
else{
    open($FILE, "<", $ARGV[0]);
    $s = <$FILE>;
    while($s ne ""){
        print $s;
        $s = <$FILE>;
    }
}