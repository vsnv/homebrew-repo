class Gai < Formula
  desc "Create graphical UI for CLI tools based on swift-argument-parser."
  homepage "https://github.com/vsnv/gai"
  url "https://github.com/vsnv/gai.git",
      tag:      "1.0.0",
      revision: "133a3e17557d191f5ad8d8c7574556ca31f06ab0"
  license "Apache-2.0"
  version_scheme 1
  head "https://github.com/vsnv/gai", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on xcode: ["14.0", :build]

  uses_from_macos "swift"

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/gai" 
  end

  test do
    (testpath/"test.swift").write " print(  \"Hello, World\"  ) ;"
    assert_equal "print(\"Hello, World\")\n", shell_output("#{bin}/gai test.swift")
  end
end
