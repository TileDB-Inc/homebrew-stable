class Tiledb < Formula
  desc "Storage management library for sparse and dense array data"
  homepage "https://tiledb.com"
  url "https://github.com/TileDB-Inc/TileDB/archive/refs/tags/2.15.0.tar.gz"
  sha256 "99d89f6fece0f14904b6b215721d3da0d7ab2d98145793d9256a0a1edf01c12d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.15.0/tiledb-macos-arm64-2.15.0-1fb59c4.tar.gz"
    sha256 "bc1f2928b21d910cd99374d9ba10e645488ecb2203be23edf87cd584007576ab"
  end

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.15.0/tiledb-macos-x86_64-2.15.0-1fb59c4.tar.gz"
    sha256 "684eb5b3cc9cbcb0c167e906b91fee761a93c1d6e0ebe21c47cfbf6e13037e48"
  end

  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/TileDB-Inc/TileDB/releases/download/2.15.0/tiledb-linux-x86_64-2.15.0-1fb59c4.tar.gz"
    sha256 "62132d37157263f16fca9e29280dc66a497352481cf00d012874cadcb389d1ee"
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
