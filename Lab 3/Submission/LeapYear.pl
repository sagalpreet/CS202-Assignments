sub isLeap{
    my $year = $_[0];
    my $ans = 0;
    if ($year % 400 == 0){
        $ans = 1;
    }
    elsif (($year % 4 == 0) && ($year % 100 != 0)){
        $ans = 1;
    }
    return $ans;
}

$year = <STDIN>;
$year = substr($year, 0, -1);

if (isLeap($year) != 0){
    print "$year is a leap year\n";
}
else{
    print "$year is not a leap year\n";
}