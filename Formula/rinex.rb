class Rinex < Formula
  desc "Utils for RINEX and GNSS data processing"
  homepage "https://github.com/georust/rinex"
  url "https://github.com/georust/rinex/archive/refs/tags/v0.16.1.tar.gz"
  sha256 "ae0030310431c2cfb4650ff48f2f1b19bf348f4795c68678c68b2a87234ec543"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--features", "full"

    # Install only specific binaries
    bin.install "target/release/crx2rnx"
    bin.install "target/release/rinex-cli"
    bin.install "target/release/rnx2crx"
    bin.install "target/release/ublox-rnx"
  end

  test do
    system "#{bin}/crx2rnx", "--version"
    system "#{bin}/rinex-cli", "--version"
    system "#{bin}/rnx2crx", "--version"
    system "#{bin}/ublox-rnx", "--version"
  end
end
