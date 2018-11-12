FROM nginx:1-alpine

VOLUME /app
WORKDIR /app

ENV NGINX_HOST dev.localhost
ENV PHP_FPM_HOST php
ENV PHP_FPM_PORT 9000

COPY default.conf /etc/nginx/conf.d/default.template

CMD /bin/sh -c "envsubst '\$NGINX_HOST \$PHP_FPM_HOST \$PHP_FPM_PORT' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"