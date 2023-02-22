FROM docker.io/alpine:3

RUN apk --no-cache --update add git-crypt git-lfs \
	&& rm -Rf /var/cache/apk/*

COPY main.sh /
COPY post.sh /

ENTRYPOINT [ "/main.sh" ]
