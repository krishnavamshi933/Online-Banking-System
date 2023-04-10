# Use the official Ruby image as the base image
FROM ruby:2.7.1

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the working directory
COPY Gemfile Gemfile.lock ./

# Install dependencies using Bundler
RUN bundle install

# Copy the rest of the application files to the working directory
COPY . .

# Set environment variables for the application
ENV RAILS_ENV=development
ENV ONLINE_BANKING_SYSTEM_DATABASE_PASSWORD=devlopment

# Expose port 3000 for the Rails application to run
EXPOSE 3000

# Start the Rails application
CMD bundle exec rails server -b 0.0.0.0
