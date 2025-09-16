{ pkgs, aliases, commonInitContent }:

{
  enable = true;
  shellAliases = aliases;
  initExtra = ''
    # Установка алиасов
    ${builtins.concatStringsSep "\n    " (map (name: "${name}=${aliases.${name}}") (builtins.attrNames aliases))}
  '' + commonInitContent;
}
