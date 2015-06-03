# 127.0.0.1 *.makerist.dev

# https://coderwall.com/p/plejka/forward-port-80-to-port-3000
# sudo iptables -t nat -I OUTPUT -p tcp -d 127.0.0.1 --dport 80 -j REDIRECT --to-ports 3000