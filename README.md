# Install TileDB from brew

[![Build Status](https://travis-ci.org/TileDB-Inc/homebrew-stable.svg?branch=master)](https://travis-ci.org/TileDB-Inc/homebrew-stable)

Official [Homebrew](https://brew.sh/) packages for TileDB.

## Install TileDB (from stable tap)

```
brew install tiledb-inc/stable/tiledb
```

Install the lastest development version of TileDB

```
brew install tiledb-inc/stable/tiledb --HEAD
```

To see all build build options use `brew info tiledb`

```
TileDB/homebrew-stable [master] » brew info tiledb
tiledb-inc/stable/tiledb: stable 1.1.0, HEAD
Storage management library for sparse and dense array data
http://tiledb.io
/usr/local/Cellar/tiledb/HEAD-4134529 (8 files, 29MB) *
  Built from source on 2017-11-28 at 12:51:29 with: --with-debug --with-verbose
From: https://github.com/tiledb-inc/homebrew-stable/blob/master/tiledb.rb
==> Dependencies
Build: cmake ✔
Required: lzlib ✔, lz4 ✔, bzip2 ✔, zstd ✔, blosc ✔
==> Options
--with-debug
	Enables building with debug information
--with-hdfs
	Enables building with HDFS integration
--HEAD
	Install HEAD version
```

To test that the install worked correctly:

```
brew test tiledb
```

## Upgrade TileDB (to a new version)

```
brew upgrade tiledb
```

## Uninstall TileDB

```
brew uninstall tiledb
```
