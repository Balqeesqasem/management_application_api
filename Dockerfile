# Use the official Ruby image
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs postgresql-client

# Set up the working directory
WORKDIR /task_managment

# Copy Gemfile and Gemfile.lock
COPY Gemfile /task_managment/Gemfile
COPY Gemfile.lock /task_managment/Gemfile.lock

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . /task_managment

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
