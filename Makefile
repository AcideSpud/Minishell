# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tapostin <tapostin@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/03 15:11:53 by tapostin          #+#    #+#              #
#    Updated: 2016/03/25 16:57:31 by tapostin         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
.PHONY: all, clean, fclean, re
SRC_PATH	= ./src/

SRC_MS	= 	main.c\

OBJ_PATH	= ./obj/
INC_PATH	= ./includes/

LIB_PATH	= ./libft/
LIB_NAME	= libft.a

MINI_S		= minishell
CC 			= gcc
CFLAGS		= -Werror -Wall -Wextra

OBJ_MS	= $(SRC_MS:.c=.o)

SRC = $(addprefix $(SRC_PATH), $(SRC_MS))
OBJ = $(addprefix $(OBJ_PATH), $(OBJ_MS))
LIB = $(addprefix $(LIB_PATH), $(LIB_NAME))
INC = ./includes/minishell.h

all: $(MINI_S)

$(MINI_S) : $(OBJ)
	@make -C $(LIB_PATH)
	@$(CC) $(CFLAGS) $(LIB) $(OBJ) -o $(MINI_S) 
	@echo "$(MINI_S) : executable file compiled successfully"

$(OBJ_PATH)%.o: $(SRC_PATH)%.c $(INC)
	@mkdir -p $(OBJ_PATH)
	@$(CC) $(CFLAGS) -I$(INC_PATH) -I$(LIB_PATH)/includes -o $@ -c $<

clean:
	@make -C $(LIB_PATH) clean
	@rm -f $(OBJ_MS)
	@rmdir $(OBJ_PATH) 2> /dev/null || echo '' > /dev/null
	@echo "$(NAME) : object files deleted successfully"

fclean: clean
	@rm -f $(LIB)
	@echo "$(LIB_NAME) : library file deleted succesfully"
	@rm -f $(MINI_S)
	@echo "$(MINI_S) : executable file deleted successfully"

re: fclean all
