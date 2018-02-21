class Tiledb < Formula
    desc "Storage management library for sparse and dense array data"
    homepage "http://tiledb.io"
    url "https://github.com/TileDB-Inc/TileDB/archive/1.1.0.tar.gz"
    sha256 "9c1b8ee9edeed28a43c445ca861470d309b17d73e2e1a70c57424bc188bb2b33"
    version "1.2.0"
	
    head "https://github.com/TileDB-Inc/TileDB.git", :branch => "dev"

    option "with-debug", "Enables building with debug information"
    option "with-verbose", "Enables building with verbose status messages"
    option "with-hdfs",  "Enables building with HDFS integration"
    option "with-s3",    "Enables building with S3 object store integration"

    depends_on "cmake" => :build
    depends_on "lzlib"
    depends_on "lz4"
    depends_on "bzip2"
    depends_on "zstd"
    depends_on "blosc"

    if build.with? "s3"
        depends_on "aws-s3-sdk"
    end

    def install
	# Build and install TileDB
	mkdir "build"
	cd "build" do
	    args = %W[
	      --prefix=#{prefix}
            ]
	    args << "--enable-debug" if build.with? "debug"
	    args << "--enable-verbose" if build.with? "verbose"
	    args << "--enable-hdfs" if build.with? "hdfs"
	    args << "--enable-s3" if build.with? "s3"

            system "../bootstrap", *args
	    system "make"
	    system "make", "install"
	end
    end

    test do
        (testpath/"test_tiledb.cpp").write <<~EOS
            #include "tiledb.h"
	    #include "assert.h"
	    int main() {
	        int major = 0;
		int minor = 0;
		int patch = 0;
		tiledb_version(&major,&minor,&patch);
		return 0;
	    }
	EOS
	system ENV.cc, "test_tiledb.cpp", "-L#{lib}", "-ltiledb", "-o", "test"
	system "./test"
    end
end
