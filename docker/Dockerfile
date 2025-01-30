FROM debian:unstable

############
# apt repo #
############

ENV DEBIAN_PRIORITY=critical
ENV DEBIAN_FRONTEND=noninteractive

RUN truncate --size=0 /etc/apt/sources.list
RUN rm -rf /etc/apt/sources.list.d
RUN mkdir -p /etc/apt/sources.list.d
COPY debian-testing.list /etc/apt/sources.list.d/

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    debian-ports-archive-keyring

COPY debian-unstable.list /etc/apt/sources.list.d/

RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y --no-install-recommends \
    aptitude

##################
# basic packages #
##################

RUN apt-get update && apt-get install -y --no-install-recommends \
  file cpio coreutils time \
  sudo bash-completion \
  gettext gettext-base \
  gzip bzip2 xz-utils unzip \
  dos2unix recode

############
# security #
############

RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates \
  pinentry-curses \
  gnupg \
  pass pass-otp

###########
# network #
###########

RUN apt-get update && apt-get install -y --no-install-recommends \
  openssh-client \
  curl \
  wget

#################
# documentation #
#################

RUN apt-get update && apt-get install -y --no-install-recommends \
  man-db manpages manpages-dev manpages-posix manpages-posix-dev

#######
# vcs #
#######

RUN apt-get update && apt-get install -y --no-install-recommends \
  git

########
# text #
########

RUN apt-get update && apt-get install -y --no-install-recommends \
  vim-nox \
  ripgrep \
  less \
  jq \
  icdiff

###################
# build/dev tools #
###################

RUN apt-get update && apt-get install -y --no-install-recommends \
  make \
  build-essential \
  gdb cgdb \
  cmake meson ninja-build

#############
# utilities #
#############

RUN apt-get update && apt-get install -y --no-install-recommends \
  bc

##########
# python #
##########

RUN apt-get update && apt-get install -y --no-install-recommends \
  python-is-python3 \
  python3

########
# ruby #
########

RUN apt-get update && apt-get install -y --no-install-recommends \
  ruby \
  ruby-rails

#######
# c++ #
#######

RUN apt-get update && apt-get install -y --no-install-recommends \
  clang g++

######
# go #
######

RUN apt-get update && apt-get install -y --no-install-recommends \
  golang-go

#######
# lua #
#######

RUN apt-get update && apt-get install -y --no-install-recommends \
  lua5.4

########
# java #
########

RUN apt-get update && apt-get install -y --no-install-recommends \
  default-jdk-headless \
  junit4

#########################
# javascript/typescript #
#########################

RUN apt-get update && apt-get install -y --no-install-recommends \
  nodejs \
  node-typescript \
  npm yarnpkg \
  jest ts-jest

########
# rust #
########

RUN apt-get update && apt-get install -y --no-install-recommends \
  rustc \
  cargo

######
# c# #
######

RUN apt-get update && apt-get install -y --no-install-recommends \
  mono-devel \
  mono-csharp-shell \
  mono-utils \
  cli-common

###########
# haskell #
###########

RUN apt-get update && apt-get install -y --no-install-recommends \
  ghc

#####
# R #
#####

RUN apt-get update && apt-get install -y --no-install-recommends \
  r-recommended

#############
# provision #
#############

COPY import-profile ~/.import-profile

##########
# finish #
##########

RUN apt-get update && apt-get upgrade -y
RUN apt autoremove --purge -y
RUN apt-get clean -y
RUN rm -rf /var/lib/apt/lists/*

RUN cd && echo "source ~/.import-profileprofile" >> ~/.bashrc

##############
# entrypoint #
##############

WORKDIR "/src"
ENTRYPOINT ["bash", "-o", "history"]
