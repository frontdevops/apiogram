#!/usr/bin/env bash

#python setup.py sdist bdist_wheel
#twine upload --repository-url https://test.pypi.org/legacy/ dist/*
# check-manifest

ver="0.1.10"

git pull origin main
git add --all .
git commit -m "🐛 Fix some, update any, refactor code. 🚀 v$ver"
git push origin main
git tag -a "$ver" -m "🚀 v$ver"
git push origin --tags


echo "Delete current dist..."
rm -vrf dist
rm -vrf apiogram/*.egg-info

python -m build
python -m twine upload --verbose dist/*

#python -m twine upload --verbose --repository testpypi dist/*
