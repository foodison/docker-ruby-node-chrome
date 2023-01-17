ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION

ENV LANG C.UTF-8
ENV TZ /usr/share/zoneinfo/Asia/Tokyo

# node
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# yarn
RUN npm i -g yarn bower

# mecab
RUN apt-get update && \
    apt-get install -y --no-install-recommends mecab mecab-ipadic && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV MECAB_PATH /usr/lib/x86_64-linux-gnu/libmecab.so.2.0.0

# chrome
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends google-chrome-stable && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
