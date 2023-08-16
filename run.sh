#!/bin/bash
source ./log.sh;
source ./generate-encrypted.sh;
source ./read-encrypted.sh;
source ./add-content.sh;

# Main script
if [ $# -lt 2 ]; then
  _INFO "Usage:";
  echo "    - $0 <generate|read|add> <filename> [add_values]";
  echo "    - Ex: '$0 generate ./secret'";
  echo "          '$0 add ./secret-encrypted \"GITHUB_PRIVATE_KEY=ex@mpl3-k3y-f0r-g1thub-pr0j3ct\"";
  echo "    ===============";
  support_generate;
  support_read;
  support_add_content;
  echo "    ===============";
  echo;
  exit 1
fi

case "$1" in
  generate)
    generate_encrypt_file "$2";
    ;;
  read)
    decrypt_content "$2";
    ;;
  add)
    add_content_to_file "$2" "$3";
    ;;
  *)
    _ERROR "Invalid option. Use 'generate', 'read' or 'add'."
    exit 1
    ;;
esac