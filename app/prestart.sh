#!/bin/bash
set -e

# TODO: check if content.tar.gz exists
# if [[ -z content.tar.gz ]]; then
#     echo content.tar.gz exists
# fi

mkdir -p content

# check that encyption key is provided
if [ -z "$KEY" ]; then
    echo "content encryption key not provided. try running again with -e KEY=<passphrase>"
    exit 1
fi

# decrypt and untar content
openssl enc -d -aes256 -k $KEY -in content.tar.gz | tar xz -C content
rm content.tar.gz

# zip up contents for download
zip -r content.zip content
mv content.zip public/download/content.zip

node app.js