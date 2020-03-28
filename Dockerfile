FROM ruby:2.5.1
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /keistagram2
WORKDIR /keistagram2
COPY Gemfile /keistagram2/Gemfile
COPY Gemfile.lock /keistagram2/Gemfile.lock
RUN bundle install
COPY . /keistagram2

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
