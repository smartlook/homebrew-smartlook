require "language/node"

class SmartlookCrashReports < Formula
  desc "CLI tool for uploading Apple and Android mapping files to the Smartlook"
  homepage "https://smartlook.com"
  url "https://registry.npmjs.org/@smartlook/smartlook-crash-reports-cli/-/smartlook-crash-reports-cli-2.1.2.tgz"
  sha256 "1bc1b1b0d2e5a22483ecc4822886996a5d103b1fca4e4fff509c8176fdad52bb"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/smartlook-crash-reports --version")
    assert_match(/ 2\.1\.2/, output)
  end
end
