cask "cavvy" do
  version "0.1.0,1"
  sha256 "54fa1f9f5797de47d397518767a40dc0148c36db53ad190010b12f8d5e2b612b"

  url "https://cavvy.app/downloads/Cavvy-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Cavvy"
  desc "Native home for coding agents"
  homepage "https://cavvy.app/"

  livecheck do
    url "https://cavvy.app/updates/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Cavvy.app"
  binary "#{appdir}/Cavvy.app/Contents/Helpers/cavvy"

  uninstall launchctl: "dev.cavvy.daemon",
            quit:      "dev.cavvy.app"

  zap trash: [
    "~/Library/Application Support/cavvy",
    "~/Library/Application Support/dev.cavvy.app",
    "~/Library/Caches/dev.cavvy.app",
    "~/Library/HTTPStorages/dev.cavvy.app",
    "~/Library/Preferences/dev.cavvy.app.plist",
    "~/Library/Saved Application State/dev.cavvy.app.savedState",
  ]
end
