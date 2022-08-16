class Tiledb < Formula
  desc "Storage management library for sparse and dense array data"
  homepage "https://tiledb.com"
  url "https://github.com/TileDB-Inc/TileDB/archive/refs/tags/2.11.0.tar.gz"
  sha256 "98f1362a1394e6302c35ea388e480ae591031f49d5ee72087ac346191b239958"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.11.0/tiledb-macos-arm64-2.11.0-34e5dbc.tar.gz"
    sha256 "fe7266839a39dc55560a7b0560d0ab286e67407b2549ce373adf6bd31cf6f6c3"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.11.0/tiledb-macos-x86_64-2.11.0-34e5dbc.tar.gz"
    sha256 "b62c27dee8599fb2756f75463aa08f6b2d1bbb5346db7df06c9f5785b8ae2df0"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.11.0/tiledb-linux-x86_64-2.11.0-34e5dbc.tar.gz"
    sha256 "f4179de2d6df1eea658e0f9f68c4030b50ba85c0fcd878da8590a8bef0d1c1f3"
  end

  def install
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
