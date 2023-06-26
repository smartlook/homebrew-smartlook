require "language/node"

class SmartlookCrashReportsCli < Formula
  desc "CLI tool for uploading crash mapping files to the Smartlook"
  homepage "https://www.npmjs.com/package/@smartlook/smartlook-crash-reports-cli"
  url "https://registry.npmjs.org/@smartlook/smartlook-crash-reports-cli/-/smartlook-crash-reports-cli-2.1.10.tgz"
  sha256 "f84af90396991266db5b63c80b52d54e3a4aea714f96e9ba9e4190de0603e571"
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
