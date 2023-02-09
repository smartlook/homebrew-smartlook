require "language/node"

class SmartlookCrashReportsCli < Formula
  desc "CLI tool for uploading crash mapping files to the Smartlook"
  homepage "https://www.npmjs.com/package/@smartlook/smartlook-crash-reports-cli"
  url "https://registry.npmjs.org/@smartlook/smartlook-crash-reports-cli/-/smartlook-crash-reports-cli-2.1.4.tgz"
  sha256 "feba2d06d1549aa43a9d8e5c006abd7eb7691a7fb09515ab2cac69420040dfa0"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/smartlook-crash-reports --version")
    assert_match(/ 2\.1\.4/, output)
  end
end
