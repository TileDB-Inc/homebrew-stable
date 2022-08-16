class Tiledb < Formula
  desc "Storage management library for sparse and dense array data"
  homepage "https://tiledb.com"
  url "https://github.com/TileDB-Inc/TileDB/archive/refs/tags/2.11.0.tar.gz"
  sha256 "98f1362a1394e6302c35ea388e480ae591031f49d5ee72087ac346191b239958"
  license "MIT"
  depends_on "cmake" => :build
  depends_on "lz4"
  depends_on "zstd"
  depends_on "catch2"
  uses_from_macos "bzip2"
  uses_from_macos "zlib"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args, "-DCMAKE_INSTALL_RPATH=#{rpath}"
      system "make"
      system "make", "install-tiledb"
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
