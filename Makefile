all: day01 day02

%: %.hs
	ghc $^
