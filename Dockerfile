# syntax=docker/dockerfile:1
FROM ruby:3.0.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp

# Install ngrok
RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
RUN unzip ngrok-stable-linux-amd64.zip
RUN mv ngrok /usr/local/bin/ngrok
RUN rm ngrok-stable-linux-amd64.zip

COPY ngrok.yml /myapp/ngrok.yml

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
EXPOSE 4040

CMD ["sh", "-c", "ngrok start -config /myapp/ngrok.yml rails_app && rails server -b 0.0.0.0"]

# Configure the main process to run when running the image
# CMD ["rails", "server", "-b", "0.0.0.0"]
