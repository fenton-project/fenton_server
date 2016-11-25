FROM ruby:2.2.3

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /fenton_server
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

RUN bundle exec ./bin/rails db:environment:set RAILS_ENV=development
RUN bundle exec rake db:drop && bundle exec rake db:setup

EXPOSE 9292

CMD bundle exec puma --redirect-stdout log/server.log --redirect-stderr log/server.log --redirect-append --bind tcp://0.0.0.0 --port 9292
