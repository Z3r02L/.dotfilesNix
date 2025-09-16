{ pkgs, aliases, commonInitContent, ... }:
let
  # Установка алиасов для Fish
  fishAliases = builtins.concatStringsSep "\n" (
    map (name: "alias ${name} '${aliases.${name}}'") (builtins.attrNames aliases)
  );
in
{
  enable = true;
  shellInit = ''
    ${fishAliases}
  '' + commonInitContent;
}
