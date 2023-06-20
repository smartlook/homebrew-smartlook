require "language/node"

class SmartlookCrashReportsCli < Formula
  desc "CLI tool for uploading crash mapping files to the Smartlook"
  homepage "https://www.npmjs.com/package/@smartlook/smartlook-crash-reports-cli"
  url "https://registry.npmjs.org/@smartlook/smartlook-crash-reports-cli/-/smartlook-crash-reports-cli-2.1.6.tgz"
  sha256 "861e209cde92799e04a83a236cdbafc6f9328c10b94cc173cd7f0d4d5e41d6dd"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/smartlook-crash-reports --version")
    assert_match(/ 2\.1\.6/, output)
  end
end
