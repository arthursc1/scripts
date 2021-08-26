#!/bin/bash
#Script para buscar um valor dentro de arquivos jar a partir do diretório atual

newline=$'\n'
# Armazena o valor que quer buscar
STR_BUSCA=$1
# Armazena o diretório
STR_DIR=$2
echo "Procurando por: [$STR_BUSCA] a partir do diretório $STR_DIR $newline"

for i in `find $STR_DIR -name "*.jar"`
  do
    STR_ARQ=${i}
    STR_POM=""
    for j in `unzip -p -q $i | grep -A 1 -I $STR_BUSCA `
      do
        if [[ $STR_ARQ == $i ]] ; then
          STR_POM+=${j}${newline}
        fi
      done

      if [[ $STR_POM != "" ]] ; then
        echo "Arquivo: $STR_ARQ"
        echo "$STR_POM"
      fi
  done

