#!/usr/bin/env bash

set -e

git tag -d v0 v0.1
git push origin --delete v0 v0.1

git tag v0
git tag v0.1
git push origin v0
git push origin v0.1
