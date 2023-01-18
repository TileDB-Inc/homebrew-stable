class Tiledb < Formula
  desc "Storage management library for sparse and dense array data"
  homepage "https://tiledb.com"
  url "https://github.com/TileDB-Inc/TileDB/archive/refs/tags/2.14.0.tar.gz"
  sha256 "e161d7988fa6e4e2e6238e25cbc0941bb2ed5eb375257d96ad7ce518864cd7f4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.14.0/tiledb-macos-arm64-2.14.0-27eed08.tar.gz"
    sha256 "9fcd22079e2b7f3af07a97a05f3a5463811d28d352be157947aae1ac13752739"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.14.0/tiledb-macos-x86_64-2.14.0-27eed08.tar.gz"
    sha256 "ecdbfe58c89d06a63cb87c3e730cfd28dd18e52e7b634b45809603ae3bc79353"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.14.0/tiledb-linux-x86_64-2.14.0-27eed08.tar.gz"
    sha256 "402b20917b9d8b072d506e399f909444f8c45a40307493ea09eadfddb1f4bedc"
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
