#!/bin/bash
#
# Script de assistente de instalação do Java
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

echo -e "${CIANO}${NEGRITO}
                             _                
     /\                     | |               
    /  \     _ __     __ _  | |  _   _  __  __
   / /\ \   |  _  \  / _  | | | | | | | \ \/ /
  / ____ \  | | | | | (_| | | | | |_| |  >  < 
 /_/    \_\ |_| |_|  \__,_| |_|  \__, | /_/\_\ 
                                  __/ |       
                                 |___/ "

echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${VERDE}BEM-VINDO${RESET_FONTE}"
echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${RESET_FONTE}Serei seu assistente neste momento inicial com a Analyx"

sleep 3

echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${RESET_FONTE}Antes de tudo vou atualizar os pacotes instalados no seu sistema!!"

sleep 3
# sudo apt update && sudo apt upgrade

echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${VERDE}PACOTES ATUALIZADOS COM SUCESSO!! :D
${RESET_FONTE}${RESET}"
sleep 4

echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${RESET_FONTE}Vou verificar se existe o Java instalado em sua maquina. 
${AMARELO}${ITALICO}Espere um momento! :)${RESET}${RESET_FONTE}"

sleep 5

java -version #verifica versao atual do java
if [ $? = 0 ]; #se retorno for igual a 0
then #entao,
echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${VERDE}O JAVA ESTA INSTALADO EM SUA MÁQUINA!! :D${RESET_FONTE}${RESET}" #print no terminal
else #se nao,
        echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${RESET_FONTE}${VERMELHO}${ITALICO}${NEGRITO}O Java não esta instalado em sua máquina!!${RESET_FONTE}${RESET}" #print no terminal
        echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${RESET_FONTE}Deseja instalar o java em sua máquina? [S/n]" #print no terminal
        read resposta #variável que guarda resposta do usuário
        if [[  "$resposta" =~ ^[sS]$ ]]; #se retorno for igual a 0
        then #entao
		echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${RESET_FONTE}Ótimo vou iniciar a instalação. ${AMARELO}${ITALICO}Espere um momento! :)${RESET}${RESET_FONTE}"
		sleep 3
	        sudo apt install openjdk-17-jre -y #executa instalacao do java
		sleep 2
		echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${VERDE}INSTALAÇÃO REALIZADA COM SUCESSO :D${RESET_FONTE}${RESET}" 
		else
		 echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${RESET_FONTE}${AMARELO}${ITALICO}${NEGRITO}Tudo bem! , até a próxima ;)${RESET_FONTE}${RESET}"
		 sleep 2
		 exit 1
        fi #fecha o 2º if
fi #fecha o 1º if
sleep 2
echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${RESET_FONTE}Agora vou verificar se existe nossa aplicação em sua máquina!!"
sleep 4
# Define o nome do executável do projeto
project_exec="looca-api-1.0-SNAPSHOT-jar-with-dependencies.jar"

# Verifica se o executável do projeto existe
if which "$project_exec" >/dev/null; then
    echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${VERDE}Nossa aplicação já está instalada em sua máquina! :D${RESET_FONTE}${RESET}" 
else
	echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${RESET_FONTE}${VERMELHO}${ITALICO}${NEGRITO}Nossa aplicação não existe em sua máquina${RESET_FONTE}${RESET}" #print no terminal
    echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${RESET_FONTE}Deseja instalar a nossa aplicação em sua máquina? [S/n]" #print no terminal
    read resposta #variável que guarda resposta do usuário
	if [[ "$resposta" =~ ^[sS]$ ]];then
		echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${RESET_FONTE}Vou iniciar a instalação da solução Analyx em sua maquina!!. ${AMARELO}${ITALICO}Espere um momento enquanto faço a instalação :)${RESET}${RESET_FONTE}"
		sleep 2
		git clone https://github.com/AnalyxX/java.git #executa o clone onde esta o jar
		cd java #acessa o diretorio java
		cd looca-api #acessa o diretorio da api
		sudo apt-get update #atualizar os pacotes do sistema
		sudo apt-get install maven #instalar o Maven
		mvn install #baixar as dependências
		cd java #acessa o diretorio java
		cd looca-api #acessa o diretorio da api
		cd target #acesso ao target onde esta o .jar
		sudo chmod +x looca-api-1.0-SNAPSHOT-jar-with-dependencies.jar #atribui acesso ao arquivo para ser um executavel
		
		sleep 2
		echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${VERDE}INSTALAÇÃO REALIZADA COM SUCESSO :D${RESET_FONTE}${RESET}"
		echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${VERDE}${ITALICO}Analyx está sempre a sua disposição.${RESET_FONTE}${RESET}"
	else
		echo -e "${CIANO}${NEGRITO}[Assistente Analyx]${RESET}${RESET_FONTE}${AMARELO}${ITALICO}${NEGRITO}Tudo bem! , até a próxima ;)${RESET_FONTE}${RESET}"
		sleep 2
		exit 1
	fi
    
fi
