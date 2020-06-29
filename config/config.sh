#!/bin/sh

#cria interface bridge
ovs-vsctl add-br "nome-interface"

#habilita protocolo OpenFlow 1.5
ovs-vsctl set bridge "nome-interface" protocols=OpenFlow15

#remove fluxos pré-definidos
ovs-ofctl del-flows "nome-interface"

#habilita protocolo ARP
ovs-ofctl add-flow "nome-interface" dl_dst=ff:ff:ff:ff:ff:ff,actions=flood
ovs-ofctl add-flow "nome-interface" dl_type=0x806,actions=flood
