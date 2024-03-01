SRC	=			fac.asm

CC =			ld

ASM =			nasm

RM =			rm -f

NAME =			libasm.so

OBJ =			$(SRC:.asm=.o)

CFLAGS	=		-shared -fPIC
ASMFLAGS =		-f elf64

%.o: %.asm
			$(ASM) -o $@ $< $(ASMFLAGS) -I include

all:			$(NAME)


$(NAME):		$(OBJ)
			$(CC) $(CFLAGS) -o $(NAME) $(OBJ)

clean:
			$(RM) $(OBJ)

fclean:			clean
			$(RM) $(NAME)

re:			fclean all

.PHONY:			all clean fclean re