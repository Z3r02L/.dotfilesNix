{ pkgs, lib, ... }:

let
  librewolf = pkgs.librewolf;
  curl = pkgs.curl;
  url = "https://addons.mozilla.org/firefox/downloads/latest";
  plugins = [
    # Список расширений в формате их URL на addons.mozilla.org или ID
    "https://addons.mozilla.org/firefox/downloads/latest/simple-translate/latest.xpi"
    "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi"
    "https://addons.mozilla.org/firefox/downloads/latest/https-everywhere/latest.xpi"
    "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi"
    "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi"
    "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi"
    "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi"
    "https://addons.mozilla.org/firefox/downloads/latest/styl-us/latest.xpi"
    "https://addons.mozilla.org/firefox/downloads/latest/istilldontcareaboutcookies/latest.xpi"
    "https://addons.mozilla.org/firefox/downloads/latest/plasma-integration/latest.xpi"
    "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi"
  ];

  # Директория для расширений в профиле пользователя
  extensionsDir = "$HOME/.librewolf/extensions/";
in
{
  # Скрипт для загрузки расширений при активации профиля
  home.activation.installLibrewolfPlugins = ''
    mkdir -p ${extensionsDir}
    for url in ${lib.concatStringsSep " " plugins}; do
      pluginFile="${extensionsDir}$(basename "$url")"
      if [ ! -f "$pluginFile" ]; then
        ${curl}/bin/curl -L -o "$pluginFile" "$url"
      fi
    done
  '';
}
