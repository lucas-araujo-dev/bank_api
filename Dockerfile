FROM ruby:3.3.0

RUN apt-get update -qq && \
        apt-get install --no-install-recommends -y curl libvips postgresql-client && \
        rm -rf /var/lib/apt/lists /var/cache/apt/archives

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
