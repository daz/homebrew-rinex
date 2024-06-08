class Lastools < Formula
  desc "Efficient tools for LiDAR processing"
  homepage "https://rapidlasso.com/LAStools"
  url "https://github.com/LAStools/LAStools/archive/refs/tags/v2.0.3.tar.gz"
  sha256 "b6c6ac33835ead2c69d05e282febc266048ba071a71dae6fdad321d532dfcf78"
  license "NOASSERTION"

  depends_on "cmake" => :build
  depends_on "jpeg"
  depends_on "libpng"
  depends_on "libtiff"
  depends_on "zlib"
  depends_on "proj"
  depends_on "xz"
  depends_on "jbig2dec"
  depends_on "zstd"
  depends_on "libgeotiff"
  depends_on "webp"
  depends_on "sqlite"

  def install
    mkdir "build" do
      system "cmake", "..", "-DCMAKE_BUILD_TYPE=Release", *std_cmake_args
      system "cmake", "--build", "."
      system "cmake", "--install", "."
    end

    # Remove the "64" suffix from the installed binaries
    bin.children.each do |file|
      new_name = file.basename.to_s.sub(/64$/, '')
      mv file, bin/new_name unless new_name == file.basename.to_s
    end
  end

  test do
    binaries = %w[
      las2las
      las2txt
      lascopcindex
      lasdiff
      lasindex
      lasinfo
      lasmerge
      lasprecision
      laszip
      txt2las
    ]

    binaries.each do |bin_name|
      system "#{bin}/#{bin_name}", "-h"
    end
  end
end
