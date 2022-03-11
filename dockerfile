FROM wordpress:latest

# wp-cli support requirements
RUN apt-get update \
    && apt-get install -y sudo less default-mysql-client \
    && rm -rf /var/lib/apt/lists/*

# wp-cli installations
RUN curl -o /bin/wp-cli.phar https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /bin/wp-cli.phar

# copy files to filesystem
COPY fs/ /
RUN chmod +x /bin/wp
