class Tiledb < Formula
    desc "Storage management library for sparse and dense array data"
    homepage "http://tiledb.com"
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.2.2/tiledb-macos-2.2.2-220dd9e-full.tar.gz"
    sha256 "99b2483a8bb99ce45eef6524a15d469fa5e2d64ac2453e1783fea4d1a346b038"
    version "2.2.2"

    def install
        # Build and install TileDB
        prefix.install Dir["*"]
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
