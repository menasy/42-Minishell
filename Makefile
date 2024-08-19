NAME = minishell
SRCS =	utils/get_env.c minishell.c utils/signal.c parser/parser.c \
		parser/parser_utils.c parser/parser_clean.c error/error_utils.c \
		parser/quote_utils.c parser/quote_check.c parser/put_env.c \
		parser/put_env_utils.c parser/dolar_check_utils.c  lexer/add_cluster.c \
		error/error_utils_2.c  lexer/open_files.c  lexer/files_utils.c \
		lexer/arg_utils.c utils/route.c builtin/cd.c builtin/error.c \
		builtin/pwd.c  builtin/echo.c builtin/env.c builtin/export.c \
		builtin/unset.c  parser/united_dolar.c parser/redirect_right_parser.c \
		parser/redirect_left_parser.c parser/len_utils.c executor/exec.c \
		executor/exec_utils.c parser/char_control.c gnl/get_next_line.c \
		lexer/free_cluster.c lexer/heredoc.c parser/node_utils.c \
		parser/pipe_utils.c  builtin/exit.c parser/free_utils.c parser/put_tilde.c

OBJS = $(SRCS:.c=.o)
LIBFT_DIR = ./includes/libft
LIBFT = $(LIBFT_DIR)/libft.a
CC = gcc
READLINE_LIB_LOC = readline/lib
READLINE_INC_LOC = readline/include
CFLAGS = -g -Wall -Wextra -Werror -I $(READLINE_INC_LOC) -I $(LIBFT_DIR)/includes
LDFLAGS = -L$(READLINE_LIB_LOC) -I$(READLINE_INC_LOC) -lreadline -lhistory -lncurses -L$(LIBFT_DIR) -lft

READLINE_URL = https://ftp.gnu.org/gnu/readline/readline-8.2.tar.gz
READLINE_DIR = readline-8.2
READLINE_ARCHIVE = readline-8.2.tar.gz

all: $(READLINE_LIB_LOC)/libreadline.a $(NAME)

# Readline kütüphanesi kurulumu
$(READLINE_LIB_LOC)/libreadline.a: progress_bar.sh
	@clear
	@echo "\033[1;31mCompiling readline please wait...\n\033[0m"
	@echo "\033[1;30mDownloading readline...\033[0m"
	@bash progress_bar.sh
	@curl -s -O $(READLINE_URL)
	@echo "\033[1;30mRedline file extracting...\033[0m"
	@tar -xvf $(READLINE_ARCHIVE) 2>&1 | bash progress_bar.sh & wait
	@echo "\033[1;30mReadline extracted!\033[0m"
	@cd $(READLINE_DIR) && ./configure --prefix=${PWD}/readline 2>&1 | awk '{printf ""; fflush()}' & bash progress_bar.sh & wait
	@echo "\033[1;30mReadline configuration!\033[0m"
	@cd $(READLINE_DIR) && make install 2>&1 | awk '{printf ""; fflush()}' & bash progress_bar.sh & wait
	@wait
	@echo "\n\033[0;42mReadline installation completed!\033[0m"
	@rm -rf $(READLINE_ARCHIVE) $(READLINE_DIR)

$(NAME): $(LIBFT) $(OBJS)
	@$(CC) $(OBJS) $(LIBFT) -o $(NAME) $(LDFLAGS)
	@echo "\033[33m              _       _      __         ____"
	@echo "\033[33m   ____ ___  (_)___  (_)____/ /_  ___  / / /"
	@echo "\033[33m  / __ \`__ \/ / __ \/ / ___/ __ \/ _ \/ / / "
	@echo "\033[34m / / / / / / / / / / (__  ) / / /  __/ / /  "
	@echo "\033[34m/_/ /_/ /_/_/_/ /_/_/____/_/ /_/\___/_/_/   "
	@echo "\033[0m"
	@echo "\033[4;33mMinishell is ready!\033[0m"

$(LIBFT):
	@make -C $(LIBFT_DIR) -s

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@make -C $(LIBFT_DIR) clean -s
	@rm -rf $(OBJS)
	@echo "\033[4;33mObject files removed!\033[0m"

fclean: clean
	@make -C $(LIBFT_DIR) fclean -s
	@rm -rf $(NAME)
	@rm -rf readline readline-8.2 readline-8.2.tar.gz
	@echo "\033[4;33mProgram is removed!\033[0m"

re: fclean all

.PHONY: all clean fclean re
