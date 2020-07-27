cask "themeengine" do
  if MacOS.version <= :yosemite
    version "0.0.4"
    sha256 "35a99145577cb300e2383d3432b47c13907e5d6ca24e720c44a83f4a1f990f4a"

    url "https://github.com/alexzielenski/ThemeEngine/releases/download/#{version}/ThemeEngine.zip"
  else
    version "1.0.0,111"
    sha256 "2f7039bf8a30a20da20b292252759a501d15962f909d3b2274db9c2ec7a3bf39"

    url "https://github.com/alexzielenski/ThemeEngine/releases/download/#{version.before_comma}(#{version.after_comma})/ThemeEngine_111.zip"
    appcast "https://github.com/alexzielenski/ThemeEngine/releases.atom"
  end

  name "ThemeEngine"
  homepage "https://github.com/alexzielenski/ThemeEngine/"

  app "ThemeEngine.app"

  zap trash: "~/Library/Preferences/com.alexzielenski.ThemeEngine.LSSharedFileList.plist"
end
