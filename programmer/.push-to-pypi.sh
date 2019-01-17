#!/bin/bash

if [ -z "$PYPI_USERNAME" ]; then
	echo "\$PYPI_USERNAME not set."
	echo "Not uploading to PyPi."
	exit 0
fi

if [ -z "$PYPI_PASSWORD" ]; then
	echo "\$PYPI_PASSWORD not set."
	echo "Not uploading to PyPi."
	exit 0
fi

if [ "$TRAVIS_BRANCH" != "master" ]; then
	echo "Not on 'master' branch (on $TRAVIS_BRANCH)."
	echo "Not uploading to PyPi."
	exit 0
fi

set -x
set -e

if [ ! -e ~/.pypirc ]; then
	cat > ~/.pypirc <<EOF
[distutils]
index-servers =
    pypi

[pypi]
username:$PYPI_USERNAME
password:$PYPI_PASSWORD
EOF

fi

export SETUPTOOLS_SCM_PRETEND_VERSION="$(python setup.py --version | sed -e's/+.*$//')"
echo "SETUPTOOLS_SCM_PRETEND_VERSION='$SETUPTOOLS_SCM_PRETEND_VERSION'"

python setup.py --version
python setup.py check -m -s
python setup.py install
tinyprog --help
tinyprog --version

python setup.py sdist
python setup.py bdist_wheel --universal

pip install twine
twine upload dist/*
