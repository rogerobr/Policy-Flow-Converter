#POLICY-FLOW CONVERTER
#Versao: 1.0

 printf "######################POLICY-FLOW CONVERTER######################\n"
 echo Informe o nome do arquivo de entrada:
 read arq_entrada;
 echo Informe o nome do arquivo de saida OpenFlow:
 read arq_saida;
 echo Informe o nome do arquivo de saida Ryu:
 read arq_saida_ryu;

tr [:upper:] [:lower:] < $arq_entrada > temp.txt
cp temp.txt $arq_saida
rm -rf temp.txt

 printf "###Iniciando conversao...###\n"

substituir=( "-s" "--s" "--source" "-d" "--dst" "--destination" "-p tcp" "--protocol tcp" "-p udp" "--protocol udp" "-p icmp" "--protocol icmp" "-t filter -a forward" "-t filter -a input" "-t filter -a output" "-j" "--icmp-type" "-m mac --mac-source" "-i" "--in" "—interface" "accept" "drop" )

substituto=( "\"OFPXMT_OFB_IPV4_SRC\":" "\"OFPXMT_OFB_IPV4_SRC\":" "\"OFPXMT_OFB_IPV4_SRC\":" "\"OFPXMT_OFB_IPV4_DST\":" "\"OFPXMT_OFB_IPV4_DST\":" "\"OFPXMT_OFB_IPV4_DST\":" "\"OFPXMT_OFB_IP_PROTO\":6," "\"OFPXMT_OFB_IP_PROTO\":6," "\"OFPXMT_OFB_IP_PROTO\":17," "\"OFPXMT_OFB_IP_PROTO\":17," "\"OFPXMT_OFB_IP_PROTO\":1," "\"OFPXMT_OFB_IP_PROTO\":1," "curl -X POST -d '{" "curl -X POST -d '{" "curl -X POST -d '{" "\"actions\":" "\"OFPXMT_OFB_ICMPV4_TYPE\":" "\"OFPXMT_OFB_ETH_SRC\":" "\"OXM_OF_IN_PORT\":" "\"OXM_OF_IN_PORT\":" "\"OXM_OF_IN_PORT\”:" "\"ALLOW\" }'" "\"DENY\" }'" )

for ((i=0; i<${#substituir[@]}; ++i)); do

    printf "Substituindo ${substituir[i]} por ${substituto[i]}...\n"
    sed -i "s/${substituir[i]}/${substituto[i]}/" $arq_saida
    sed -i  '/-p udp/ s/--dport/\"OFPXMT_OFB_UDP_DST\":/g' $arq_saida
    sed -i  '/--protocol udp/ s/--dport/\"OFPXMT_OFB_UDP_DST\":/g' $arq_saida
    sed -i  '/-p udp/ s/--sport/\"OFPXMT_OFB_UDP_SRC\":/g' $arq_saida
    sed -i  '/--protocol udp/ s/--sport/\"OFPXMT_OFB_UDP_SRC\":/g' $arq_saida
    sed -i  '/-p udp/! s/--dport/\"OFPXMT_OFB_TCP_DST\":/g' $arq_saida
    sed -i  '/--protocol udp/! s/--dport/\"OFPXMT_OFB_TCP_DST\":/g' $arq_saida
    sed -i  '/-p udp/! s/--sport/\"OFPXMT_OFB_TCP_SRC\":/g' $arq_saida
    sed -i  '/--protocol udp/! s/--sport/\"OFPXMT_OFB_TCP_SRC\":/g' $arq_saida
    sed 's/\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\)\( \)/"\1\2\3\4",\5/g' -i $arq_saida
    sed 's/\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\)\(\/\)\([0-9]*\)\( \)/"\1\2\3\4\5\6",\7/g' -i $arq_saida
    sed 's/\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\)\(\/\)\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\)\( \)/"\1\2\3\4\5\6\7\8\9", /' -i $arq_saida
	sed -i 's/\(, -o\)\( [a-z0-9]* \)/ /g' $arq_saida
    sed -i 's/\(, --out-interface\)\( [a-z0-9]* \)/ /g' $arq_saida
    #sed -i "s/}]}/}]}'http:\/\/localhost:8080\/stats\/flowentry\/add/" $arq_saida
	
 printf "Substituindo ${substituir[i]} por ${substituto[i]}...\n"
 
 
    sed -i "s/${substituir[i]}/${substituto[i]}/" $arq_saida
    sed -i  '/-p udp/ s/--dport/\"OFPXMT_OFB_UDP_DST\":/g' $arq_saida
    sed -i  '/--protocol udp/ s/--dport/\"OFPXMT_OFB_UDP_DST\":/g' $arq_saida
    sed -i  '/-p udp/ s/--sport/\"OFPXMT_OFB_UDP_SRC\":/g' $arq_saida
    sed -i  '/--protocol udp/ s/--sport/\"OFPXMT_OFB_UDP_SRC\":/g' $arq_saida
    sed -i  '/-p udp/! s/--dport/\"OFPXMT_OFB_TCP_DST\":/g' $arq_saida
    sed -i  '/--protocol udp/! s/--dport/\"OFPXMT_OFB_TCP_DST\":/g' $arq_saida
    sed -i  '/-p udp/! s/--sport/\"OFPXMT_OFB_TCP_SRC\":/g' $arq_saida
    sed -i  '/--protocol udp/! s/--sport/\"OFPXMT_OFB_TCP_SRC\":/g' $arq_saida
    sed 's/\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\)\( \)/"\1\2\3\4",\5/g' -i $arq_saida
    sed 's/\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\)\(\/\)\([0-9]*\)\( \)/"\1\2\3\4\5\6",\7/g' -i $arq_saida
    sed 's/\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\)\(\/\)\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\)\( \)/"\1\2\3\4\5\6\7\8\9", /' -i $arq_saida
	sed -i 's/\(, -o\)\( [a-z0-9]* \)/ /g' $arq_saida
	sed -i 's/\(, --out-interface\)\( [a-z0-9]* \)/ /g' $arq_saida
    #sed -i "s/}]}/}]}'http:\/\/localhost:8080\/stats\/flowentry\/add/" $arq_saida


done
    sed -i 's/\(\"port\":\)\([0-9]*\)/\1\2 }]}/g' $arq_saida
    sed -i 's/\(\"OFPXMT_OFB_TCP_DST\": \)\([0-9]*\)/\1"\2",/g' $arq_saida
    sed -i 's/\(\"OFPXMT_OFB_TCP_SRC\": \)\([0-9]*\)/\1"\2",/g' $arq_saida
    sed -i 's/\(\"OFPXMT_OFB_UDP_DST\": \)\([0-9]*\)/\1"\2",/g' $arq_saida
    sed -i 's/\(\"OFPXMT_OFB_UDP_SRC\": \)\([0-9]*\)/\1"\2",/g' $arq_saida
    sed -i 's/\(\"value\": \"\)\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\.\)\([0-9]*\"\)\(,\)/\1\2\3\4\5\}, {"type\": \"OUTPUT\",/g' $arq_saida
    sed -i '/multiport/ s/^/#INCOMPATIVEL - Modulo multiport# /g' $arq_saida
    sed -i '/"ipv4_dst": [a-z]/ s/^/#INCOMPATIVEL - Uso de dominio# /g' $arq_saida
    sed -i '/in_port/ s/^/#Ajustar interface de origem# /g' $arq_saida
    sed -i '/LOG/ s/^/#LOG# /g' $arq_saida
    sed -i '/owner/ s/^/#INCOMPATIVEL - Modulo owner# /g' $arq_saida
    sed -i '/string/ s/^/#INCOMPATIVEL - Modulo string# /g' $arq_saida
    sed -i '/iprange/ s/^/#INCOMPATIVEL - Modulo iprange# /g' $arq_saida
    sed -i '/quota/ s/^/#INCOMPATIVEL - Modulo quota# /g' $arq_saida
    sed -i '/state/ s/^/#INCOMPATIVEL - Modulo state# /g' $arq_saida
    sed -i '/connlimit/ s/^/#INCOMPATIVEL - Modulo connlimit# /g' $arq_saida
    sed -i '/time/ s/^/#INCOMPATIVEL - Modulo time# /g' $arq_saida
    sed -i '/limit/ s/^/#INCOMPATIVEL - Modulo limit# /g' $arq_saida
    sed -i '/recent/ s/^/#INCOMPATIVEL - Modulo recent# /g' $arq_saida
    sed -i '/nat/ s/^/#INCOMPATIVEL - Funcionalidade NAT# /g' $arq_saida
    sed -i '/OXM_OF_IN_PORT/ s/^/#Necessario ajustar interface# /g' $arq_saida

    printf "Resultado OpenFlow disponibilizado no arquivo $arq_saida\n"

        cp $arq_saida $arq_saida_ryu

        substituir_ryu=( "OFPXMT_OFB_IPV4_SRC" "OFPXMT_OFB_IPV4_DST" "OFPXMT_OFB_IP_PROTO\":6" "OFPXMT_OFB_IP_PROTO\":17" "OFPXMT_OFB_IP_PROTO\":1" "OXM_OF_IN_PORT" "OFPXMT_OFB_UDP_DST" "OFPXMT_OFB_UDP_SRC" "OFPXMT_OFB_TCP_DST" "OFPXMT_OFB_TCP_SRC")

        substituto_ryu=( "nw_src" "nw_dst" "nw_proto\": \"TCP\"" "nw_proto\": \"UDP\"" "nw_proto\": \"ICMP\"" "in_port" "tp_dst" "tp_src" "tp_dst" "tp_src")

                for ((i=0; i<${#substituir_ryu[@]}; ++i)); do

                        printf "Substituindo ${substituir_ryu[i]} por ${substituto_ryu[i]}...\n"
                        sed -i "s/${substituir_ryu[i]}/${substituto_ryu[i]}/" $arq_saida_ryu

                done

        printf "Resultado Ryu disponibilizado no arquivo $arq_saida_ryu\n"
 printf "###Conversao finalizada!###\n"
