# Install TileDB from brew

[![Build Status](https://travis-ci.org/TileDB-Inc/homebrew-stable.svg?branch=master)](https://travis-ci.org/TileDB-Inc/homebrew-stable)

Official [Homebrew](https://brew.sh/) packages for TileDB.

## Install TileDB (from stable tap)

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
tiledb-inc/stable/tiledb: stable 1.2.0, HEAD
Storage management library for sparse and dense array data
http://tiledb.io
/usr/local/Cellar/tiledb/1.2.0 (37 files, 4.8MB) *
  Built from source on 2018-02-20 at 18:32:15
From: https://github.com/tiledb-inc/homebrew-stable/blob/master/tiledb.rb
==> Dependencies
Build: cmake ✔
Required: lzlib ✔, lz4 ✔, bzip2 ✔, zstd ✔, blosc ✔
==> Options
--with-debug
	Enables building with debug information
--with-hdfs
	Enables building with HDFS integration
--with-s3
	Enables building with S3 object store integration
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

If tiledb version was installed with `--HEAD` flag, to get the latest `dev` commit first unintall and intstall again with `--HEAD`
```
brew upgrade tiledb
```

## Uninstall TileDB

```
brew uninstall tiledb
```
