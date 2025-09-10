{ config, pkgs, pkgs-unstable, nix-ai-tools, ... }:
let
  aiTools = nix-ai-tools.packages.${pkgs.system};
in
{
  # programs.vesktop.enable = true;

  home.packages = with pkgs; [
    # Base Utils
    neovim wget curl git btop tmux
    microfetch fastfetch

    # Code editor
    neovim
    unstable.zed-editor-fhs
    unstable.vscode-fhs
    unstable.kiro-fhs

    # Massenger
    telegram-desktop vesktop

    # Terminal
    alacritty wezterm

    # Browser
    librewolf brave

    # Video
    vlc
    unstable.kdePackages.kdenlive

    # Git утилиты
    git lazygit
    jujutsu lazyjj

    # AI инструменты
    aiTools.opencode
    aiTools.qwen-code
    aiTools.gemini-cli
    aiTools.claude-code-router
    aiTools.crush
  ];

  # Настройки shell
  programs = {
    bash.enable = true;
    zsh.enable = true;
    fish.enable = true;

    # Добавить другие программы по необходимости
  };
}
