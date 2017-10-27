class Blosc < Formula
    desc "A blocking, shuffling and loss-less compression library"
    homepage "http://blosc.org"
    url "https://github.com/Blosc/c-blosc/archive/v1.12.1.tar.gz"
    sha256 "e04535e816bb942bedc9a0ba209944d1eb34e26e2d9cca37f114e8ee292cb3c8"
    version "1.12.1"
	
    depends_on "cmake" => :build
    depends_on "lzlib"
    depends_on "lz4"
    depends_on "bzip2"
    depends_on "zstd"
    depends_on "snappy"

    def install
	# Build and install TileDB
	mkdir "build"
	cd "build" do
	    system "cmake", "..", 
		    "-DPREFER_EXTERNAL_LZ4=ON",
		    "-DPREFER_EXTERNAL_SNAPPY=ON",
		    "-DPREFER_EXTERNAL_ZLIB=ON",
		    "-DPREFER_EXTERNAL_ZSTD=ON",
		    *std_cmake_args
	    system "make install"
	end
    end
end
