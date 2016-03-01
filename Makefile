all: day01 day02 day03

%: %.hs
	ghc $^
