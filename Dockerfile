FROM ruby:2.4.1-alpine

COPY bin /app/bin
COPY Gemfile /app
COPY spec /app/spec

WORKDIR app

RUN bundle install

CMD [ "bundle", "exec", "ruby", "bin/toy-robot" ]
