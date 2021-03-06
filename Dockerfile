FROM ruby:2.4.1-alpine
WORKDIR app

COPY Gemfile /app
RUN bundle install

COPY bin /app/bin
COPY lib /app/lib

CMD [ "bundle", "exec", "ruby", "-I", "lib", "bin/toy-robot-cli" ]
