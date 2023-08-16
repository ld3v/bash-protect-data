#!/bin/bash

source ./log.sh;

function support_read () {
   _ACTION "Read encrypted content";
  echo "    - After generate an encrypted file, to read it, run the command:";
  echo -e "    - ${YELLOW}$0 read ./my-private-data.encrypted${RESET}";
  echo "    - Enter the password, and it'll show you its content if your password is TRUE";
  echo;
}

function get_decrypt_content () {
  password="";
  if [ -z "$2" ]
  then
    read -s -p "[=] - Enter password: " password;
  else
    password="$2";
  fi

  decrypted_content=$(openssl enc -d -aes-256-cbc -pbkdf2 -iter 1000000 -in "$1" -k "$password");
  echo $decrypted_content;
}

function decrypt_content () {
  _ACTION "Get decrypted data";
  content=$(get_decrypt_content $1);
  echo;
  _RESULT "Decrypted content:" $content;
}