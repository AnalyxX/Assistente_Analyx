#!/bin/bash
#
# Script de assistente de instalação
#

# Cores
VERDE="\033[1;32m"
VERMELHO="\033[1;31m"
RESET="\033[0m"
CIANO="\033[1;36m"
AMARELO="\033[1;33m"

# Formatação de fonte
NEGRITO="\033[1m"
ITALICO="\033[3m"
RESET_FONTE="\033[0m"

echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${VERDE}Iniciando aplicação${RESET_FONTE}"

java -jar /home/ubuntu/Desktop/analyx-source-gui-1.0-SNAPSHOT-jar-with-dependencies.jar