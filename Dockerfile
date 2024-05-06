FROM ruby:3.2.2-alpine3.18
RUN apk add build-base postgresql-dev tzdata git bash
WORKDIR /app
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"
