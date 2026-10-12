cask "cavvy" do
  version "1.2.0,9"
  sha256 "db4ac2c3fdee2421cda8adfe39ed6584f976b5f0b82ed9cd37de844e72fbbe95"

  url "https://cavvy.app/downloads/Cavvy-#{version.csv.first}-#{version.csv.second}.dmg"
  name "Cavvy"
  desc "Native home for coding agents"
  homepage "https://cavvy.app/"

  livecheck do
    url "https://cavvy.app/updates/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Cavvy.app"
  binary "#{appdir}/Cavvy.app/Contents/Helpers/cavvy"

  uninstall launchctl: "dev.cavvy.daemon",
            quit:      "dev.cavvy.app",
            script:    {
              executable:   "/usr/bin/pkill",
              args:         ["-f", "Cavvy.app/Contents/MacOS/cavvyd"],
              must_succeed: false,
            }

  zap trash: [
    "~/Library/Application Support/cavvy",
    "~/Library/Application Support/dev.cavvy.app",
    "~/Library/Caches/dev.cavvy.app",
    "~/Library/HTTPStorages/dev.cavvy.app",
    "~/Library/Preferences/dev.cavvy.app.plist",
    "~/Library/Saved Application State/dev.cavvy.app.savedState",
  ]
end
