class Tiledb < Formula
  desc "Storage management library for sparse and dense array data"
  homepage "https://tiledb.com"
  url "https://github.com/TileDB-Inc/TileDB/archive/refs/tags/2.11.3.tar.gz"
  sha256 "30375e953ca14584008cde4d722d0b084e862304a51282bc3ce5688e122af82f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.11.3/tiledb-macos-arm64-2.11.3-a55a910.tar.gz"
    sha256 "aa665070e16abcad30bb34069064e7795bdda7df3bfe8087500f7295be083969"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.11.3/tiledb-macos-x86_64-2.11.3-a55a910.tar.gz"
    sha256 "8eb10a7ba0858a666561a9d546f35b36b6792ed6f1d74812d74a39ec0c6dd8e0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.11.3/tiledb-linux-x86_64-2.11.3-a55a910.tar.gz"
    sha256 "84f5cfdab9b105c29dba74486ddd632a95cc975a884857f5615436c991a490e6"
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
