class AwsS3Sdk < Formula
  desc "AWS SDK for C++, installs only S3 + dependencies"
  homepage "https://github.com/aws/aws-sdk-cpp"
  url "https://github.com/aws/aws-sdk-cpp/archive/1.3.18.tar.gz"
  sha256 "f1d51eadb20c8e745115e882068cc9ba11b4f55612c4001da957743c680889b3"
  head "https://github.com/aws/aws-sdk-cpp.git"

  option "with-static", "Build with static linking"
  option "without-http-client", "Don't include the libcurl HTTP client"

  depends_on "cmake" => :build

  def install
    args = std_cmake_args
    args << '-DBUILD_ONLY=s3;core;transfer;config'
    args << '-DSTATIC_LINKING=1' if build.with? "static"
    args << '-DNO_HTTP_CLIENT=1' if build.without? "http-client"
    mkdir "build" do
      system "cmake", "..", *args
      system "make"
      system "make", "install"
    end
    lib.install Dir[lib/"mac/Release/*"].select { |f| File.file? f }
  end

  test do
    (testpath/"test.cpp").write <<~EOS
      #include <aws/core/Version.h>
      #include <iostream>

      int main() {
          std::cout << Aws::Version::GetVersionString() << std::endl;
          return 0;
      }
    EOS
    system ENV.cxx, "test.cpp", "-o", "test", "-L#{lib}", "-laws-cpp-sdk-core"
    system "./test"
  end
end
