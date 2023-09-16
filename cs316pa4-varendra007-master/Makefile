dev: 
	@echo "Varendra Maurya\n200010055@iitdh.ac.in"

compiler: main.cpp microParser.ypp microLexer.l
	@bison -d -o microParser.cpp microParser.ypp
	@flex microLexer.l
	@g++ lex.yy.c microParser.cpp main.cpp -o a.out

clean:
	@rm -f lex.yy.c microParser.cpp microParser.hpp a.out