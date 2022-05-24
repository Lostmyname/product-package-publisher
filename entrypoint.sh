#!/bin/sh

set -e

if [ -z "$INPUT_MUSE_NPM_AUTH_TOKEN" ]
then
  echo "Muse NPM auth token must be defined"
  return -1
fi

echo "Updating product version"
git pull
git config --global user.email 'dev@wonderbly.com'
git config --global user.name 'lostmybot'
echo "//npm.pkg.github.com/:_authToken=$INPUT_MUSE_NPM_AUTH_TOKEN" >> .npmrc
git update-index --assume-unchanged .npmrc

if [ ${{ $INPUT_GITHUB_REF == 'refs/heads/master' }} ]
then
  yarn version --minor
  echo "Publishing package on latest version"
  yarn publish --tag latest
fi

if [ ${{ $INPUT_GITHUB_EVENT_ACTION == 'opened' }} ]
then
  yarn version --preminor --preid prerelease
  echo "Publishing package on prerelease version"
  yarn publish --tag prerelease
fi

if [ ${{ $INPUT_GITHUB_EVENT_ACTION == 'synchronize' }} ]
then
  yarn version --prerelease --preid prerelease
  echo "Publishing package on prerelease version"
  yarn publish --tag prerelease
fi

echo "Pushing updated tags"
git push --follow-tags
echo "Successfully released version!"

