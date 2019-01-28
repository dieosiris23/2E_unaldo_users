FROM ruby:2.3

RUN mkdir /auth-ms
WORKDIR /auth-ms

ADD Gemfile /auth-ms/Gemfile
ADD Gemfile.lock /auth-ms/Gemfile.lock

RUN bundle install
ADD . /auth-ms

EXPOSE 4000
