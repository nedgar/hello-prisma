# hello-prisma

The Prisma ORM example created by following: https://www.prisma.io/docs/getting-started/setup-prisma/start-from-scratch/relational-databases-typescript-postgresql
but using SQLite instead of PostgreSQL.

To install:
```bash
npm install
```

To initialize DB and run migrations:
```bash
npm run migrate:dev
```

To run example update and query:
```bash
npm run dev
```


## Prisma binaries

To get Prisma to install binaries for platforms other than just the current one:

```bash
export PRISMA_CLI_BINARY_TARGETS=windows,darwin,darwin-arm64,linux-arm64-openssl-3.0.x,linux-musl-arm64-openssl-3.0.x
cd node_modules/@prisma/engines
npm run install
```

Then check for the binaries in `node_modules/@prisma/engines` and `node_modules/prisma`.

Other Prisma commands also download the needed binaries, e.g.:
- `npx prisma -v` (for dev time, with binaries in `node_modules/@prisma/engines`)
- `npx prisma generate` (for runtime, with binaries in `node_modules/prisma`)

The runtime platforms are specified in `prisma/prisma.schema` -> `generator client` section -> `binaryTargets`.

Note that downloaded binaries (and their SHA256 hashes) are cached under `~/.cache/prisma`. This directory can be deleted to force re-download.

## Debugging
```bash
DEBUG="prisma:*" npx prisma ...
```
then narrow down as needed, e.g.:

```bash
DEBUG="prisma:engines,prisma:download" npx prisma -v
```
