# Install TileDB from brew

[![Build Status](https://travis-ci.org/TileDB-Inc/homebrew-stable.svg?branch=master)](https://travis-ci.org/TileDB-Inc/homebrew-stable)

Official [Homebrew](https://brew.sh/) packages for TileDB.

## Install TileDB (from stable tap)

The latest stable verison of [TileDB v2.14.0](https://github.com/TileDB-Inc/TileDB/releases/tag/2.14.0)

```
brew install tiledb-inc/stable/tiledb
```

To see all build build options use `brew info tiledb`

```
brew info tiledb

==> tiledb: stable 2.13.0
Storage management library for sparse and dense array data
https://tiledb.com
/opt/homebrew/Cellar/tiledb/2.13.0 (57 files, 22.3MB) *
  Built from source on 2022-12-06 at 14:20:30
From: https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/tiledb.rb
License: MIT
```

To test that the install worked correctly:

```
brew test tiledb
```

## Upgrade TileDB (to a new version)

If tiledb version was installed with `--HEAD` flag, to get the latest `dev` commit first `brew unintsall tiledb` and intstall again with `--HEAD` flag.

```
brew upgrade tiledb
```

## Uninstall TileDB

```
brew uninstall tiledb
```

## Install from local source tree

```
cd </path/to/homebrew-stable>
brew install --build-from-source ./tiledb.rb
```
