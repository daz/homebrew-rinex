# homebrew-tapname/Formula/rinex.rb
class Rinex < Formula
  desc "RINEX and GNSS data processing"
  homepage "https://github.com/georust/rinex"
  url "https://github.com/georust/rinex/archive/refs/tags/v0.16.1.tar.gz"
  sha256 "ae0030310431c2cfb4650ff48f2f1b19bf348f4795c68678c68b2a87234ec543"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--all-features"
    bin.install Dir["target/release/*"]
  end

  test do
    system "#{bin}/crx2rnx", "--version"
  end
end
