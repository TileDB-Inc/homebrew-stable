class Tiledb < Formula
    desc "Storage management library for sparse and dense array data"
    homepage "http://tiledb.com"
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.9.1/tiledb-macos-x86_64-2.9.1-1855f7c.tar.gz"
    sha256 "d6243dfb6fd88b1b0bd98b91e4d62c3afc51a56fb0c7f642207cc889030ec110"
    version "2.9.1"

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
