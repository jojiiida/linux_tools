#!/bin/sh

IPTABLES=/sbin/iptables


$IPTABLES -F

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD DROP

$IPTABLES -A INPUT -i lo -j ACCEPT

$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

$IPTABLES -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT

$IPTABLES -A INPUT -p tcp --dport 22 -m state --state NEW -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 25 -m state --state NEW -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 80 -m state --state NEW -j ACCEPT
$IPTABLES -A INPUT -p tcp --dport 443 -m state --state NEW -j ACCEPT
