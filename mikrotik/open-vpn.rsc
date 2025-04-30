# ==================================================
# Generate Certificates

# Generate CA Certificate
/certificate add name=CA common-name=CA days-valid=3650 key-usage=key-cert-sign,crl-sign 
/certificate sign CA ca-crl-host=TODO.sn.mynetname.net
/certificate set CA trusted=yes

# Generate Server Certificate
/certificate add name=Server common-name=Server days-valid=3650 key-usage=digital-signature,key-encipherment,tls-server
/certificate sign Server ca=CA
/certificate set Server trusted=yes

# Generate Client Certificate
/certificate add name=Client common-name=Client days-valid=3650 trusted=yes key-usage=tls-client 
/certificate sign Client ca=CA
/certificate set Client trusted=yes

# ==================================================

# Export Certificates 
/certificate export-certificate CA file-name=CA
/certificate export-certificate Client file-name=ovpn-client export-passphrase=TODO

# ==================================================
# Enable OVPN Server
/interface ovpn-server server set enabled=yes port=443 mode=ip netmask=24 max-mtu=1500 keepalive-timeout=60 default-profile=default certificate=Server require-client-certificate=yes auth=sha256 cipher=aes256-cbc protocol=tcp 

# ==================================================
# Extra Configurations

# IP Pool Configuration
/ip pool add name=vpn_pool range=192.168.10.101-192.168.10.149

# VPN Profile Configuration
/ppp profile add name=vpn_profile local-address=192.168.10.1 remote-address=vpn_pool

# Create user for VPN
/ppp secret add name=TODO password=TODO service=ovpn profile=vpn_profile

# Firewall
/ip firewall nat add chain=srcnat src-address=192.168.10.0/24 action=masquerade
/ip firewall filter add chain=input protocol=tcp dst-port=443 action=accept