class Tiledb < Formula
    desc "Storage management library for sparse and dense array data"
    homepage "http://tiledb.com"
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.1.2/tiledb-macos-2.1.2-4d3be6b-full.tar.gz"
    sha256 "bded21c297388338cfd833124af4d46ec2b1e2520305208d74a1e4331251d5d7"
    version "2.1.2"

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
