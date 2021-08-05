FROM ruby:2.7.3
# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /spectech
COPY Gemfile /spectech/Gemfile
COPY Gemfile.lock /spectech/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Copy every file from current directory into the image
COPY . /spectech/

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
