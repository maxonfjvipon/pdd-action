FROM alpine:3.19

LABEL "repository"="https://github.com/g4s8/pdd-action"
LABEL "maintainer"="Kirill Che."

# install pdd
RUN apk add --update --no-cache ruby xz-libs libmagic && \
  mkdir /tmp/apk.cache && \
  apk add -U -t .pdd-deps --cache-dir=/tmp/apk.cache \
    "build-base" "ruby-dev" \
    "libxml2-dev" "libxslt-dev" "file-dev" && \
  gem install --no-document bundle && \
  bundle config build.nokogiri --use-system-libraries && \
  gem install --no-document json && \
  gem install --no-document pdd && \
  apk del .pdd-deps && \
  rm -fr /tmp/apk.cache

WORKDIR /w
COPY ./entry.sh entry.sh

ENTRYPOINT ["/w/entry.sh"]
