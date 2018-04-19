FROM alpine:3.7

#替换国内镜像
COPY deploy/source.list /etc/apk/repositories

RUN apk add --update nginx
RUN mkdir -p /run/nginx

COPY deploy/nginx.conf /etc/nginx/

# copy swagger files to the `/js` folder
#ADD ./index.html /usr/share/nginx/html/
#ADD ./dist/* /usr/share/nginx/html/
ADD deploy/docker-run.sh /usr/share/nginx/

EXPOSE 8080

CMD ["sh", "/usr/share/nginx/docker-run.sh"]
