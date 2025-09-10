# modules/development/default.nix
{ config, pkgs, ... }:
let
  unstable = pkgs.unstable;
in
{
  imports = [
    ./languages.nix
    ./tools.nix
    ./ides.nix
  ];

  # Установить инструменты разработки
  environment.systemPackages = with pkgs; [
    # Compilers
    gcc clang rustc go
    nodejs_22 nodejs_24
    unstable.bun

    # Package managers
    pnpm
    unstable.uv
    unstable.bun

    # Build tools
    cmake meson ninja

    # LSP и формatters

    nodePackages.typescript-language-server
    unstable.biome
    # node_modules.vscode-langservers-extracted
    rust-analyzer
    gopls
    python3.pkgs.python-lsp-server
    lua-language-server

    # Version control
    git-crypt
    git-lfs
    gh

    # Testing
    # pytest # ошибка
    cargo
    cargo-watch
  ];
}
