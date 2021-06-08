class Tiledb < Formula
    desc "Storage management library for sparse and dense array data"
    homepage "http://tiledb.com"
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.3.0/tiledb-macos-2.3.0-a87da7f-full.tar.gz"
    sha256 "2c336d9ad0e7526e1af678ca26f3d8f81844ef1c1eb2141e66e44184e0f68213"
    version "2.3.0"

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
