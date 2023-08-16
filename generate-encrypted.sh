#!/bin/bash

source ./log.sh;

function support_generate () {
  _ACTION "Generate an encrypted file";
  echo "    - To generate an encrypted file, we need create a file, which has data readable.";
  echo -e "    - Example, my file has content like this: 'KEY=example-value' with filename is '${GREEN}my-private-data${RESET}'";
  echo -e "    - Run command ${YELLOW}$0 generate ./my-private-data${RESET}";
  echo -e "    - After run finished, it'll auto generate a new file with name ${GREEN}my-private-data${YELLOW}.encrypted${RESET} in current folder";
  echo;
}

function generate_encrypt_file () {
  read -s -p "[=] - Enter password to encrypt file's content: " password;
  echo;
  read -s -p "[=] - Re-enter password: " confirm_password;
  echo;

  if [ "$password" != "$confirm_password" ]; then
    _ERROR "Passwords do not match!"
    exit 1
  fi

  openssl enc -aes-256-cbc -salt -pbkdf2 -iter 1000000 -in "$1" -out "$1.encrypted" -k "$password" || echo "Something went wrong when trying to generate an encrypted file";
}

function encrypt_file () {
  _ACTION "Generate encrypted data";
  generate_encrypt_file $1;
  _INFO "Generated an encrypted file";
}