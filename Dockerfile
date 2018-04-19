FROM alpine:3.7

#替换国内镜像
COPY deploy/source.list /etc/apk/repositories

RUN apk add --update nginx
RUN mkdir -p /run/nginx

COPY deploy/nginx.conf /etc/nginx/
COPY ./public/ /usr/share/nginx/html/

ADD deploy/docker-run.sh /usr/share/nginx/
#ADD ./public/apis/* /usr/share/nginx/html/apis/
#ADD ./public/resources/* /usr/share/nginx/html/resources/

EXPOSE 8080

CMD ["sh", "/usr/share/nginx/docker-run.sh"]
