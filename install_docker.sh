#!/bin/bash
#
# Script de assistente de instalação do Docker
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
   __   _  _   __   __  _  _ _  _     ___ _____ _  _ ____  __   ____ _  _ ____ ____ 
  /__\ ( \( ) /__\ (  )( \/ ( \/ )   / __(  _  ( \( (_  _)/__\ (_  _( \( ( ___(  _ \ 
 /(__)\ )  ( /(__)\ )(__\  / )  (   ( (__ )(_)( )  (  )( /(__)\ _)(_ )  ( )__) )   /
(__)(__(_)\_(__)(__(____(__)(_/\_)   \___(_____(_)\_)(__(__)(__(____(_)\_(____(_)\_)${RESET}${NEGRITO}"
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker
sudo docker pull mysql:5.7
sudo docker run -d -p 3306:3306 --name ContainerAnalyx -e "MYSQL_DATABASE=bd_analyx" -e "MYSQL_ROOT_PASSWORD=urubu100" mysql:5.7
docker cp /Desktop/Assistente_Analyx/script_bd.sql ContainerAnalyx:/
docker exec -it ContainerAnalyx mysql -u root -purubu100 bd_analyx < /script_bd.sql








