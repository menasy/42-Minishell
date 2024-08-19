# 42-Minishell

Minishell is a project included in the 42 school's curriculum. The goal of this project is to create a basic Unix shell from scratch, helping students understand shell commands, process management, and Unix system calls.

## Project Details

- **Program Name:** `minishell`
- **Files to Submit:** `Makefile`, `*.h`, `*.c`
- **Makefile Rules:** `NAME`, `all`, `clean`, `fclean`, `re`
- **Libft Usage:** Yes

## Features

Minishell supports the following features:

- **Basic Shell Functionality:**
  - Displays a prompt while waiting for a new command from the user.
  - Manages command history.
  - Finds and executes the correct executable file based on the PATH variable or using absolute/relative paths.

- **Redirections:**
  - `<` redirects input.
  - `>` redirects output.
  - `<<` reads input until a line containing the delimiter is found, but does not update the history.
  - `>>` redirects output in append mode.

- **Pipes:**
  - Handles pipes (`|`) by connecting the output of each command in the pipeline to the input of the next.

- **Quoting:**
  - Handles single quotes (`'`) and double quotes (`"`). Double quotes prevent the shell from interpreting metacharacters in the quoted sequence, except for the `$` (dollar sign) character.

- **Environment Variables & Special Variables:**
  - Expands environment variables prefixed with `$`.
  - Expands `$?` to the exit status of the most recently executed foreground pipeline.

- **User Interactions:**
  - `ctrl-C` displays a new prompt on a new line.
  - `ctrl-D` exits the shell.
  - `ctrl-\` does nothing.

- **Builtin Commands:**
  - `echo` - with the `-n` option.
  - `cd` - with only a relative or absolute path.
  - `pwd` - with no options.
  - `export` - with no options.
  - `unset` - with no options.
  - `env` - with no options or arguments.
  - `exit` - with no options.

## Folder Structure

- **BUILTIN:** Implementations of the builtin commands.
- **ERROR:** Error handling functions.
- **EXECUTOR:** Command execution logic.
- **GNL:** Line-by-line reading functionality.
- **INCLUDES:** Header files.
- **LEXER:** Functionality for tokenizing commands.
- **PARSER:** Command analysis and execution logic.
- **UTILS:** Utility functions and tools.
- **Makefile:** Rules for compiling the project.

## Installation Instructions

Clone the project to your computer:

```bash
git clone https://github.com/menasy/42-Minishell.git
cd minishell
```
## Build the Library

To compile the library:

```bash
make
```
## Usage
### Run The Project
```bash
./minishell
```


