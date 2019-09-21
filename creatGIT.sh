#!/bin/bash

yum -y install git

mkdir /var/git
git init --bare /var/git/base_ssh



