#!/usr/bin/env node

const prettier = require('prettier');

prettier
    .resolveConfigFile()
    .then(prettier.resolveConfig)
    .then(config => console.log(config?.tabWidth || 0));
