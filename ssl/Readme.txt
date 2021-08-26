# Das Verzeichnis ssl erstellen und in das Verzeichnis wechseln

# sudo mkdir -p /etc/nginx/ssl
# cd /etc/nginx/ssl


# TSL-Key generieren und im Verzeichnis speichern

# openssl genrsa -out cgi_challenge.key 2048
# openssl req -new -key cgi_challenge.key -out cgi_challenge.csr
# DE \
# Thüringen \
# Weimar \
# MyOrganisation \
# MyOrg \
# my.org \
# my@org.com \
# \
# \

# Key mit 730 Tagen Gültigkeit zetrifitieren

#openssl x509 -req -days 730 -in cgi_challenge.csr -signkey cgi_challenge.key -out cgi_challenge.crt

#openssl dhparam -out dhparam.pem 2048
