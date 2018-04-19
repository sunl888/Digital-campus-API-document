FROM alpine:3.7

#替换国内镜像
COPY deploy/source.list /etc/apk/repositories

RUN apk add --update nginx
RUN mkdir -p /run/nginx

COPY deploy/nginx.conf /etc/nginx/
COPY ./public/ /usr/share/nginx/html/

ADD deploy/docker-run.sh /usr/share/nginx/

CMD ["sh", "/usr/share/nginx/docker-run.sh"]
