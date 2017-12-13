build:
	go build -o releases/travis-ci-examples

rpm: build
	@ mkdir -p rpmbuild/usr/local/bin/
	@ cp -f releases/travis-ci-examples rpmbuild/usr/local/bin/travis-ci-examples
	@ fpm -s dir -t rpm \
		--rpm-os linux \
		--name travis-ci-examples --version 1.0.0 --iteration 1 \
		--maintainer "subchen@gmail.com" --vendor "Guoqiang Chen" \
		--license "Apache 2" \
		--url "https://github.com/subchen/travis-ci-examples" \
		--description "example for travis-ci.org" \
		-C rpmbuild/ \
		--package ./releases/

release: build rpm
