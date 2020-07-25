FROM ruby:2.7 

WORKDIR /fa_flc

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
    nodejs \
    postgresql-client \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g yarn@1.22.4

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
COPY yarn.lock ./yarn.lock
COPY package.json ./package.json


RUN gem install rails bundler
RUN bundle install
RUN yarn install --frozen-lockfile


COPY . /fa_flc

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
