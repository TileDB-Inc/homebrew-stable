class Tiledb < Formula
    desc "Storage management library for sparse and dense array data"
    homepage "http://tiledb.com"
    url "https://github.com/TileDB-Inc/TileDB/archive/2.1.1.tar.gz"
    sha256 "0df697ce9ac5858c9abc3d645f0fd96903b6512b33cf09ed4fc74d0cd4d78eec"
    version "2.1.1"

    head "https://github.com/TileDB-Inc/TileDB.git", :branch => "dev"

    depends_on "cmake" => :build
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
              --enable-azure
              --enable-gcs
              --enable-hdfs
              --enable-serialization
              --disable-tests
            ]

            system "../bootstrap", *args

            system "make", "-j4"
            system "make", "-j4", "-C", "tiledb"
            system "make", "-j4", "-C", "tiledb", "install"
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
