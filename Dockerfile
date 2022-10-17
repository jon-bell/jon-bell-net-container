FROM ubuntu:focal

RUN curl -sL https://deb.nodesource.com/setup_16.x  | bash

RUN apt-get update
RUN apt-get -y install ruby 
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y install texlive-latex-base texlive-fonts-recommended \
    texlive-latex-extra texlive-fonts-extra texlive-bibtex-extra \
    ruby-full build-essential zlib1g-dev locales curl nodejs

RUN gem install jekyll bundler jekyll-sitemap jekyll-seo-tag \
    jekyll-coffeescript jekyll-scholar coffee-script coffee-script-source \
    bibtex-ruby citeproc-ruby csl-styles rexml execjs latex-decode \ 
    citeproc csl namae

ENV LANG C.UTF-8
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8
ENV JEKYLL_NO_BUNDLER_REQUIRE true

