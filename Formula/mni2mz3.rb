class Mni2Mz3 < Formula
  desc "Brain imaging surface mesh file format converter"
  if Hardware::CPU.type == :arm
    url "https://github.com/FNNDSC/mni2mz3/releases/download/v0.1.0-rc.1/mni2mz3-aarch64-apple-darwin.tar.gz"
    sha256 "1726e1a1c98a3d04f7f339baa217d3c0923fc253337570a5b087f52fa46e198b"
  else
    url "https://github.com/FNNDSC/mni2mz3/releases/download/v0.1.0-rc.1/mni2mz3-x86_64-apple-darwin.tar.gz"
    sha256 "5b70df5476832b1fd8354adbf23d0dac9dd9fd3fab1a698214199cdc676c7656"
  end
  version "0.1.0-rc.1"
  license "MIT"

  def install
    bin.install "mni2mz3"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
