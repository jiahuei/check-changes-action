#!/usr/bin/env bash

set -e

git tag -d v0 v0.2 v0.2.0
git push origin --delete v0 v0.2 v0.2.0

git tag v0
git tag v0.2
git tag v0.2.0
git push origin v0
git push origin v0.2
git push origin v0.2.0
