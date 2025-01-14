class NodeSass < Formula
  require "language/node"

  desc "JavaScript implementation of a Sass compiler"
  homepage "https://github.com/sass/dart-sass"
  url "https://registry.npmjs.org/sass/-/sass-1.66.0.tgz"
  sha256 "758071807581b55fdabdd62999cd5dc15dfa8d5a045ee002be46b06b69e0314c"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "d8491779b0f4d22295995862141657d1988209b3264b96cb838639df3599c127"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "d8491779b0f4d22295995862141657d1988209b3264b96cb838639df3599c127"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "d8491779b0f4d22295995862141657d1988209b3264b96cb838639df3599c127"
    sha256 cellar: :any_skip_relocation, ventura:        "d8491779b0f4d22295995862141657d1988209b3264b96cb838639df3599c127"
    sha256 cellar: :any_skip_relocation, monterey:       "d8491779b0f4d22295995862141657d1988209b3264b96cb838639df3599c127"
    sha256 cellar: :any_skip_relocation, big_sur:        "d8491779b0f4d22295995862141657d1988209b3264b96cb838639df3599c127"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "13bc31035064dcfa147fe7789daf310294cd8b725abca166bd506f103196f1a1"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"test.scss").write <<~EOS
      div {
        img {
          border: 0px;
        }
      }
    EOS

    assert_equal "div img{border:0px}",
    shell_output("#{bin}/sass --style=compressed test.scss").strip
  end
end
