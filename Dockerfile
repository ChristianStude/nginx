FROM nginx
COPY html/*.* /usr/share/nginx/html
COPY ssl /etc/nginx/ssl
COPY conf/*.* /etc/nginx/.
