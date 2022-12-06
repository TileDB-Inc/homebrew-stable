class Tiledb < Formula
  desc "Storage management library for sparse and dense array data"
  homepage "https://tiledb.com"
  url "https://github.com/TileDB-Inc/TileDB/archive/refs/tags/2.13.0.tar.gz"
  sha256 "bc5aabc8bb2951a3882b660aa694353de7c22c5ba0a7ab12817452f3f6d2311d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.13.0/tiledb-macos-arm64-2.13.0-db00e70.tar.gz"
    sha256 "090552f639235d9220940c7c74a2ea3d5c4c1e351c00b6098d71230451f2ccb8"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.13.0/tiledb-macos-x86_64-2.13.0-db00e70.tar.gz"
    sha256 "d91cbe1e709d2b8e844dbcb51e29333573accf92b33a0a5a1ce1661c834ced44"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.13.0/tiledb-linux-x86_64-2.13.0-db00e70.tar.gz"
    sha256 "324aecb43cbc16ae7bc0cded1b90e632c36d28b26e45f990922516e5af73428c"
  end

  def install
    prefix.install Dir["*"]
  end

  test do
    (testpath/"test_tiledb.cpp").write <<~EOS
      #include "tiledb/tiledb.h"
      int main() {
          int major = 0;
          int minor = 0;
          int patch = 0;
          tiledb_version(&major,&minor,&patch);
          return 0;
      }
    EOS
    system ENV.cxx, "-std=c++17", "test_tiledb.cpp", "-I#{include}", "-L#{lib}", "-ltiledb", "-o", "test"
    system "./test"
  end
end
