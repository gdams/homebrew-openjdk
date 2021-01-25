# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk15-openj9" do
  version "15.0.2,7"
  sha256 "3c8027cc21b1cfaf0aa2c75f2af55a940cd4f530945f45e02730d68f631fa9c4"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/download/jdk-15.0.2%2B7_openj9-0.24.0}/OpenJDK15U-jdk_x64_mac_openj9_15.0.2_7_openj9-0.24.0.pkg",
      verified: "https://github.com/AdoptOpenJDK"
  appcast "https://github.com/AdoptOpenJDK/openjdk#{version.major}-binaries/releases/latest"
  name "AdoptOpenJDK 15 (OpenJ9)"
  desc "AdoptOpenJDK OpenJDK (Java) Development Kit"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK15U-jdk_x64_mac_openj9_15.0.2_7_openj9-0.24.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.15-openj9.jdk"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.15-openj9.jdk"
end
