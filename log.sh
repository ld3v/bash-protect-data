#!/bin/bash

# Color for echo commands
RED='\033[0;31m';
GREEN='\033[0;32m';
YELLOW='\033[0;33m';
BLUE='\033[0;34m';
MAGENTA='\033[0;35m';
CYAN='\033[0;36m';
WHITE='\033[0;37m';

BOLD='\033[1m'
UNDERLINE='\033[4m'

RESET='\033[0m';

function _ERROR () {
  echo -e "${RED}[!] - $1${RESET}";
}
function _INFO () {
  echo -e "${BLUE}[i] - $1${RESET}";
}
function _ACTION () {
  echo -e "${GREEN}[#] - ${BOLD}$1${RESET}";
}
function _RESULT () {
  _INFO $1;
  echo -e "${YELLOW}${BOLD}------------------------ DECRYPTED CONTENT ------------------------${RESET}";
  echo;
  echo -e "${CYAN}$2${RESET}";
  echo;
  echo -e "${YELLOW}${BOLD}===================================================================${RESET}";
}