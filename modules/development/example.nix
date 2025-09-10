# modules/development/default.nix
{ config, pkgs, ... }:
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

    # Build tools
    cmake meson ninja

    # LSP и формatters
    nodePackages.typescript-language-server
    node_modules.vscode-langservers-extracted
    rust-analyzer
    gopls
    python3.pkgs.python-lsp-server
    lua-language-server

    # Version control
    git-crypt
    git-lfs
    gh

    # Testing
    pytest
    cargo
    cargo-watch
  ];
}
