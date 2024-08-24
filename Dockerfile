FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set up working directory
WORKDIR /task_managment
COPY Gemfile /task_managment/Gemfile
COPY Gemfile.lock /task_managment/Gemfile.lock
RUN bundle install
COPY . /task_managment

# Expose port
EXPOSE 3000

# Start the server
CMD ["rails", "server", "-b", "0.0.0.0"]
