FROM ubuntu:focal

RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y install texlive-latex-base texlive-fonts-recommended \
    texlive-latex-extra texlive-fonts-extra texlive-bibtex-extra \
    build-essential zlib1g-dev locales curl autoconf bison build-essential \
    libssl-dev libyaml-dev libreadline6-dev zlib1g-dev \
    libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev

RUN curl -sL https://deb.nodesource.com/setup_16.x  | bash

RUN apt-get -y install nodejs 

RUN apt-get -y install git

RUN curl -fsSL https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer | bash
ENV RBENV_ROOT /root/.rbenv
ENV PATH $RBENV_ROOT/bin:$RBENV_ROOT/shims:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN echo '# rbenv setup' > /etc/profile.d/rbenv.sh
RUN echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
RUN echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
RUN chmod +x /etc/profile.d/rbenv.sh

ENV RUBY_CONFIGURE_OPTS --with-readline-dir="/usr/lib/x86_64-linux-gnu/libreadline.so"

RUN rbenv install 3.1.2
RUN rbenv global 3.1.2

RUN eval "$(rbenv init -)"

RUN gem install jekyll bundler jekyll-sitemap jekyll-seo-tag \
    jekyll-coffeescript jekyll-scholar coffee-script coffee-script-source \
    bibtex-ruby citeproc-ruby csl-styles rexml execjs latex-decode \ 
    citeproc csl namae

RUN rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8
ENV JEKYLL_NO_BUNDLER_REQUIRE true

