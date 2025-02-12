# Use the official Ruby base image with a specific version
FROM ruby:2.7.1

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Update mimemagic gem
RUN bundle update mimemagic

# Install dependencies
RUN bundle install && bundle exec rails db:prepare

# Copy the rest of the application code into the container
COPY . .

# Install Node.js dependencies
RUN apt-get update && apt-get install -y nodejs

# Expose the port on which the application will run
EXPOSE 3000

# Start the Rails application
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
