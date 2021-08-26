# nginx Image herunterladen
FROM nginx

# Kopieren der html-, ssl- und conf-Dateien in das angegebene nginx-Verzeichnis
COPY html/*.* /usr/share/nginx/html
COPY ssl /etc/nginx/ssl
COPY conf/*.* /etc/nginx/.
