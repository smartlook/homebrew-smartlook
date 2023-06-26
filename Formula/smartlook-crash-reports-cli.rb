require "language/node"

class SmartlookCrashReportsCli < Formula
  desc "CLI tool for uploading crash mapping files to the Smartlook"
  homepage "https://www.npmjs.com/package/@smartlook/smartlook-crash-reports-cli"
  url "https://registry.npmjs.org/@smartlook/smartlook-crash-reports-cli/-/smartlook-crash-reports-cli-2.1.9.tgz"
  sha256 "de1204246a493d97b2a4587037f969712ea7480194e84cd84fd2396cf25c449a"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/smartlook-crash-reports --version")
    assert_match(/ 2\.1\.9/, output)
  end
end
