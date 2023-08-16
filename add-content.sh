#!/bin/bash

source ./log.sh;
source ./read-encrypted.sh;

function support_add_content () {
  _ACTION "Add new values to your file";
  echo "    - After generate an encrypted file, to add new values to it. Run this command:";
  echo -e "    - ${YELLOW}$0 add ./my-private-data.encrypted \"JUST_A_MESSAGE\"${RESET}";
  echo "    - Enter the password, and it'll add your content to the current encrypted file.";
  echo -e "    - ${YELLOW}${BOLD}Please NOTE THAT, we NOT use space (' '), or '\\' character in the message.${RESET}"
  echo;
}

function add_content_to_file () {
  _ACTION "Get decrypted data";
  read -s -p "[=] - Enter password: " password;
  echo;

  pre_content=$(get_decrypt_content $1 $password);

  # decrypted_content=$(openssl enc -d -aes-256-cbc -pbkdf2 -iter 1000000 -in "$1" -k "$password");
  new_value="$pre_content\n$2";
  _RESULT "Content to encrypt" $new_value;

  echo $new_value | openssl enc -aes-256-cbc -salt -pbkdf2 -iter 1000000 -out "$1" -k "$password"
}