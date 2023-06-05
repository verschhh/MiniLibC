##
## EPITECH PROJECT, 2021
## makefile
## File description:
## i
##

SRC	=	strlen.asm	\
		strchr.asm	\
		strrchr.asm	\
		memset.asm	\
		memcpy.asm	\
		memmove.asm	\
		strcmp.asm	\
		strncmp.asm	\
		strcasecmp.asm	\
		strstr.asm	\
		strpbrk.asm	\
		strcspn.asm	\

SRCT	=	tests/test_strlen.c	\
		tests/init_test_strlen.c	\

OBJ	=	$(SRC:.asm=.o)

OBJT	=	$(SRCT:.c=.o)

NAME_LIB	=	libasm.so

DOTO	=	*.o

LDFLAGS	=	-shared

INCLUDE	=	-I include/

RM	=	rm -f

RED =	\033[0;31m

GREEN =	\033[0;32m
YELLOW =	\033[0;33m
RESET =	\033[0m

all:	$(NAME_LIB)

$(NAME_LIB):	$(OBJ)
	ld -fPIC -shared -o $(NAME_LIB) $(OBJ)
	@echo -e "$(GREEN)			COMPILATION DONE $(RESET)"

tests_run: $(OBJ) $(OBJT)
	$(CC) -o unit_tests $(OBJ) $(OBJT) $(CPPFLAGS) $(INCLUDE) -L --coverage -lcriterion
	@echo -e "$(YELLOW)			TESTING DONE $(RESET)"

try:	$(OBJ)
		ld -fPIC -shared -o $(NAME_LIB) $(OBJ)
		$(CC) -fPIC -c main.c
		$(CC) main.o $(OBJ) $(CPPFLAGS) $(INCLUDE)

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME_LIB)
	$(RM) $(DOTO)
	$(RM) unit_tests
	$(RM) *.gcda
	$(RM) *.gcno
	$(RM) *.gcov
	$(RM) vgcore.*
	$(RM) a.out
	@echo -e "$(RED)			CLEAN DONE $(RESET)"

re: fclean all

%.o: %.asm
		nasm -f elf64 $< -o $@