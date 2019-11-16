FROM heroku/heroku:18-build

WORKDIR /app

ENV STACK=heroku-18

RUN mkdir -p /app /var/env /tmp/build-cache /tmp/heroku-buildpack-tex

# Setup Sphinx test docs
COPY . /tmp/heroku-buildpack-tex

COPY .tests /app

# Install Sphinx buildpack
RUN /tmp/heroku-buildpack-tex/bin/compile /app /var/env /tmp/build-cache

ENV PATH="/app/.texlive/bin/x86_64-linux:$PATH"

CMD bash
