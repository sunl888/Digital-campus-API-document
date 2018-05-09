FROM nginx:1.13-alpine

# 替换国内镜像
COPY deploy/source.list /etc/apk/repositories

COPY deploy/nginx.conf /etc/nginx/
# COPY ./public/ /usr/share/nginx/html/

ADD deploy/docker-run.sh /usr/share/nginx/

CMD ["sh", "/usr/share/nginx/docker-run.sh"]
