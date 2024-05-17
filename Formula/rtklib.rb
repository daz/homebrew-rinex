class Rtklib < Formula
  desc "A version of RTKLIB optimized for single and dual frequency low cost GPS receivers, especially u-blox receivers.  It is based on RTKLIB 2.4.3 and is kept reasonably closely synced to that branch.  Documentation for RTKLIB is available at rtklib.com.   This software is provided “AS IS” without any warranties of any kind so please be careful, especially if using it in any kind of real-time application.  Binaries and tutorials for this code, and sample GPS data sets at :                "
  homepage "http://rtkexplorer.com/"
  url "https://github.com/daz/RTKLIB.git", :branch => "demo5"
  version "b34i"
  license "BSD-2-Clause"

  depends_on "gcc" => :build
  depends_on "libpthread-stubs" => :build

  def install
    ENV["HOMEBREW_CC"] = "#{Formula["gcc"].opt_bin}/gcc-#{Formula["gcc"].any_installed_version.major}"

    cd "app/consapp" do
      system "make", "all"
    end

    bin.install "app/consapp/convbin/gcc/convbin"
    bin.install "app/consapp/pos2kml/gcc/pos2kml"
    bin.install "app/consapp/rnx2rtkp/gcc/rnx2rtkp"
    bin.install "app/consapp/rtkrcv/gcc/rtkrcv"
    bin.install "app/consapp/str2str/gcc/str2str"
  end

  test do
    system "#{bin}/convbin", "-h"
    system "#{bin}/pos2kml", "-h"
    system "#{bin}/rnx2rtkp", "--help"
    system "#{bin}/rtkrcv", "-h"
    system "#{bin}/str2str", "-h"
  end
end
