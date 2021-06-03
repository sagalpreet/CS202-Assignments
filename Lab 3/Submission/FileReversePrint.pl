#!usr/local/bin/perl

$len = $#ARGV + 1;

if ($len < 1){
    print "Error! No file name detected\n";
}
else{
    open($FILE, "<", $ARGV[0]);
    @list = ();
    $s = <$FILE>;
    while($s ne ""){
        push @list, $s;
        $s = <$FILE>;
    }
    $size = ++$#list;
    print "Number of lines in program = $size\n";
    while ($size >= 0){
        print $list[$size];
        $size--;
    }
}