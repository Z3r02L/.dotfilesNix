{ pkgs, aliases, commonInitContent, ... }:
let
  # Установка алиасов для Zsh
  zshAliases = builtins.concatStringsSep "\n" (
    map (name: "alias ${name}='${aliases.${name}}'") (builtins.attrNames aliases)
  );
in
{
  enable = true;
  enableCompletion = true;
  completionInit = ''
    autoload -Uz compinit
    compinit
  '';
  history = {
    ignoreSpace = true;
    extended = true;
    share = true;
    size = 10000;
  };
  # Плагины (примеры)
  plugins = [
    # {
    #   name = "zsh-syntax-highlighting";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "zsh-users";
    #     repo = "zsh-syntax-highlighting";
    #     rev = "0.7.1";
    #     sha256 = "sha256-R4X1wIu87YhHh3w9n9r5/vX/L50Q7u2w+1+0k6y0g/g="; # Обновите SHA256
    #   };
    # }
    # {
    #   name = "zsh-autosuggestions";
    #   src = pkgs.fetchFromGitHub {
    #     owner = "zsh-users";
    #     repo = "zsh-autosuggestions";
    #     rev = "v0.7.0";
    #     sha256 = "sha256-Q3Q3Q3Q3Q3Q="; # Обновите SHA256
    #   };
    # }
  ];
  initContent = ''
    ${zshAliases}
  '' + commonInitContent;
}
