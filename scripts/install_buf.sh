#!/usr/bin/env bash
# Copyright (c) 2023 Nida Tech AB. All rights reserved.

# Exit on any error
set -o errexit
set -o pipefail
set -o nounset

PREFIX="${HOME}/.local"
BUF_VERSION="v1.23.1"
PROTOC_VERSION="25.0"

# buf
wget "https://github.com/bufbuild/buf/releases/download/${BUF_VERSION}/buf-Linux-x86_64.tar.gz" -O- | tar -xvzf - -C "${PREFIX}" --strip-components 1

# protoc
TEMPFILE=$(mktemp)
wget "https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip" -O "${TEMPFILE}"
unzip "${TEMPFILE}" -d "${PREFIX}"
rm "${TEMPFILE}"

buf --version
protoc --version
