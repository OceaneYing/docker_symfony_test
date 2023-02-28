

FROM composer:latest
RUN apk update \
  && apk add nano \
  && curl -sS https://get.symfony.com/cli/installer | bash \
  && mv /root/.symfony5/bin/symfony /usr/local/bin/symfony \
  && git config --global user.email "yueh.music@gmail.com" \
  && git config --global user.name "OceaneYing" \
  && echo 'alias ll="ls -al --color"' >> ~/.bashrc \
  && composer require --dev symfony/profiler-pack
WORKDIR /app
COPY . .
CMD symfony server:start