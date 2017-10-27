class Tiledb < Formula
    desc "Storage management library for sparse and dense array data"
    homepage "http://tiledb.io"
    url "https://github.com/TileDB-Inc/TileDB/archive/1.0.0.tar.gz"
    sha256 "35711e6155b9d3e08f2a25a388187eec4f175e5660a8b7a4e0cee68a7ea57f47"
    version "1.0.0"
	
    depends_on "cmake" => :build
    depends_on "lzlib"
    depends_on "lz4"
    depends_on "bzip2"
    depends_on "zstd"

    def install
	# Build and install Blosc
	# TODO:
	# Build and install TileDB
	mkdir "build"
	cd "build" do
            system "../bootstrap", "--prefix=#{prefix}"
	    system "make install"
	end
    end
end
