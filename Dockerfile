FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install libfontconfig libfreetype6 software-properties-common curl  -y
RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs
RUN apt-get install -y ca-certificates \
fonts-liberation \
libasound2 \
libatk-bridge2.0-0 \
libatk1.0-0 \
libc6 \
libcairo2 \
libcups2 \
libdbus-1-3 \
libexpat1 \
libfontconfig1 \
libgbm1 \
libgcc1 \
libglib2.0-0 \
libgtk-3-0 \
libnspr4 \
libnss3 \
libpango-1.0-0 \
libpangocairo-1.0-0 \
libstdc++6 \
libx11-6 \
libx11-xcb1 \
libxcb1 \
libxcomposite1 \
libxcursor1 \
libxdamage1 \
libxext6 \
libxfixes3 \
libxi6 \
libxrandr2 \
libxrender1 \
libxss1 \
libxtst6 \
lsb-release \
wget \
xdg-utils

RUN add-apt-repository ppa:saiarcot895/chromium-beta
RUN apt-get update
RUN apt install -y chromium-browser

RUN npm init -y
COPY ./.puppeteerrc.cjs .
RUN npm install --global chromium puppeteer --unsafe-perm=true --allow-root
RUN node ./usr/lib/node_modules/puppeteer/install.js
RUN npm install --global xvfb pageres-cli --unsafe-perm

RUN mkdir /pageres
WORKDIR /pageres
RUN addgroup --gid 1000 pageres
RUN adduser --uid 1000 --gid 1000 pageres --home /pageres --no-create-home --disabled-password --gecos ''
RUN chown -R pageres.pageres /pageres

RUN apt-get autoremove

ADD run.sh /run.sh
RUN chmod +x /run.sh

USER pageres
ENTRYPOINT ["/run.sh"]
# ENTRYPOINT ["pageres"]
