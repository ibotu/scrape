# Use the official WordPress image as the base
FROM wordpress:latest

# Install Python and pip for the scraping app
RUN apt-get update && apt-get install -y python3 python3-pip

# Install Caddy
RUN apt-get install -y debian-keyring debian-archive-keyring apt-transport-https
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | apt-key add -
RUN curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list
RUN apt-get update
RUN apt-get install caddy

# Copy the Caddyfile (replace this with your actual Caddyfile)
COPY Caddyfile /etc/caddy/Caddyfile

# Expose the Caddy port
EXPOSE 2015