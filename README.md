# Install TileDB from brew

[![Build Status](https://travis-ci.org/TileDB-Inc/homebrew-stable.svg?branch=master)](https://travis-ci.org/TileDB-Inc/homebrew-stable)

Official [Homebrew](https://brew.sh/) packages for TileDB.

## Install TileDB (from stable tap)

The latest stable verison of [TileDB v2.0.1](https://github.com/TileDB-Inc/TileDB/releases/tag/2.0.1)

```
brew install tiledb-inc/stable/tiledb
```

Install the lastest development version of TileDB (`dev` branch from https://github.com/TileDB-Inc/TileDB)

```
brew install tiledb-inc/stable/tiledb --HEAD
```

To see all build build options use `brew info tiledb`

```
TileDB/homebrew-stable [release-2.0.1●] » brew info tiledb

tiledb: stable 2.0.1, HEAD
Storage management library for sparse and dense array data
http://tiledb.io
/usr/local/Cellar/tiledb/2.0.1 (36 files, 7.3MB) *
  Built from source on 2018-10-26 at 09:16:22
From: /Users/jacobbolewski/TileDB/homebrew-stable/tiledb.rb
==> Dependencies
Build: cmake ✔
Required: aws-sdk-cpp ✔, tbb ✔, lzlib ✔, lz4 ✔, bzip2 ✔, zstd ✔
==> Options
--with-debug
	Enables building with debug information
--with-verbose
	Enables building with verbose status messages
--with-serialization
        Enables the building with REST serialization support
--HEAD
	Install HEAD version
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
