#!/usr/bin/env bash

# MOSQ=$(mosquitto_sub -t "test/#" -h 192.168.68.114 -p 1884)
GREPME='"dev_eui":"70B3D57ED004E889"'
# mosquitto_sub -t "test/#" -h 192.168.68.114 -p 1884 | tee /tmp/hello.json
# password=$(< /etc/passwd)
# if grep -q root <<< "$password" ; then
#     echo root found
# elif grep -q nobody <<< "$password" ; then
#     echo nobody found
# fi

# cat /home/archaict/Vault/File/Univ/Thesis/dummy.json | grep -o '"dev_eui":"70B3D57ED004E889"' | sed 's/"dev_eui":"70B3D57ED004E889"/valid/g'
# cat /home/archaict/Vault/File/Univ/Thesis/dummy.json | grep -o '"dev_eui":"10B3D57ED004E889"' | sed 's/"dev_eui":"10B3D57ED004E889"/notvalid/g'

FILE=/home/archaict/Vault/File/Univ/Thesis/dummy.json
if grep -o $GREPME $FILE ; then
    echo valid
fi

# if grep -o $GREPME $FILE ; then

# (echo "hello there" | grep -q "AAA") && [ $? -eq 0 ] && echo "hi" || echo "bye"
