cask "metasploit" do
  version "6.3.31,20230824103119"
  sha256 "7225e55183d26b9bad680d5ae083465d803be23c1d1bf29a75e9a5d797c0708c"

  url "https://osx.metasploit.com/metasploit-framework-#{version.csv.first}%2B#{version.csv.second}-1rapid7-1.x86_64.pkg"
  name "Metasploit Framework"
  desc "Penetration testing framework"
  homepage "https://www.metasploit.com/"

  livecheck do
    url "https://osx.metasploit.com/LATEST"
    strategy :page_match do |page|
      match = page.match(/metasploit-framework-(\d+(?:\.\d+)+)\+(\d+)-1rapid7-1\.x86_64\.pkg/i)
      next if match.blank?

      "#{match[1]},#{match[2]}"
    end
  end

  depends_on formula: "nmap"

  pkg "metasploit-framework-#{version.csv.first}+#{version.csv.second}-1rapid7-1.x86_64.pkg"
  binary "/opt/metasploit-framework/bin/msfbinscan"
  binary "/opt/metasploit-framework/bin/msfconsole"
  binary "/opt/metasploit-framework/bin/msfd"
  binary "/opt/metasploit-framework/bin/msfdb"
  binary "/opt/metasploit-framework/bin/msfelfscan"
  binary "/opt/metasploit-framework/bin/msfmachscan"
  binary "/opt/metasploit-framework/bin/msfpescan"
  binary "/opt/metasploit-framework/bin/msfrop"
  binary "/opt/metasploit-framework/bin/msfrpc"
  binary "/opt/metasploit-framework/bin/msfrpcd"
  binary "/opt/metasploit-framework/bin/msfvenom"

  uninstall script: {
              executable: "/opt/metasploit-framework/bin/msfremove",
              input:      ["y"],
              sudo:       true,
            },
            rmdir:  "/opt/metasploit-framework"

  zap trash: "~/.msf4"
end
