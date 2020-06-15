# Policy-Flow-Converter

O framework Policy Flow Converter tem como objetivo automatizar a importação das políticas de acesso existentes no NFtables para o padrão OpenFlow, este processo inicia-se pela extraçãodas configurações de um ambiente convencional,  adequando as regras de firewall de acordo com a especificações do protocolo Openflow. Através do framework foi estabelecido uma biblioteca com os campos padrões do OpenFlow 1.5.1, possibilitando assim a reusabilidade dos componentes para uma segunda conversão utilizando outros padrões específicos de dispositivos OpenFlow. Nesta versão está contemplada com um modulo de conversão para o OpenVswitch. 

<b>Instruções de Funcionamento:</b>
Primeiramente deverão ser extraídas as políticas de cada firewall que será migrado em formato texto, sendo que as informações podem ser obtidas de maneira simples através do comando "nft list table nome-da-tabela » arquivo.txt".

Durante a execução serão solicitadas as seguintes informações:
  - Arquivo de entrada: Deve ser informado o nome e local do arquivo que possui as regras NFtables;
  - Arquivo do padrão OpenFlow: Nome do arquivo de saída para o padrão Openflow;
  - Arquivo do padrão OpenVswitch: Nome do arquivo para saída com o padrão OpenVswitch.
  - Nome do dispositivo OpenVswitch: Nome do dispositivo que receberá as regras migradas.
  - Nome do dispositivo bridge OVS que receberá as regras;
  - Exitência de VLANS no firewall NFtables:
       * Em caso de resposta positiva serão solicitadas as informações referente a quantidade e posteriormente o     endereçamento de cada VLAN para criação de regras de manutenção de acesso layer 2.
       * Em caso de resposta negativa oserão realizadas as conversões sem a criação de regras para manutenção de acessos em um possível layer 2.
        
<b>Saídas após processamento do framework:</b>
 - Arquivo no padrão OpenFlow: Este arquivo possui o objetivo fornecer uma biblioteca padrão para migração de regras do NFtables para o padrão Openflow. Esta migração contempla a adequação para campos de filtragem seus valores e ação, seguindo o padrão descrito na documentação do OpenFlow 1.5.1. 
 - Arquivo no padrão OpenVswitch: Este arquivo retorna as regras convertidas para o padrão OpenVswitch, já em formato de adição de novos fluxos (add-flow). 
 
<b> Formato da biblioteca padrão OpenFlow:</b>
- Formato das regras:  {Campo X} {Valor X} {Campo Y} {Valor Y} {Campo Z} {Valor X} {Campo N} {Valor N} {Ação} 
- Formato dos campos: 
  - Protocolo: OFPXMT_OFB_IP_PROTO
  - IP Origem: OFPXMT_OFB_IPV4_SRC
  - IP Destino: OFPXMT_OFB_IPV4_DST
  - Porta TCP destino: OFPXMT_OFB_TCP_DST
  - Porta TCP origem: OFPXMT_OFB_TCP_SRC
  - Flag TCP: OFPXMT_OFB_TCP_FLAGS 
  - Porta UDP destino: OFPXMT_OFB_UDP_DST
  - Porta UDP origem: OFPXMT_OFB_UDP_SRC
  - ICMP Type: OFPXMT_OFB_ICMPV4_TYPE
  - MAC Origem: OFPXMT_OFB_ETH_SRC 
  - MAC Destino: OFPXMT_OFB_ETH_DST 
 
<b>Requisitos de Sistema:</b>
 - Sistema Operacional Linux/Unix;
 - Usuário com permissão de escrita na pasta de execução;
