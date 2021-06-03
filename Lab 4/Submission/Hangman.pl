#!usr/local/bin/perl

sub getRandomElement(){
    my $randomIndex = rand($#sample) % ($#sample + 1);
    my $word = $sample[$randomIndex];
    my @word = split('', $word);
    return @word;
}

sub initGuess(){
    for ($i = 0; $i <= $#word; $i++){
        push @wordGuessed, '_';
    }
}

sub isPresent(@arr, $val){
    
}

sub updateGuess(){
    for ($i = 0; $i <= $#lettersUsed; $i++){
        if ($guess eq $lettersUsed[$i]){
            return 0;
        }
    }
    push @lettersUsed, $guess;
    my $existsInWord = 1;
    for ($i = 0; $i < $lenWord; $i++){
        if ($word[$i] eq $guess){
            $wordGuessed[$i] = $guess;
            $existsInWord = 2;
            $numGuessed++;
        }
    }
    return $existsInWord;
}

@sample = ("computer","radio","calculator","teacher","bureau","police","geometry","president","subject","country","enviroment","classroom","animals","province","month","politics","puzzle","instrument","kitchen","language","vampire","ghost","solution","service","software","virus25","security","phonenumber","expert","website","agreement","support","compatibility","advanced","search","triathlon","immediately","encyclopedia","endurance","distance","nature","history","organization","international","championship","government","popularity","thousand","feature","wetsuit","fitness","legendary","variation","equal","approximately","segment","priority","physics","branche","science","mathematics","lightning","dispersion","accelerator","detector","terminology","design","operation","foundation","application","prediction","reference","measurement","concept","perspective","overview","position","airplane","symmetry","dimension","toxic","algebra","illustration","classic","verification","citation","unusual","resource","analysis","license","comedy","screenplay","production","release","emphasis","director","trademark","vehicle","aircraft","experiment");

sub Play(){
    @word = getRandomElement();
    $lenWord = $#word + 1;

    @wordGuessed = ();
    initGuess();

    @lettersUsed = ();

    $numGuessed = 0;
    $hasFinished = 0;
    $guessesLeft = 6;
    @bodyParts = ('O', '|', '\\', '/', '/', '\\');
    @bodyPartsHanged = (' ', ' ', ' ', ' ', ' ', ' ');

    while ($hasFinished == 0){
        $validInput = 0;
        while ($validInput == 0){
            print "  _ _  \n |   | \n |   ".$bodyPartsHanged[0]." \n";
            print " |  ".$bodyPartsHanged[2].$bodyPartsHanged[1].$bodyPartsHanged[3]." Here is your word: @wordGuessed\n";
            print " |   ".$bodyPartsHanged[1]."  Guesses so far: [@lettersUsed]\n";
            print " |  ".$bodyPartsHanged[4]." ".$bodyPartsHanged[5]."\n_|_    \n\n";
            print "Make a guess: ";
            $guess = <STDIN>;
            $guess = lc substr($guess, 0, 1);
            if ($guess eq "\n" || $guess eq " "){
                print "Invalid Input ! Input should be a single alpha-numeric character\n";
            }
            else{
                $validInput = 1;
            }
            print "\n";
        }
        $case = updateGuess();
        if ($case eq 0){
            print "You have already used this guess\n";
        }
        elsif ($case eq 1){
            print "Wrong Guess !\n\n";
            $bodyPartsHanged[6 - $guessesLeft] = $bodyParts[6 - $guessesLeft];
            $guessesLeft--;
        }
        else{
            print "Good Guess !\n\n";
        }
        if ($numGuessed == $lenWord || $guessesLeft == 0){
            $hasFinished = 1;
        }
    }
    if ($guessesLeft > 0){
        print "You guessed it right, the word was: ";
    }
    else{
        print "  _ _  \n |   | \n |   ".$bodyPartsHanged[0]." \n";
        print " |  ".$bodyPartsHanged[2].$bodyPartsHanged[1].$bodyPartsHanged[3]."\n";
        print " |   ".$bodyPartsHanged[1]."  \n";
        print " |  ".$bodyPartsHanged[4]." ".$bodyPartsHanged[5]."\n_|_    \n\n";
        print "Better luck next time, the correct word was: ";
    }
    print @word;
    print "\n-----------\n";
}

$play = 1;

while ($play == 1){
    Play();
    print "\n";
    $isCorrect = 0;
    while ($isCorrect == 0){
        print "Do you want to play again? (Y/N): ";
        $choice = <STDIN>;
        $choice = uc substr($choice, 0, 1);
        if ($choice eq 'N'){
            $isCorrect = 1;
            $play = 0;
        }
        elsif ($choice eq 'Y'){
            $isCorrect = 1;
        }
        else{
            print "\nInvalid choice. ";
        }
    }
}