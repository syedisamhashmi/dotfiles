#!/bin/bash

# USAGE - type `profile` to open zshrc profile in VS Code
alias profile='code ~/.zshrc'

# USAGE - type `tabname ["desired_name"]` to set the terminal tab's name
alias tabname=osx_tabname

# USAGE - type `newtab ["desired_name"] ["command to run"]` to open a new terminal tab, set its name, and run a command
alias newtab=osx_newtab

# USAGE - type `newtab ["desired_name"] ["command to run"]` to open a new terminal tab, set its name, and run a command
alias random=osx_random

# USAGE - type `sendsql "query" ` to run a query against localhost sql server.
# ASSUMES ENV_VARS EXIST. CHECK `utils.sh` for more information
alias send_sql=osx_send_sql_env_vars