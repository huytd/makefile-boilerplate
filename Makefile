# Shameless copy paste from tj/luna project
# https://github.com/tj/luna/blob/master/Makefile

SRC = $(wildcard src/*.c)
OBJ = ${SRC:.c=.o}
OUT = demo

# Fallback to gcc if clang not available
CC = clang
clang = $(shell which clang 2> /dev/null)
ifeq (, $(clang))
	CC = gcc
endif

$(OUT): $(OBJ)
	@$(CC) $^ -o $@
	@printf "\e[33mLinking\e[90m %s\e[0m\n" $@
	@printf "\e[34mDone!\e[0m\n"

%.o: %.c
	@$(CC) -c $< -o $@
	@printf "\e[36mCompile\e[90m %s\e[0m\n" $@

clean:
	@rm -f $(OUT) $(OBJ)
	@printf "\e[34mAll clear!\e[0m\n"
