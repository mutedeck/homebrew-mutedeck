cask 'homebrew' do
  arch arm: 'aarch64', intel: 'x86-64'

  desc 'MuteDeck'
  homepage 'https://mutedeck.com'
  version '2.4.1'

  on_arm do
    url "https://releases.mutedeck.com/#{version}/macos-arm/mutedeck-mac-arm.dmg"
    sha256 'affe5bc1cdf0b5b1cb5532acff69a7d2861005abea5bb5e64f2fa245f27e69d8'
  end
  on_intel do
    url "https://releases.mutedeck.com/#{version}/macos/mutedeck-mac.dmg"
    sha256 '9daad9db3c2e3c70bfafb6909575d0e17ec78fe88057283902032bc243bc0a91'
  end

  installer script: {
    executable: "MuteDeck-#{version}-Installer.app/Contents/MacOS/MuteDeck-#{version}-Installer",
    args: ['--root', '/Applications/MuteDeck', '--accept-messages', '--accept-licenses', '--confirm-command',
           '--cache-path', "#{staged_path}/cache", 'install']
  }

  uninstall script: {
    executable: '/Applications/MuteDeck/MuteDeckMaintenanceTool.app/Contents/MacOS/MuteDeckMaintenanceTool',
    args: ['--confirm-command', 'remove', 'com.mutedeck.client']
  }
end
