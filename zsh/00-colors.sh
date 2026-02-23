#!/usr/bin/env zsh

C_DEFAULT=$'\e[39m'
C_BLACK=$'\e[30m'
C_RED=$'\e[31m'
C_GREEN=$'\e[32m'
C_YELLOW=$'\e[33m'
C_BLUE=$'\e[34m'
C_MAGENTA=$'\e[35m'
C_CYAN=$'\e[36m'
C_LIGHT_GRAY=$'\e[37m'
C_DARK_GRAY=$'\e[90m'
C_LIGHT_RED=$'\e[91m'
C_LIGHT_GREEN=$'\e[92m'
C_LIGHT_YELLOW=$'\e[93m'
C_LIGHT_BLUE=$'\e[94m'
C_LIGHT_MAGENTA=$'\e[95m'
C_LIGHT_CYAN=$'\e[96m'
C_WHITE=$'\e[97m'
C_DEFAULT_MASKED="%{$C_DEFAULT%}"
C_BLACK_MASKED="%{$C_BLACK%}"
C_RED_MASKED="%{$C_RED%}"
C_GREEN_MASKED="%{$C_GREEN%}"
C_YELLOW_MASKED="%{$C_YELLOW%}"
C_BLUE_MASKED="%{$C_BLUE%}"
C_MAGENTA_MASKED="%{$C_MAGENTA%}"
C_CYAN_MASKED="%{$C_CYAN%}"
C_LIGHT_GRAY_MASKED="%{$C_LIGHT_GRAY%}"
C_DARK_GRAY_MASKED="%{$C_DARK_GRAY%}"
C_LIGHT_RED_MASKED="%{$C_LIGHT_RED%}"
C_LIGHT_GREEN_MASKED="%{$C_LIGHT_GREEN%}"
C_LIGHT_YELLOW_MASKED="%{$C_LIGHT_YELLOW%}"
C_LIGHT_BLUE_MASKED="%{$C_LIGHT_BLUE%}"
C_LIGHT_MAGENTA_MASKED="%{$C_LIGHT_MAGENTA%}"
C_LIGHT_CYAN_MASKED="%{$C_LIGHT_CYAN%}"
C_WHITE_MASKED="%{$C_WHITE%}"
function colors() {
  printf '\033[39m39 \033[39mTest \033[39mDefault\n'
  printf '\033[39m30 \033[30mTest \033[39mBlack\n'
  printf '\033[39m31 \033[31mTest \033[39mRed\n'
  printf '\033[39m32 \033[32mTest \033[39mGreen\n'
  printf '\033[39m33 \033[33mTest \033[39mYellow\n'
  printf '\033[39m34 \033[34mTest \033[39mBlue\n'
  printf '\033[39m35 \033[35mTest \033[39mMagenta\n'
  printf '\033[39m36 \033[36mTest \033[39mCyan\n'
  printf '\033[39m37 \033[37mTest \033[39mLight gray\n'
  printf '\033[39m90 \033[90mTest \033[39mDark gray\n'
  printf '\033[39m91 \033[91mTest \033[39mLight red\n'
  printf '\033[39m92 \033[92mTest \033[39mLight green\n'
  printf '\033[39m93 \033[93mTest \033[39mLight yellow\n'
  printf '\033[39m94 \033[94mTest \033[39mLight blue\n'
  printf '\033[39m95 \033[95mTest \033[39mLight magenta\n'
  printf '\033[39m96 \033[96mTest \033[39mLight cyan\n'
  printf '\033[39m97 \033[97mTest \033[39mWhite\n'
}
