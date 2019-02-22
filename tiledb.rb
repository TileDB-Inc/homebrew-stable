class Tiledb < Formula
    desc "Storage management library for sparse and dense array data"
    homepage "http://tiledb.io"
    url "https://github.com/TileDB-Inc/TileDB/archive/1.4.2.tar.gz"
    sha256 "20b1b4f97b9e40d36261982835f67f3d2f4f2c8c5d33b6b4709914e55049094d"
    version "1.4.2"
	
    head "https://github.com/TileDB-Inc/TileDB.git", :branch => "dev"

    option "with-debug", "Enables building with debug information"
    option "with-verbose", "Enables building with verbose status messages"

    depends_on "cmake" => :build
    depends_on "tbb"
    depends_on "lzlib"
    depends_on "lz4"
    depends_on "bzip2"
    depends_on "zstd"

    def install
	# Build and install TileDB
	mkdir "build"
	cd "build" do
	    args = %W[
	      --prefix=#{prefix}
              --enable-s3
	      --enable-hdfs
	      --disable-tests
            ]
	    args << "--enable-debug" if build.with? "debug"
	    args << "--enable-verbose" if build.with? "verbose"
            system "../bootstrap", *args

	    system "make"
	    system "make", "-C", "tiledb"
	    system "make", "-C", "tiledb", "install"
	end
    end

    test do
        (testpath/"test_tiledb.cpp").write <<~EOS
            #include "tiledb/tiledb.h"
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
