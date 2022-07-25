#!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use feature ":5.10";

# here the array contains 100 different words
my @words = ("computer", "radio", "calculator", "teacher", "bureau", "police", "geometry", "president", "subject", "country", 
"enviroment", "classroom", "animals", "province", "month", "politics", "puzzle", "instrument", "kitchen", "language","vampire",
"ghost", "solution", "service", "software", "virus25", "security", "phonenumber", "expert", "website", "agreement",
"support", "compatibility", "advanced", "search", "triathlon", "immediately", "encyclopedia", "endurance", "distance", 
"nature", "history", "organization", "international", "championship", "government", "popularity", "thousand", "feature",
"wetsuit", "fitness", "legendary", "variation", "equal", "approximately", "segment", "priority", "physics", "branche",
"science", "mathematics", "lightning", "dispersion", "accelerator", "detector", "terminology", "design", "operation", 
"foundation", "application", "prediction", "reference", "measurement", "concept", "perspective", "overview", 
"position", "airplane", "symmetry", "dimension", "toxic", "algebra", "illustration", "classic", "verification",  "citation", 
"unusual", "resource", "analysis", "license", "comedy","screenplay", "production", "release", "emphasis", "director", 
"trademark", "vehicle", "aircraft", "experiment");
my @guesses = ();
my $solved = 0;
my $number_of_tries = 0;

&main();

sub main {

	# it chooses a random word from above given 100 words
	my $word = @words [int(rand(100)) - 1];
	my $size = length($word);
	
	for (my $i=0; $i < $size; $i++) {
        $guesses [$i] = '_';
	}
	while (!$solved) {
        &hangmanDisplay();
        
        print"\n\nHere is your word:";
		print join(" ", @guesses);
		print "\n\nEnter a letter: ";
		my $guess = <>;
        chomp($guess); # remove newline
        &checkLetter($word, $guess);
         
		
        $solved = &checkWin($word);

        system $^O eq 'MSWin32' ? 'cls' : 'clear';
        
	}

    print join(" ", @guesses);
    print "\n\n yeah! you win the game\n"; # when player guesses all the letters correctly, player wins the game
    print "\n Thanks for playing the game";
}
sub hangmanDisplay() {
    given($number_of_tries) {
        when(0) {&hangman1Display();}
        when(1) {&hangman2Display();}
        when(2) {&hangman3Display();}
        when(3) {&hangman4Display();}
        when(4) {&hangman5Display();}
        when(5) {&hangman6Display();}
        when(6) {&hangman7Display();}
    }
}
sub checkLetter {
    my ($word, $guess) = @_;
    my $letterIndex = index($word, $guess);

    if ($letterIndex == -1) {
        print "Wrong!\n";
        $number_of_tries++;
    } else {
        for (my $i=0; $i < length($word); $i++) {
            my $c_letter = substr($word, $i, 1);
            if ($guess eq $guesses[$i]) {
                print "You already guessed $guess!\n";
            }
            if ($guess eq $c_letter) {
                $guesses [$i] = $c_letter;
            }
        }
    }
}
sub checkWin {
    my ($word) = @_;
    my $letter;
    for (my $i=0; $i< length($word); $i++) {
        $letter = substr($word, $i, 1);
        if ($letter ne $guesses [$i]) {
            return 0;
        }
    }
    return 1;
}
sub hangman1Display
{
	print "  -------\n";
	print "  |     |\n";
	print "  |\n";
	print "  |\n";
	print "  |\n";
	print "  |\n";
	print "  |\n";
	print "--|----\n";
	print "You have 6 guesses left";
}

sub hangman2Display
{
	print "  -------\n";
	print "  |     |\n";
	print "  |     o\n";
	print "  |\n";
	print "  |\n";
	print "  |\n";
	print "  |\n";
	print "--|----\n";
	print "You have 5 guesses left";
}

sub hangman3Display
{
	print "  -------\n";
	print "  |     |\n";
	print "  |     o\n";
	print "  |     |\n";
	print "  |\n";
	print "  |\n";
	print "  |\n";
	print "--|----\n";
	print "You have 4 guesses left";
}

sub hangman4Display
{
	print "  -------\n";
	print "  |     |\n";
	print "  |     o\n";
	print "  |    \\|\n";
	print "  |\n";
	print "  |\n";
	print "  |\n";
	print "--|----\n";
	print "You have 3 guesses left";
}

sub hangman5Display
{
	print "  -------\n";
	print "  |     |\n";
	print "  |     o\n";
	print "  |    \\|/\n";
	print "  |\n";
	print "  |\n";
	print "  |\n";
	print "--|----\n";
	print "You have 2 guesses left";
}

sub hangman6Display
{
	print "  -------\n";
	print "  |     |\n";
	print "  |     o\n";
	print "  |    \\|/\n";
	print "  |     /\n";
	print "  |\n";
	print "  |\n";
	print "--|----\n";
	print "You have 1 guess left";
}

sub hangman7Display
{
	print "  -------\n";
	print "  |     |\n";
	print "  |     x\n";
	print "  |    \\|/\n";
	print "  |     /\\\n";
	print "  |\n";
	print "  |\n";
	print "--|----\n";
    print "You lost! the game\n"; #when all 6 guesses finished, then player lose the game
    print "\n Thanks for playing the game";
    exit 0;
}
