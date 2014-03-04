#! /usr/bin/env bash

git clone git@github.com:rvagg/npmjs.org.git -b new-install-docs mpm-couch-setup;
cd mpm-couch-setup;
curl -X DELETE 'http:localhost:5984/registry';
curl -X PUT 'http:localhost:5984/registry';

npm install;
npm config set _npmjs.org:couch=http://localhost:5984/registry
npm start;
npm run load;
npm run copy;
