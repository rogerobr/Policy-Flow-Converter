#POLICY-FLOW CONVERTER
 #Versao: 2.0

  printf "######################POLICY-FLOW CONVERTER######################\n"
  echo Informe o nome do arquivo de entrada:
  read arq_entrada;
  echo Informe o nome do arquivo de saida OpenFlow:
  read arq_saida;
  echo Informe o nome do arquivo de saida OVS:
  read arq_saida_ovs;
  echo Informe o nome do dispositivo Bridge OVS:
  read bridge_ovs;

 tr [:upper:] [:lower:] < $arq_entrada > temp.txt
 cp temp.txt $arq_saida
 rm -rf temp.txt

  printf "###Iniciando conversao...###\n"


#######################substituicao campos string de protocolos########################

 substituir_proto_string=( "ip protocol hopopt" "ip protocol icmp" "ip protocol igmp" "ip protocol ggp" "ip protocol ipv4" "ip protocol st" "ip protocol tcp" "ip protocol cbt" "ip protocol egp" "ip protocol igp"
					 "ip protocol bbn-rcc-mon" "ip protocol nvp-ii" "ip protocol pup" "ip protocol argus" "ip protocol emcon" "ip protocol xnet" "ip protocol chaos" "ip protocol udp" "ip protocol mux" "ip protocol dcn-meas"
					"ip protocol hmp" "ip protocol prm" "ip protocol xns-idp" "ip protocol trunk-1" "ip protocol trunk-2" "ip protocol leaf-1" "ip protocol leaf-2" "ip protocol rdp" "ip protocol irtp" "ip protocol iso-tp4" "ip protocol netblt"
					"ip protocol mfe-nsp" "ip protocol merit-inp" "ip protocol dccp" "ip protocol 3pc" "ip protocol idpr" "ip protocol xtp" "ip protocol ddp" "ip protocol idpr-cmtp" "ip protocol tp++" "ip protocol il" "ip protocol ipv6"
					"ip protocol sdrp" "ip protocol ipv6-route" "ip protocol ipv6-frag" "ip protocol idrp" "ip protocol rsvp" "ip protocol gre" "ip protocol dsr" "ip protocol bna" "ip protocol esp" "ip protocol ah" "ip protocol i-nlsp"
					"ip protocol swipe" "ip protocol narp" "ip protocol mobile" "ip protocol tlsp" "ip protocol skip" "ip protocol ipv6-icmp" "ip protocol ipv6-nonxt" "ip protocol ipv6-opts" "ip protocol cftp" "ip protocol sat-expak" "ip protocol kryptolan"
	    			"ip protocol rvd" "ip protocol ippc" "ip protocol sat-mon" "ip protocol visa" "ip protocol ipcv" "ip protocol cpnx" "ip protocol cphb" "ip protocol wsn" "ip protocol pvp" "ip protocol br-sat-mon" "ip protocol sun-nd"
					"ip protocol wb-mon" "ip protocol wb-expak" "ip protocol iso-ip" "ip protocol vmtp" "ip protocol secure-vmtp" "ip protocol vines" "ip protocol ttp" "ip protocol iptm" "ip protocol nsfnet-igp" "ip protocol dgp"
					"ip protocol tcf" "ip protocol eigrp" "ip protocol ospfigp" "ip protocol sprite-rpc" "ip protocol larp" "ip protocol mtp" "ip protocol ax.25" "ip protocol ipip" "ip protocol micp" "ip protocol scc-sp"
					"ip protocol etherip" "ip protocol encap" "ip protocol gmtp" "ip protocol ifmp" "ip protocol pnni" "ip protocol pim" "ip protocol aris" "ip protocol scps" "ip protocol qnx" "ip protocol a/n"
					"ip protocol ipcomp" "ip protocol snp" "ip protocol compaq-peer" "ip protocol ipx-in-ip" "ip protocol vrrp" "ip protocol pgm" "ip protocol l2tp" "ip protocol ddxcc" "ip protocol iatp" "ip protocol stp" "ip protocol srp"
					"ip protocol uti" "ip protocol smp" "ip protocol sm" "ip protocol ptp" "ip protocol isis" "ip protocol fire" "ip protocol crtp" "ip protocol crudp" "ip protocol sscopmce" "ip protocol iplt" 
					"ip protocol sps" "ip protocol pipe" "ip protocol sctp" "ip protocol fc" "ip protocol rsvp-e2e-ignore" "ip protocol mobility header" "ip protocol udplite" "ip protocol mpls-in-ip" "ip protocol manet" "ip protocol hip"
					"ip protocol shim6" "ip protocol wesp" "ip protocol rohc" "ip protocol ethernet"
)
 
 substituto_proto_string=( "oxm_of_ip_proto 0" "oxm_of_ip_proto 1" "oxm_of_ip_proto 2" "oxm_of_ip_proto 3" "oxm_of_ip_proto 4" "oxm_of_ip_proto 5" "oxm_of_ip_proto 6" "oxm_of_ip_proto 7" "oxm_of_ip_proto 8" "oxm_of_ip_proto 9"
 					"oxm_of_ip_proto 10" "oxm_of_ip_proto 11" "oxm_of_ip_proto 12" "oxm_of_ip_proto 13" "oxm_of_ip_proto 14" "oxm_of_ip_proto 15" "oxm_of_ip_proto 16" "oxm_of_ip_proto 17" "oxm_of_ip_proto 18" "oxm_of_ip_proto 19"
					"oxm_of_ip_proto 20" "oxm_of_ip_proto 21" "oxm_of_ip_proto 22" "oxm_of_ip_proto 23" "oxm_of_ip_proto 24" "oxm_of_ip_proto 25" "oxm_of_ip_proto 26" "oxm_of_ip_proto 27" "oxm_of_ip_proto 28" "oxm_of_ip_proto 29"
					"oxm_of_ip_proto 30" "oxm_of_ip_proto 31" "oxm_of_ip_proto 32" "oxm_of_ip_proto 33" "oxm_of_ip_proto 34" "oxm_of_ip_proto 35" "oxm_of_ip_proto 36" "oxm_of_ip_proto 37" "oxm_of_ip_proto 38" "oxm_of_ip_proto 39"
					"oxm_of_ip_proto 40" "oxm_of_ip_proto 41" "oxm_of_ip_proto 42" "oxm_of_ip_proto 43" "oxm_of_ip_proto 44" "oxm_of_ip_proto 45" "oxm_of_ip_proto 46" "oxm_of_ip_proto 47" "oxm_of_ip_proto 48" "oxm_of_ip_proto 49"
					"oxm_of_ip_proto 50" "oxm_of_ip_proto 51" "oxm_of_ip_proto 52" "oxm_of_ip_proto 53" "oxm_of_ip_proto 54" "oxm_of_ip_proto 55" "oxm_of_ip_proto 56" "oxm_of_ip_proto 57" "oxm_of_ip_proto 58" "oxm_of_ip_proto 59"
					"oxm_of_ip_proto 60" "oxm_of_ip_proto 62" 											"oxm_of_ip_proto 64" "oxm_of_ip_proto 65" "oxm_of_ip_proto 66" "oxm_of_ip_proto 67" 					 "oxm_of_ip_proto 69"
					"oxm_of_ip_proto 70" "oxm_of_ip_proto 71" "oxm_of_ip_proto 72" "oxm_of_ip_proto 73" "oxm_of_ip_proto 74" "oxm_of_ip_proto 75" "oxm_of_ip_proto 76" "oxm_of_ip_proto 77" "oxm_of_ip_proto 78" "oxm_of_ip_proto 79"
					"oxm_of_ip_proto 80" "oxm_of_ip_proto 81" "oxm_of_ip_proto 82" "oxm_of_ip_proto 83" "oxm_of_ip_proto 84" "oxm_of_ip_proto 85" "oxm_of_ip_proto 86" "oxm_of_ip_proto 87" "oxm_of_ip_proto 88" "oxm_of_ip_proto 89"
					"oxm_of_ip_proto 90" "oxm_of_ip_proto 91" "oxm_of_ip_proto 92" "oxm_of_ip_proto 93" "oxm_of_ip_proto 94" "oxm_of_ip_proto 95" "oxm_of_ip_proto 96" "oxm_of_ip_proto 97" "oxm_of_ip_proto 98" 
					"oxm_of_ip_proto 100" "oxm_of_ip_proto 101" "oxm_of_ip_proto 102" "oxm_of_ip_proto 103" "oxm_of_ip_proto 104" "oxm_of_ip_proto 105" "oxm_of_ip_proto 106" "oxm_of_ip_proto 107" "oxm_of_ip_proto 108" "oxm_of_ip_proto 109"
					"oxm_of_ip_proto 110" "oxm_of_ip_proto 111" "oxm_of_ip_proto 112" "oxm_of_ip_proto 113"                       "oxm_of_ip_proto 115" "oxm_of_ip_proto 116" "oxm_of_ip_proto 117" "oxm_of_ip_proto 118" "oxm_of_ip_proto 119"
					"oxm_of_ip_proto 120" "oxm_of_ip_proto 121" "oxm_of_ip_proto 122" "oxm_of_ip_proto 123" "oxm_of_ip_proto 124" "oxm_of_ip_proto 125" "oxm_of_ip_proto 126" "oxm_of_ip_proto 127" "oxm_of_ip_proto 128" "oxm_of_ip_proto 129"
					"oxm_of_ip_proto 130" "oxm_of_ip_proto 131" "oxm_of_ip_proto 132" "oxm_of_ip_proto 133" "oxm_of_ip_proto 134" "oxm_of_ip_proto 135" "oxm_of_ip_proto 136" "oxm_of_ip_proto 137" "oxm_of_ip_proto 138" "oxm_of_ip_proto 139"
					"oxm_of_ip_proto 140" "oxm_of_ip_proto 141" "oxm_of_ip_proto 142" "oxm_of_ip_proto 143" 
)

 for ((i=0; i<${#substituir_proto_string[@]}; ++i)); do

 printf "Substituindo ${substituir_proto_string[i]} por ${substituto_proto_string[i]}...\n"
 
 sed -i "s/${substituir_proto_string[i]}/${substituto_proto_string[i]}/" $arq_saida
 
 done
 
 sed -i 's/ip protocol/oxm_of_ip_proto/' $arq_saida
 
###############################IP de Origem de IP de Destino#################################

 sed -i 's/ip saddr/oxm_of_ipv4_src/' $arq_saida
 sed -i 's/ip daddr/oxm_of_ipv4_dst/' $arq_saida
 
#############################Portas de Origem e Portas de Destino###########################

#Portas
sed -i 's/tcpmux/@1/' $arq_saida
sed -i 's/echo/@7/' $arq_saida
sed -i 's/discard/@9/' $arq_saida
sed -i 's/systat/@11/' $arq_saida
sed -i 's/daytime/@13/' $arq_saida
sed -i 's/netstat/@15/' $arq_saida
sed -i 's/qotd/@17/' $arq_saida
sed -i 's/msp/@18/' $arq_saida
sed -i 's/chargen/@19/' $arq_saida
sed -i 's/ftp-data/@20/' $arq_saida
sed -i 's/ftp/@21/' $arq_saida
sed -i 's/fsp/@21/' $arq_saida
sed -i 's/ssh/@22/' $arq_saida
sed -i 's/telnet/@23/' $arq_saida
sed -i 's/smtp/@25/' $arq_saida
sed -i 's/time/@37/' $arq_saida
sed -i 's/rlp/@39/' $arq_saida
sed -i 's/nameserver/@42/' $arq_saida
sed -i 's/whois/@43/' $arq_saida
sed -i 's/tacacs/@49/' $arq_saida
sed -i 's/re-mail-ck/@50/' $arq_saida
sed -i 's/domain/@53/' $arq_saida
sed -i 's/tacacs-ds/@65/' $arq_saida
sed -i 's/bootps/@67/' $arq_saida
sed -i 's/bootpc/@68/' $arq_saida
sed -i 's/tftp/@69/' $arq_saida
sed -i 's/gopher/@70/' $arq_saida
sed -i 's/finger/@79/' $arq_saida
sed -i 's/http/@80/' $arq_saida
sed -i 's/link/@87/' $arq_saida
sed -i 's/kerberos/@88/' $arq_saida
sed -i 's/supdup/@95/' $arq_saida
sed -i 's/hostnames/@101/' $arq_saida
sed -i 's/iso-tsap/@102/' $arq_saida
sed -i 's/acr-nema/@104/' $arq_saida
sed -i 's/csnet-ns/@105/' $arq_saida
sed -i 's/rtelnet/@107/' $arq_saida
sed -i 's/pop3/@110/' $arq_saida
sed -i 's/sunrpc/@111/' $arq_saida
sed -i 's/auth/@113/' $arq_saida
sed -i 's/sftp/@115/' $arq_saida
sed -i 's/nntp/@119/' $arq_saida
sed -i 's/ntp/@123/' $arq_saida
sed -i 's/pwdgen/@129/' $arq_saida
sed -i 's/loc-srv/@135/' $arq_saida
sed -i 's/netbios-ns/@137/' $arq_saida
sed -i 's/netbios-dgm/@138/' $arq_saida
sed -i 's/netbios-ssn/@139/' $arq_saida
sed -i 's/imap2/@143/' $arq_saida
sed -i 's/snmp/@161/' $arq_saida
sed -i 's/snmp-trap/@162/' $arq_saida
sed -i 's/cmip-man/@163/' $arq_saida
sed -i 's/cmip-agent/@164/' $arq_saida
sed -i 's/mailq/@174/' $arq_saida
sed -i 's/xdmcp/@177/' $arq_saida
sed -i 's/nextstep/@178/' $arq_saida
sed -i 's/bgp/@179/' $arq_saida
sed -i 's/irc/@194/' $arq_saida
sed -i 's/smux/@199/' $arq_saida
sed -i 's/at-rtmp/@201/' $arq_saida
sed -i 's/at-nbp/@202/' $arq_saida
sed -i 's/at-echo/@204/' $arq_saida
sed -i 's/at-zis/@206/' $arq_saida
sed -i 's/qmtp/@209/' $arq_saida
sed -i 's/z3950/@210/' $arq_saida
sed -i 's/ipx/@213/' $arq_saida
sed -i 's/pawserv/@345/' $arq_saida
sed -i 's/zserv/@346/' $arq_saida
sed -i 's/fatserv/@347/' $arq_saida
sed -i 's/rpc2portmap/@369/' $arq_saida
sed -i 's/codaauth2/@370/' $arq_saida
sed -i 's/clearcase/@371/' $arq_saida
sed -i 's/ulistserv/@372/' $arq_saida
sed -i 's/ldap/@389/' $arq_saida
sed -i 's/imsp/@406/' $arq_saida
sed -i 's/svrloc/@427/' $arq_saida
sed -i 's/https/@443/' $arq_saida
sed -i 's/snpp/@444/' $arq_saida
sed -i 's/microsoft-ds/@445/' $arq_saida
sed -i 's/kpasswd/@464/' $arq_saida
sed -i 's/urd/@465/' $arq_saida
sed -i 's/saft/@487/' $arq_saida
sed -i 's/isakmp/@500/' $arq_saida
sed -i 's/rtsp/@554/' $arq_saida
sed -i 's/nqs/@607/' $arq_saida
sed -i 's/npmp-local/@610/' $arq_saida
sed -i 's/npmp-gui/@611/' $arq_saida
sed -i 's/hmmp-ind/@612/' $arq_saida
sed -i 's/asf-rmcp/@623/' $arq_saida
sed -i 's/qmqp/628/' $arq_saida
sed -i 's/ipp/@631/' $arq_saida
sed -i 's/exec/@512/' $arq_saida
sed -i 's/biff/@512/' $arq_saida
sed -i 's/login/@513/' $arq_saida
sed -i 's/who/@513/' $arq_saida
sed -i 's/shell/@514/' $arq_saida
sed -i 's/syslog/@514/' $arq_saida
sed -i 's/printer/@515/' $arq_saida
sed -i 's/talk/@517/' $arq_saida
sed -i 's/ntalk/@518/' $arq_saida
sed -i 's/route/@520/' $arq_saida
sed -i 's/timed/@525/' $arq_saida
sed -i 's/tempo/@526/' $arq_saida
sed -i 's/courier/@530/' $arq_saida
sed -i 's/conference/@531/' $arq_saida
sed -i 's/netnews/@532/' $arq_saida
sed -i 's/netwall/@533/' $arq_saida
sed -i 's/gdomap/@538/' $arq_saida
sed -i 's/uucp/@540/' $arq_saida
sed -i 's/klogin/@543/' $arq_saida
sed -i 's/kshell/@544/' $arq_saida
sed -i 's/dhcpv6-client/@546/' $arq_saida
sed -i 's/dhcpv6-server/@547/' $arq_saida
sed -i 's/afpovertcp/@548/' $arq_saida
sed -i 's/idfp/@549/' $arq_saida
sed -i 's/remotefs/@556/' $arq_saida
sed -i 's/nntps/@563/' $arq_saida
sed -i 's/submission/@587/' $arq_saida
sed -i 's/ldaps/@636/' $arq_saida
sed -i 's/tinc/@655/' $arq_saida
sed -i 's/silc/@706/' $arq_saida
sed -i 's/kerberos-adm/@749/' $arq_saida
sed -i 's/webster/@765/' $arq_saida
sed -i 's/rsync/@873/' $arq_saida
sed -i 's/ftps-data/@989/' $arq_saida
sed -i 's/ftps/@990/' $arq_saida
sed -i 's/telnets/@992/' $arq_saida
sed -i 's/imaps/@993/' $arq_saida
sed -i 's/pop3s/@995/' $arq_saida
sed -i 's/socks/@1080/' $arq_saida
sed -i 's/proofd/@1093/' $arq_saida
sed -i 's/rootd/@1094/' $arq_saida
sed -i 's/openvpn/@1194/' $arq_saida
sed -i 's/rmiregistry/@1099/' $arq_saida
sed -i 's/kazaa/@1214/' $arq_saida
sed -i 's/nessus/@1241/' $arq_saida
sed -i 's/lotusnote/@1352/' $arq_saida
sed -i 's/ms-sql-s/@1433/' $arq_saida
sed -i 's/ms-sql-m/@1434/' $arq_saida
sed -i 's/ingreslock/@1524/' $arq_saida
sed -i 's/datametrics/@1645/' $arq_saida
sed -i 's/sa-msg-port/@1646/' $arq_saida
sed -i 's/kermit/@1649/' $arq_saida
sed -i 's/groupwise/@1677/' $arq_saida
sed -i 's/l2f/@1701/' $arq_saida
sed -i 's/radius/@1812/' $arq_saida
sed -i 's/radius-acct/@1813/' $arq_saida
sed -i 's/msnp/@1863/' $arq_saida
sed -i 's/unix-status/@1957/' $arq_saida
sed -i 's/log-server/@1958/' $arq_saida
sed -i 's/remoteping/@1959/' $arq_saida
sed -i 's/cisco-sccp/@2000/' $arq_saida
sed -i 's/search/@2010/' $arq_saida
sed -i 's/pipe-server/@2010/' $arq_saida
sed -i 's/nfs/@2049/' $arq_saida
sed -i 's/gnunet/@2086/' $arq_saida
sed -i 's/rtcm-sc104/@2101/' $arq_saida
sed -i 's/gsigatekeeper/@2119/' $arq_saida
sed -i 's/gris/@2135/' $arq_saida
sed -i 's/cvspserver/@2401/' $arq_saida
sed -i 's/venus/@2430/' $arq_saida
sed -i 's/venus-se/@2431/' $arq_saida
sed -i 's/codasrv/@2432/' $arq_saida
sed -i 's/codasrv-se/@2433/' $arq_saida
sed -i 's/mon/@2583/' $arq_saida
sed -i 's/dict/@2628/' $arq_saida
sed -i 's/f5-globalsite/@2792/' $arq_saida
sed -i 's/gsiftp/@2811/' $arq_saida
sed -i 's/gpsd/@2947/' $arq_saida
sed -i 's/gds-db/@3050/' $arq_saida
sed -i 's/icpv2/@3130/' $arq_saida
sed -i 's/isns/@3205/' $arq_saida
sed -i 's/iscsi-target/@3260/' $arq_saida
sed -i 's/mysql/@3306/' $arq_saida
sed -i 's/nut/@3493/' $arq_saida
sed -i 's/distcc/@3632/' $arq_saida
sed -i 's/daap/@3689/' $arq_saida
sed -i 's/svn/@3690/' $arq_saida
sed -i 's/suucp/@4031/' $arq_saida
sed -i 's/sysrqd/@4094/' $arq_saida
sed -i 's/sieve/@4190/' $arq_saida
sed -i 's/epmd/@4369/' $arq_saida
sed -i 's/remctl/@4373/' $arq_saida
sed -i 's/f5-iquery/@4353/' $arq_saida
sed -i 's/ipsec-nat-t/@4500/' $arq_saida
sed -i 's/iax/@4569/' $arq_saida
sed -i 's/mtn/@4691/' $arq_saida
sed -i 's/radmin-port/@4899/' $arq_saida
sed -i 's/rfe/@5002/' $arq_saida
sed -i 's/mmcc/@5050/' $arq_saida
sed -i 's/sip/@5060/' $arq_saida
sed -i 's/sip-tls/@5061/' $arq_saida
sed -i 's/aol/@5190/' $arq_saida
sed -i 's/xmpp-client/@5222/' $arq_saida
sed -i 's/xmpp-server/@5269/' $arq_saida
sed -i 's/cfengine/@5308/' $arq_saida
sed -i 's/mdns/@5353/' $arq_saida
sed -i 's/postgresql/@5432/' $arq_saida
sed -i 's/freeciv/@5556/' $arq_saida
sed -i 's/amqps/@5671/' $arq_saida
sed -i 's/amqp/@5672/' $arq_saida
sed -i 's/ggz/@5688/' $arq_saida
sed -i 's/x11/@6000/' $arq_saida
sed -i 's/x11-1/@6001/' $arq_saida
sed -i 's/x11-2/@6002/' $arq_saida
sed -i 's/x11-3/@6003/' $arq_saida
sed -i 's/x11-4/@6004/' $arq_saida
sed -i 's/x11-5/@6005/' $arq_saida
sed -i 's/x11-6/@6006/' $arq_saida
sed -i 's/x11-7/@6007/' $arq_saida
sed -i 's/gnutella-svc/@6346/' $arq_saida
sed -i 's/gnutella-rtr/@6347/' $arq_saida
sed -i 's/sge-qmaster/@6444/' $arq_saida
sed -i 's/sge-execd/@6445/' $arq_saida
sed -i 's/mysql-proxy/@6446/' $arq_saida
sed -i 's/babel/@6696/' $arq_saida
sed -i 's/ircs-u/@6697/' $arq_saida
sed -i 's/afs3-fileserver/@7000/' $arq_saida
sed -i 's/afs3-callback/@7001/' $arq_saida
sed -i 's/afs3-prserver/@7002/' $arq_saida
sed -i 's/afs3-vlserver/@7003/' $arq_saida
sed -i 's/afs3-kaserver/@7004/' $arq_saida
sed -i 's/afs3-volser/@7005/' $arq_saida
sed -i 's/afs3-errors/@7006/' $arq_saida
sed -i 's/afs3-bos/@7007/' $arq_saida
sed -i 's/afs3-update/@7008/' $arq_saida
sed -i 's/afs3-rmtsys/@7009/' $arq_saida
sed -i 's/font-service/@7100/' $arq_saida
sed -i 's/http-alt/@8080/' $arq_saida
sed -i 's/puppet/@8140/' $arq_saida
sed -i 's/bacula-dir/@9101/' $arq_saida
sed -i 's/bacula-fd/@9102/' $arq_saida
sed -i 's/bacula-sd/@9103/' $arq_saida
sed -i 's/xmms2/@9667/' $arq_saida
sed -i 's/nbd/@10809/' $arq_saida
sed -i 's/zabbix-agent/@10050/' $arq_saida
sed -i 's/zabbix-trapper/@10051/' $arq_saida
sed -i 's/amanda/@10080/' $arq_saida
sed -i 's/dicom/@11112/' $arq_saida
sed -i 's/hkp/@11371/' $arq_saida
sed -i 's/bprd/@13720/' $arq_saida
sed -i 's/bpdbm/@13721/' $arq_saida
sed -i 's/bpjava-msvc/@13722/' $arq_saida
sed -i 's/vnetd/@13724/' $arq_saida
sed -i 's/bpcd/@13782/' $arq_saida
sed -i 's/vopied/@13783/' $arq_saida
sed -i 's/db-lsp/@17500/' $arq_saida
sed -i 's/dcap/@22125/' $arq_saida
sed -i 's/gsidcap/@22128/' $arq_saida
sed -i 's/wnn6/@22273/' $arq_saida
sed -i 's/kerberos4/@750/' $arq_saida
sed -i 's/kerberos-master/@751/' $arq_saida
sed -i 's/passwd-server/@752/' $arq_saida
sed -i 's/krb-prop/@754/' $arq_saida
sed -i 's/krbupdate/@760/' $arq_saida
sed -i 's/swat/@901/' $arq_saida
sed -i 's/kpop/@1109/' $arq_saida
sed -i 's/knetd/@2053/' $arq_saida
sed -i 's/zephyr-srv/@2102/' $arq_saida
sed -i 's/zephyr-clt/@2103/' $arq_saida
sed -i 's/zephyr-hm/@2104/' $arq_saida
sed -i 's/eklogin/@2105/' $arq_saida
sed -i 's/kx/@2111/' $arq_saida
sed -i 's/iprop/@2121/' $arq_saida
sed -i 's/nf/@98/' $arq_saida
sed -i 's/poppassd/@106/' $arq_saida
sed -i 's/moira-db/@775/' $arq_saida
sed -i 's/moira-update/@777/' $arq_saida
sed -i 's/moira-ureg/@779/' $arq_saida
sed -i 's/spamd/@783/' $arq_saida
sed -i 's/omirr/@808/' $arq_saida
sed -i 's/customs/@1001/' $arq_saida
sed -i 's/skkserv/@1178/' $arq_saida
sed -i 's/predict/@1210/' $arq_saida
sed -i 's/rmtcfg/@1236/' $arq_saida
sed -i 's/wipld/@1300/' $arq_saida
sed -i 's/xtel/@1313/' $arq_saida
sed -i 's/xtelw/@1314/' $arq_saida
sed -i 's/support/@1529/' $arq_saida
sed -i 's/cfinger/@2003/' $arq_saida
sed -i 's/frox/@2121/' $arq_saida
sed -i 's/ninstall/@2150/' $arq_saida
sed -i 's/zebrasrv/@2600/' $arq_saida
sed -i 's/zebra/@2601/' $arq_saida
sed -i 's/ripd/@2602/' $arq_saida
sed -i 's/ripngd/@2603/' $arq_saida
sed -i 's/ospfd/@2604/' $arq_saida
sed -i 's/bgpd/@2605/' $arq_saida
sed -i 's/ospf6d/@2606/' $arq_saida
sed -i 's/ospfapi/@2607/' $arq_saida
sed -i 's/isisd/@2608/' $arq_saida
sed -i 's/afbackup/@2988/' $arq_saida
sed -i 's/afmbackup/@2989/' $arq_saida
sed -i 's/xtell/@4224/' $arq_saida
sed -i 's/fax/@4557/' $arq_saida
sed -i 's/hylafax/@4559/' $arq_saida
sed -i 's/distmp3/@4600/' $arq_saida
sed -i 's/munin/@4949/' $arq_saida
sed -i 's/enbd-cstatd/@5051/' $arq_saida
sed -i 's/enbd-sstatd/@5052/' $arq_saida
sed -i 's/pcrd/@5151/' $arq_saida
sed -i 's/noclog/@5354/' $arq_saida
sed -i 's/hostmon/@5355/' $arq_saida
sed -i 's/rplay/@5555/' $arq_saida
sed -i 's/nrpe/@5666/' $arq_saida
sed -i 's/nsca/@5667/' $arq_saida
sed -i 's/mrtd/@5674/' $arq_saida
sed -i 's/bgpsim/@5675/' $arq_saida
sed -i 's/canna/@5680/' $arq_saida
sed -i 's/syslog-tls/@6514/' $arq_saida
sed -i 's/sane-port/@6566/' $arq_saida
sed -i 's/ircd/@6667/' $arq_saida
sed -i 's/zope-ftp/@8021/' $arq_saida
sed -i 's/tproxy/@8081/' $arq_saida
sed -i 's/omniorb/@8088/' $arq_saida
sed -i 's/clc-build-daemon/@8990/' $arq_saida
sed -i 's/xinetd/@9098/' $arq_saida
sed -i 's/mandelspawn/@9359/' $arq_saida
sed -i 's/git/@9418/' $arq_saida
sed -i 's/zope/@9673/' $arq_saida
sed -i 's/webmin/@10000/' $arq_saida
sed -i 's/kamanda/@10081/' $arq_saida
sed -i 's/amandaidx/@10082/' $arq_saida
sed -i 's/amidxtape/@10083/' $arq_saida
sed -i 's/smsqp/@11201/' $arq_saida
sed -i 's/xpilot/@15345/' $arq_saida
sed -i 's/sgi-cmsd/@17001/' $arq_saida
sed -i 's/sgi-crsd/@17002/' $arq_saida
sed -i 's/sgi-gcd/@17003/' $arq_saida
sed -i 's/sgi-cad/@17004/' $arq_saida
sed -i 's/isdnlog/@20011/' $arq_saida
sed -i 's/vboxd/@20012/' $arq_saida
sed -i 's/binkp/@24554/' $arq_saida

#TCP single porta
sed -i 's/tcp dport /oxm_tcp_dst /' $arq_saida
sed -i 's/tcp sport /oxm_tcp_src /' $arq_saida

#UDP single portas
sed -i 's/udp dport /oxm_udp_dst /' $arq_saida
sed -i 's/udp sport /oxm_udp_src /' $arq_saida


#TCP Multiplas porta
sed -i 's/oxm_tcp_dst { /oxm_tcp_dst /' $arq_saida
sed -i 's/oxm_tcp_src { /oxm_tcp_src /' $arq_saida

#UDP Multiplas portas
sed -i 's/oxm_udp_dst { /oxm_udp_dst /' $arq_saida
sed -i 's/oxm_udp_src { /oxm_udp_src /' $arq_saida


##################################Flags  TC###################################################

#tcp flag single
sed -i 's/tcp flags/oxm_tcp_flags/' $arq_saida

#tcp flag multiplos
sed -i 's/oxm_tcp_flags { /oxm_tcp_flags /' $arq_saida

###################################ICMP  Type#################################################

sed -i 's/icmp type/oxm_of_icmpv4_type/' $arq_saida
 
#Types
sed -i 's/@7-reply/0/' $arq_saida
sed -i 's/destination-unreachable/3/' $arq_saida
sed -i 's/source-quench/4/' $arq_saida
sed -i 's/redirect/5/' $arq_saida
sed -i 's/@7-request/8/' $arq_saida
sed -i 's/time-exceeded/11/' $arq_saida
sed -i 's/parameter-problem/12/' $arq_saida
sed -i 's/timestamp-request/13/' $arq_saida
sed -i 's/timestamp-reply/14/' $arq_saida
sed -i 's/info-request/15/' $arq_saida
sed -i 's/info-reply/16/' $arq_saida
sed -i 's/address-mask-request/17/' $arq_saida
sed -i 's/address-mask-reply/18/' $arq_saida


###################################MAC Address#################################################

sed -i 's/ether saddr/oxm_of_eth_src/' $arq_saida

###################################State######################################################

sed -i 's/ct state/oxm_of_ct_state/' $arq_saida

####################################Alterar acoes##############################################
sed -i 's/ counter packets [[:digit:]]\+ bytes [[:digit:]]\+ / /' $arq_saida
sed -i 's/accept/ofpat_output/' $arq_saida
sed -i 's/drop/ofpmbt_drop/' $arq_saida
sed -i 's/reject/ofpmbt_drop/' $arq_saida

#NAT
sed -i 's/snat to/ofpat_set_field oxm_of_ipv4_src/' $arq_saida
sed -i 's/dnat to/ofpat_set_field oxm_of_ipv4_dst/' $arq_saida

############################Caracter de escape multiplas porta#################################
sed -i 's/ }//' $arq_saida

###################################Limpar parametros NFtables##################################
#sed -i '/table/d' $arq_saida
#sed -i '/chain/d' $arq_saida
#sed -i '/type/d' $arq_saida
sed -i '/}/d' $arq_saida

##############################Caracter de escape single port###################################
sed -i  '/oxm_tcp/ s/ of/@ of/g' $arq_saida
sed -i '/oxm_udp/ s/ of/@ of/g' $arq_saida

#corrige acao acima caso tenha campos ct state ou tcp flag
sed -i '/oxm_tcp_flags/ s/@ of/ of/g' $arq_saida
sed -i 's/ oxm_tcp_flags/@ oxm_tcp_flags/' $arq_saida

sed -i '/oxm_of_ct_state/ s/@ of/ of/g' $arq_saida
sed -i 's/ oxm_of_ct_state/@ oxm_of_ct_state/' $arq_saida

#############################Higienizar Parametros NFtables###################################

#limpar espacos nos inicios de cada linha
cat $arq_saida |while read line;
do
echo $line >> regrasopenflow.tmp
done
echo "" > $arq_saida
cp regrasopenflow.tmp $arq_saida 
rm -rf regrasopenflow.tmp

#apaga linha que inicia com as seguintes palavras
sed -i '/^type/d' $arq_saida
sed -i '/^table/d' $arq_saida
sed -i '/^chain/d' $arq_saida

##################################Inicio conversao para OVS###########################################

cp $arq_saida $arq_saida_ovs

sed -i 's/oxm_of_ip_proto /ip_proto=/' $arq_saida_ovs
sed -i 's/oxm_of_ipv4_src /ip_src=/' $arq_saida_ovs
sed -i 's/oxm_of_ipv4_dst /ip_dst=/' $arq_saida_ovs
sed -i 's/oxm_tcp_dst /tcp_dst=/' $arq_saida_ovs
sed -i 's/oxm_tcp_src /tcp_src=/' $arq_saida_ovs
sed -i 's/oxm_udp_dst /udp_dst=/' $arq_saida_ovs
sed -i 's/oxm_udp_src /udp_src=/' $arq_saida_ovs
sed -i 's/oxm_tcp_flags /tcp_flags=/' $arq_saida_ovs
sed -i 's/oxm_of_icmpv4_type /icmp_type=/' $arq_saida_ovs
sed -i 's/oxm_of_eth_src /dl_src=/' $arq_saida_ovs
sed -i 's/oxm_of_ct_state /ct_state=/' $arq_saida_ovs

######converte tipos de ct states#######
sed -i 's/established/est/' $arq_saida_ovs
sed -i 's/related/rel/' $arq_saida_ovs
sed -i 's/untracked/inv/' $arq_saida_ovs

#Insere + entre itens de estado
sed -i 's/ new,/new+/' $arq_saida_ovs
sed -i 's/ est,/est+/' $arq_saida_ovs
sed -i 's/ rel,/rel+/' $arq_saida_ovs
sed -i 's/ inv,/inv+/' $arq_saida_ovs

#ajusta primeiro item de uma sequencia de estado
sed -i 's/ct_state=new,/ct_state=new+/' $arq_saida_ovs
sed -i 's/ct_states=est,/ct_state=est+/' $arq_saida_ovs
sed -i 's/ct_states=rel,/ct_state=rel+/' $arq_saida_ovs
sed -i 's/ct_state=inv,/ct_state=inv+/' $arq_saida_ovs

#negar um estado
sed -i 's/ct_state=!= /ct_state=-/' $arq_saida_ovs

#######converte tipos de tcp flags######

#Insere + entre itens de flags
sed -i 's/ fin,/fin+/' $arq_saida_ovs
sed -i 's/ syn,/syn+/' $arq_saida_ovs
sed -i 's/ rst,/rst+/' $arq_saida_ovs
sed -i 's/ psh,/psh+/' $arq_saida_ovs
sed -i 's/ ack,/ack+/' $arq_saida_ovs
sed -i 's/ urg,/urg+/' $arq_saida_ovs
sed -i 's/ ecn,/ecn+/' $arq_saida_ovs
sed -i 's/ cwr,/cwr+/' $arq_saida_ovs

#Remove espaco no ultimo iten
sed -i 's/+ /+/' $arq_saida_ovs

#ajusta primeiro item de uma sequencia de flags
sed -i 's/tcp_flags=fin,/tcp_flags=fin+/' $arq_saida_ovs
sed -i 's/tcp_flags=syn,/tcp_flags=syn+/' $arq_saida_ovs
sed -i 's/tcp_flags=rst,/tcp_flags=rst+/' $arq_saida_ovs
sed -i 's/tcp_flags=psh,/tcp_flags=psh+/' $arq_saida_ovs
sed -i 's/tcp_flags=ack,/tcp_flags=ack+/' $arq_saida_ovs
sed -i 's/tcp_flags=urg,/tcp_flags=urg+/' $arq_saida_ovs
sed -i 's/tcp_flags=ecn,/tcp_flags=ecn+/' $arq_saida_ovs
sed -i 's/tcp_flags=cwr,/tcp_flags=cwr+/' $arq_saida_ovs

#negar uma flag
sed -i 's/tcp_flags=!= /tcp_flags=-/' $arq_saida_ovs

#Alterar acoes OVS
sed -i 's/ofpat_output/actions=output:normal/' $arq_saida_ovs
sed -i 's/ofpmbt_drop/actions=drop/' $arq_saida_ovs
#NAT OVS
sed -i 's/ofpat_set_field oxm_of_ipv4_src /mod_nw_src=/' $arq_saida_ovs
sed -i 's/ofpat_set_field oxm_of_ipv4_dst /mod_nw_dst=/' $arq_saida_ovs
sed -i 's/ofpat_set_field ip_src=/mod_nw_src=/' $arq_saida_ovs
sed -i 's/ofpat_set_field ip_dst=/mod_nw_dst=/' $arq_saida_ovs

#################Loop ajusta para single port###########################

#Remove Output e auxiliar - Nome do txt eh regrasfinal.txt
cp $arq_saida_ovs entradaovs.tmp 
echo "" > $arq_saida_ovs   
	   
#Comeca loop por linha - Nome do arquivo eh regraserradas.txt
                cat entradaovs.tmp |while read line;
                do
#Transfere linha a linha para um arquivo txt para evitar que ele rode os comandos de firewall
        echo $line > auxiliar.tmp
#Cria o contador n - soma de @ na linha
                n=`cat auxiliar.tmp | grep -o \@ |wc -w`    
#Cria o contador m - soma de @ na linha mais um
        m=`expr $n + 1`
#Coloca tudo antes dos @ para a variavel inicio
                inicio=`cat auxiliar.tmp | cut -d @ -f 1`
#Coloca tudo depois dos @ para a variavel final
        final=`cat auxiliar.tmp | cut -d @ -f $m`


#Faz if para analisar casos
#Caso1 - Sem portas nas regras - Exporta a regra para o arquivo regrasfinal.txt
if [ "$n" -eq "0" ]; then
        echo $line >> $arq_saida_ovs


#Caso2 - Uma porta ou mais - Retira os @ e exporta para o arquivo regrasfinal.txt
else 
        for i in $(seq 2 $n);
            do
                    porta=`cat auxiliar.tmp | cut -d @ -f $i`
                   echo $inicio$porta$final >> $arq_saida_ovs
        done    
fi
done

rm -rf entradaovs.tmp
rm -rf auxiliar.tmp

########################Ajusta para formato de entrada no OVS###################
#remove vigulas existentes
sed -i 's/,//' $arq_saida_ovs
#adiciona virgula entre opcoes
sed -i 's/ /,/g' $arq_saida_ovs
#remove linhas em branco
sed -i '/^$/d' $arq_saida_ovs
#adiciona parametros no inicio da linha
sed -i "s/^/ovs-ofctl add-flow $bridge_ovs /" $arq_saida_ovs







