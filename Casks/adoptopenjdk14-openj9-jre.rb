# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk14-openj9-jre" do
  version "14.0.2,12"
  sha256 "5e7a2770592b1f6d6138d6ed020b487f508b1562f30c6ba789cda836726bba51"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/download/jdk-14.0.2%2B12_openj9-0.21.0}/OpenJDK14U-jre_x64_mac_openj9_14.0.2_12_openj9-0.21.0.pkg",
      verified: "https://github.com/AdoptOpenJDK"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 14 (OpenJ9) (JRE)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK14U-jre_x64_mac_openj9_14.0.2_12_openj9-0.21.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.14-openj9.jre"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.14-openj9.jre"
end
