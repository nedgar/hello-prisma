#!/bin/bash -x

# Downloads the binaries needed for both the dev and runtime platforms.
#
# To configure target platforms, see: https://www.prisma.io/docs/guides/deployment/deploy-to-a-different-os
#
# After modifying binaryTargets in schema.prisma, to see which binaries it downloads:
# - delete any previously downloaded binaries in node_modules/prisma (for run time) and node_modules/@prisma/engines (for dev)
# - delete cached binaries under ~/.cache/prisma
# - run: `DEBUG="prisma:engines,prisma:download" npx prisma generate`

COMMIT_HASH="4bc8b6e1b66cb932731fb1bdbbc550d1e010de81"
BUCKET="https://binaries.prisma.sh/all_commits/${COMMIT_HASH}"
DEST=./${COMMIT_HASH}
CURL="curl --fail -o -"

mkdir -p ${DEST}

${CURL} ${BUCKET}/darwin/libquery_engine.dylib.node.gz | gunzip > ${DEST}/libquery_engine-darwin.dylib.node
${CURL} ${BUCKET}/darwin/migration-engine.gz | gunzip > ${DEST}/migration-engine-darwin
${CURL} ${BUCKET}/darwin-arm64/libquery_engine.dylib.node.gz | gunzip > ${DEST}/libquery_engine-darwin-arm64.dylib.node
${CURL} ${BUCKET}/darwin-arm64/migration-engine.gz | gunzip > ${DEST}/migration-engine-darwin-arm64
# ${CURL} ${BUCKET}/debian-openssl-1.1.x/libquery_engine.so.node.gz | gunzip > ${DEST}/libquery_engine-debian-openssl-1.1.x.so.node
# ${CURL} ${BUCKET}/debian-openssl-1.1.x/migration-engine.gz | gunzip > ${DEST}/migration-engine-debian-openssl-1.1.x
${CURL} ${BUCKET}/linux-musl-openssl-3.0.x/libquery_engine.so.node.gz | gunzip > ${DEST}/libquery_engine-linux-musl-openssl-3.0.x.so.node
${CURL} ${BUCKET}/linux-musl-openssl-3.0.x/migration-engine.gz | gunzip > ${DEST}/migration-engine-linux-musl-openssl-3.0.x
${CURL} ${BUCKET}/windows/query_engine.dll.node.gz | gunzip > ${DEST}/query_engine-windows.dll.node
${CURL} ${BUCKET}/windows/migration-engine.exe.gz | gunzip > ${DEST}/migration-engine-windows.exe
