# Install TileDB from brew

[![Build Status](https://travis-ci.org/TileDB-Inc/homebrew-stable.svg?branch=master)](https://travis-ci.org/TileDB-Inc/homebrew-stable)

Official [Homebrew](https://brew.sh/) packages for TileDB.

## Install TileDB (from stable tap)

The latest stable verison of [TileDB v1.3.2](https://github.com/TileDB-Inc/TileDB/releases/tag/1.3.2)

```
brew install tiledb-inc/stable/tiledb
```

Install the lastest development version of TileDB (`dev` branch from https://github.com/TileDB-Inc/TileDB)

```
brew install tiledb-inc/stable/tiledb --HEAD
```

To see all build build options use `brew info tiledb`

```
~ » brew info tiledb
TileDB/homebrew-stable [release-1.3.2●] » brew info tiledb.rb
tiledb: stable 1.3.2, HEAD
Storage management library for sparse and dense array data
http://tiledb.io
/usr/local/Cellar/tiledb/1.3.2 (37 files, 3.3MB) *
  Built from source on 2018-07-26 at 15:38:27
From: /Users/jacobbolewski/TileDB/homebrew-stable/tiledb.rb
==> Dependencies
Build: cmake ✔
Required: aws-sdk-cpp ✔, tbb ✔, lzlib ✔, lz4 ✔, bzip2 ✔, zstd ✔, tiledb-inc/stable/blosc ✔
==> Options
--with-debug
	Enables building with debug information
--with-hdfs
	Enables building with HDFS integration
--with-verbose
	Enables building with verbose status messages
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
