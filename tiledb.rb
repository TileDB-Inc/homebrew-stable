class Tiledb < Formula
    desc "Storage management library for sparse and dense array data"
    homepage "http://tiledb.com"
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.2.9/tiledb-macos-2.2.9-dc3bb54-full.tar.gz"
    sha256 "da72047b0f07f104d644e169078622f8526c0bfe9105641a21b8454b96093c96"
    version "2.2.9"

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
