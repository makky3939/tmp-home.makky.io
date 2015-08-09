FROM ruby:2.2.2

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ADD Gemfile /usr/src/app/
ADD Gemfile.lock /usr/src/app/
RUN bundle install --system

ADD Procfile /usr/src/app/

ADD . /usr/src/app

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

# ENV SECRET_KEY_BASE RUN ["bundle", "exec", "rake", "secret"]

# ONBUILD RUN bundle exec rake db:create RAILS_ENV=production
# ONBUILD RUN bundle exec rake db:migrate RAILS_ENV=production

EXPOSE 8080

# CMD ["bundle", "exec", "foreman", "start" ]
ENTRYPOINT bin/start_server.sh
