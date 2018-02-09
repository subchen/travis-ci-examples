GITHUB_TOKEN = ""
BINTRAY_SUBJECT = ""
BINTRAY_APIKEY = ""

APP_NAME = "travis-ci-examples"
APP_VERSION = "1.0.0"

export GITHUB_TOKEN BINTRAY_SUBJECT BINTRAY_APIKEY
export APP_NAME APP_VERSION

build:
	env
	go build -o _releases/$(APP_NAME)

rpm: build
	@ mkdir -p rpmbuild/usr/local/bin/
	@ cp -f _releases/$(APP_NAME) rpmbuild/usr/local/bin/$(APP_NAME)
	@ fpm -s dir -t rpm \
		--rpm-os linux \
		--name $(APP_NAME) --version $(APP_VERSION) --iteration 1 \
		--maintainer "Guoqiang Chen <subchen@gmail.com>" \
		--license "Apache 2" \
		--url "https://github.com/subchen/travis-ci-examples" \
		--description "example for travis-ci.org" \
		-C rpmbuild/ \
		--package _releases/

release: build rpm
