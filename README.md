rosterra-frontend
=================

[![Build Status](https://travis-ci.org/sdob/rosterra-frontend.svg)](https://travis-ci.org/sdob/rosterra-frontend)
[![Coverage Status](https://coveralls.io/repos/sdob/rosterra-frontend/badge.svg)](https://coveralls.io/r/sdob/rosterra-frontend)

This is the Angular frontend for Rosterra.

Prerequisites
-------------

The easiest way to install everything cleanly is into a virtualenv, and
the installation instructions below assume that you're doing this.

* Python 2.7 (for installing into a Node virtualenv)
* pip (for installing into a Node virtualenv)
* Git

Installation
------------

The easiest way is to install everything into a virtualenv.

1. Set up a virtualenv.

        $ mkdir rosterra && cd rosterra
        $ virtualenv venv
        $ source venv/bin/activate

1. Clone this repo.

        $ git clone https://github.com/sdob/rosterra-frontend.git

1. Download Node and build it locally (this will take a while).

        $ curl http://nodejs.org/dist/node-latest.tar.gz | tar xvz
        $ cd node-v*
        $ ./configure --prefix=$VIRTUAL_ENV
        $ make install

1. Install CoffeeScript, Bower, and Grunt.

        $ npm install -g coffee-script bower grunt-cli

1. Install project dependencies.

        $ npm install
        $ bower install

1. Run the tests.

        $ grunt test

1. Make sure that the [backend server](https://github.com/sdob/rosterra-server)
is running and change the value of `BASE_URL` in `app/scripts/app.coffee` if
necessary.

1. Start the dev server.

        $ grunt

1. Visit your dev front-end at (http://localhost:9000/).
