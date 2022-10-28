class Tiledb < Formula
  desc "Storage management library for sparse and dense array data"
  homepage "https://tiledb.com"
  url "https://github.com/TileDB-Inc/TileDB/archive/refs/tags/2.12.0.tar.gz"
  sha256 "212e80769199c13956e1eb31b56a510fb46ee56310234481a6aaf4a07acf2efb"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.12.0/tiledb-macos-arm64-2.12.0-ac8a0df.tar.gz"
    sha256 "15fc3efc1f770680ca7f3a2e67f15b5a37a86cdcf2414eb8629d2124e6c70f54"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.12.0/tiledb-macos-x86_64-2.12.0-ac8a0df.tar.gz"
    sha256 "0e77650ab86cb65cd04f9f6fcb6d8bfc600fd59c03805c6b739a10e7b05e5821"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.12.0/tiledb-linux-x86_64-2.12.0-ac8a0df.tar.gz"
    sha256 "e27a51db6fa19b753cda3c9fca16950fa39126d48687c8f3df23091755df5ea0"
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
