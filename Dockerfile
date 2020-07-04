FROM ruby:2.7 

WORKDIR /fa_flc

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN gem install rails bundler
RUN bundle install

COPY . /fa_flc

EXPOSE 3000
