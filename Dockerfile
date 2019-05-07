FROM ruby:2.5.3-alpine3.8

ENTRYPOINT cucumber

RUN apk add -u alpine-sdk

COPY Gemfile .
RUN bundle install
COPY features /features