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
    depends_on "blosc"

    def install
	# Build and install TileDB
	mkdir "build"
	cd "build" do
            system "../bootstrap", "--prefix=#{prefix}"
	    system "make install"
	end
    end

    test do
        (testpath/"test.cpp").write <<~EOS
            #include "tiledb.h"
	    #include "assert.h"
	    int main() {
	        int major = 0;
		int minor = 0;
		int patch = 0;
		int rc = tiledb_version(&major,&minor,&patch);
		assert(rc == TILEDB_OK);
		return 0;
	    }
	EOS
	system ENV.cc, "test.cpp", "-L#{lib}", "-ltiledb", "-o", "test"
	system "./test"
    end
end
