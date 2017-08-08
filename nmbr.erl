-module(nmbr).
-export([start/0]).

start() ->
	game(rand:uniform(100), guess(), 1).

game(Match, Guess, Tries) ->
	case guess() of
		Match -> io:format("Congratulations! You made it in ~p tries. ", [Tries])
		Guess when Guess < Match -> io:format("~p is too low. ", [Guess]), game(Match, tries(Tries));
		Guess when Guess > Match -> io:format("~p is too high. ", [Guess]), game(Match, tries(Tries))
	end.

guess() -> {ok, [Number]} = io:fread("Guess a number\n", "~d"), Number.

tries(Tries) -> Tries + 1.