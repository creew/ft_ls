# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eklompus <eklompus@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/26 10:55:03 by eklompus          #+#    #+#              #
#    Updated: 2019/10/07 12:53:21 by eklompus         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = ft_ls

CC = gcc

CC_FLAGS = -Wall -Wextra $(CF_ERROR)

CF_ERROR = -Werror

SRCS = ft_ls.c parse_args.c read_dir.c sub_funcs.c print_entry.c writeout.c \
		print_sub.c print_rights.c print_list.c time_sub.c callbacks.c \
		write_errors.c write_strings.c get_field_lengths.c get_vals.c \
		print_short.c getset_format.c get_lst_params.c print_long.c

SRCDIR = ./srcs
OBJDIR = ./objs

INCLUDES = ./includes \
			$(LIBFT_DIR)/includes

LIBFT_DIR = ./libft

HEADER_FILES = ./includes/ft_ls.h

ALL_OBJ = $(SRCS:%.c=%.o)

OBJS = $(addprefix $(OBJDIR)/, $(ALL_OBJ))

INCS = $(addprefix -I, $(INCLUDES))

LIB_DIR =	$(LIBFT_DIR)

LIB_DIR_FLAG = $(addprefix -L,$(LIB_DIR))

LIBS = 	ft

LIBS_FLAG = $(addprefix -l,$(LIBS))

COMP_LIBFT = make -C $(LIBFT_DIR)

all: $(NAME)

$(NAME): $(LIBFT_DIR)/libft.a $(OBJS)
	$(CC) $(FLAGS) $(OBJS) $(LIB_DIR_FLAG) $(LIBS_FLAG) -o $@

$(LIBFT_DIR)/libft.a: libft

libft:
	$(COMP_LIBFT)

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(HEADER_FILES) | $(OBJDIR)
	$(CC) $(CC_FLAGS) $(INCS) -c $< -o $@

clean:
	rm -rf $(OBJDIR)
	$(COMP_LIBFT) clean

fclean: clean
	rm -rf $(NAME)
	$(COMP_LIBFT) fclean

re: fclean all

.PHONY: libft clean fclean all re
