#!/bin/sh
memcached -d
RAILS_ENV=stats rails s -d
