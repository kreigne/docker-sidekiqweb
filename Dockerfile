FROM ruby:2.4.0-alpine

RUN mkdir /sidekiq/
RUN apk update
RUN apk add --no-cache gcc make g++ libpq less

ADD Gemfile* /sidekiq/
WORKDIR /sidekiq
RUN bundle install

ADD config.ru /sidekiq/

EXPOSE 3030
ENTRYPOINT []
CMD rackup config.ru -o 0.0.0.0 -p 3030 -q
