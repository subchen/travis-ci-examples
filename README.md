# travis-ci-examples
A test project for travis-ci

[![Build Status](https://travis-ci.org/subchen/travis-ci-examples.svg?branch=master)](https://travis-ci.org/subchen/travis-ci-examples)
[![License](http://img.shields.io/badge/License-Apache_2-red.svg?style=flat)](http://www.apache.org/licenses/LICENSE-2.0)

## Encrype GitHub Token

```
gem install travis

GITHUB_TOKEN=5f48b3eb....
travis login --github-token=$GITHUB_TOKEN
travis encrypt -r subchen/travis-ci-examples $GITHUB_TOKEN
```
