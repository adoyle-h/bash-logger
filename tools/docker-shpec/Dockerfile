FROM alpine:3.6

ENV APP_DIR=/shpec

WORKDIR $APP_DIR

RUN apk update && \
	apk upgrade && \
	apk add --no-cache \
		curl \
		make

RUN sh -c "`curl -L https://raw.github.com/rylnd/shpec/master/install.sh`"

CMD /usr/local/bin/shpec $(find /shpec/test -name "*.sh")
